import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/widgets/search_input.dart';
import 'package:fitzone_app/screens/search_screen/widget/map_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  static const LatLng _pGooglePlex = LatLng(-5.8083926, -35.2121122);
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
      color: _color.tertiary,
      child: Padding(
        padding: const EdgeInsets.only(top: defaultSpacing),
        child: Column(
          children: [
            SearchInput(searchController: _searchController),
            const SizedBox(height: defaultSpacing),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage()),
                      );
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: _color.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: _color.surfaceContainerLow),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: _pGooglePlex, zoom: 2),
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) {
},
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                     onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapPage()),
                        );
                      },
                    child: SearchItem()),
                  SearchItem(),
                  SearchItem(),
                  SearchItem(),
                  SearchItem(),
                  SearchItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Container(
      width: 160,
      height: 200,
      decoration: ShapeDecoration(
        color: _color.surfaceContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: _color.surfaceContainerLow),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
