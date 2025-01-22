import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _hasPermission = false;
  bool _isFlashOn = false;

  late MobileScannerController _scannerController;

  @override
  void initState() {
    _scannerController = MobileScannerController();
    _getPermission();
    super.initState();
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  Future<void> _getPermission() async {
    final permissionStatus = await Permission.camera.request();
    setState(() {
      _hasPermission = permissionStatus.isGranted;
    });
  }

  Future<void> _processScannedData(String? data) async {
    if(data == null) return;

    _scannerController.stop();

    String type = 'text';
    if(data.startsWith('https://') || data.startsWith('http://')) {
      type = 'url';
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        minChildSize: 0.4,
        maxChildSize: 0.6,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius:const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: const Center(
            child: Column(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text("Presença confirmada!")
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    if(!_hasPermission) {
      return Scaffold(
        backgroundColor: color.tertiary,
        appBar: AppBar(
          surfaceTintColor: color.tertiary,
          backgroundColor: color.tertiary,
          title: const Text("Escanear QR Code"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 350,
                child: Card(
                  elevation: 0,
                  child: Padding(padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          size: 64,
                        ),
                        const SizedBox(height: 16),
                        const Text("É necessário que o uso da câmera seja permitido"),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _getPermission,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color.primary,
                            foregroundColor: color.surface,
                          ),
                          child: const Text("Conceder Permissão"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }else {
      return Scaffold(
        backgroundColor: color.tertiary,
        appBar: AppBar(
          surfaceTintColor: color.tertiary,
          backgroundColor: color.tertiary,
          title: const Text("Escanear QR Code"),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isFlashOn = !_isFlashOn;
                  _scannerController.toggleTorch();
                });
              },
              icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
            )
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
              controller: _scannerController,
              onDetect: (capture) {
                final barcode = capture.barcodes.first;
                if(barcode.rawValue != null) {
                  final String code = barcode.rawValue!;
                  _processScannedData(code);
                }
              },
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Text("Alinhe o QR Code ao centro da câmera", style: TextStyle(
                  backgroundColor: color.tertiary.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
              ),
            ),
          ],
        ),
      );
    }
  }
}