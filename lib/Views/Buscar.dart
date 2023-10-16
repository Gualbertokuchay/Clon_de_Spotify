import 'package:flutter/material.dart';

class SpotifySearch extends StatefulWidget {
  const SpotifySearch({Key? key}) : super(key: key);

  @override
  _SpotifySearchState createState() => _SpotifySearchState();
}

class _SpotifySearchState extends State<SpotifySearch> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                onSubmitted: (_) {
                  _performSearch();
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _searchQuery = "";
                });
              },
            ),
          ],
        ),
      ),
      body: _searchQuery.isNotEmpty
          ? ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.music_note,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Canción $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Artista $index',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'Realiza una búsqueda',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 18,
                ),
              ),
            ),
    );
  }
}


