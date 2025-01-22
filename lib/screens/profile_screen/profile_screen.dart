import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/models/user_model.dart';
import '../../data/providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel? _currentUser;

  @override
  void didChangeDependencies() {
    _currentUser = Provider.of<UserProvider>(context).currentUser;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    Widget buildProfileField(String label, String? value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      );
    }

    Widget buildMatriculaField(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Matrícula',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _currentUser?.registrationId ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Color.fromRGBO(209, 245, 97, 1)),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _currentUser?.registrationId ?? ""));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Matrícula copiada para a área de transferência"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
    }
    
    return Container(
      color: color.tertiary,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProfileField('Nome', _currentUser?.name),
          const SizedBox(height: 16),
          buildProfileField('Apelido', _currentUser?.nickName),
          const SizedBox(height: 16),
          buildMatriculaField(context),
          const SizedBox(height: 16),
          buildProfileField('Data de Inscrição', _currentUser?.registrationDate.toString()),
        ],
      ),
    );
  }
}