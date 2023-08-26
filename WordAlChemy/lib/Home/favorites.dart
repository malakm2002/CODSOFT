import 'package:flutter/material.dart';
import 'package:word_alchemy/Database/AccessDB.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late Future<List<String>> _favoriteQuotesFuture;

  @override
  void initState() {
    super.initState();
    _favoriteQuotesFuture = AccessDB.getCurrentUserFavs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Quote',
          style: TextStyle(color: Color.fromARGB(255, 194, 90, 124)),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<String>>(
        future: _favoriteQuotesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Color.fromARGB(255, 194, 90, 124),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No favorite quotes.'),
            );
          } else {
            List<String>? favoriteQuotes = snapshot.data;
            return ListView.builder(
              itemCount: favoriteQuotes?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? const Color.fromARGB(255, 194, 90, 124)
                        : const Color.fromARGB(255, 224, 139, 162),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    title: Text(favoriteQuotes![index]),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              String? removedQuote = favoriteQuotes[index];
                              AccessDB.quoteFavorite(removedQuote, false);
                              favoriteQuotes.removeAt(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              String? removedQuote = favoriteQuotes[index];
                              AccessDB.quoteFavorite(removedQuote, false);
                              favoriteQuotes.removeAt(index);
                            },
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    contentPadding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 20),
                    autofocus: true,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
