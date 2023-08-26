import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:word_alchemy/Database/Data.dart';

class AccessDB {
  static final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  static Future<void> addQuotes() async {
    await _dbRef.set(Data.quotes);
  }

  static Future<String> getRandomQuote() async {
    String quote = "No quote is pulled";
    List quotes;
    await _dbRef.child('quotes').get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        quotes = snapshot.value as List;
        final random = Random();
        final randomIndex = random.nextInt(quotes.length);
        quote = quotes[randomIndex];
      }
    });
    return quote;
  }

  static void quoteFavorite(String? quote, bool doFavorite) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final currentUserMail = currentUser?.email;
    // await _dbRef.child('users').push().set({'email': currentUserMail, 'favs': [quote]});
    await _dbRef.child('users').get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        var users = snapshot.value as Map;
        users.forEach((key, value) async {
          var userFavs = value as Map;
          var email = userFavs['email'] as String;
          if (email.compareTo(currentUserMail!) == 0) {
            List<String> userFavorites = [];
            userFavorites = (userFavs['favs'] as List)
                .cast<String>()
                .toList(growable: true); // Convert each element to String
            print('the user s favorites: $userFavorites');
            if(doFavorite){
              // Add the new quote to the list
              userFavorites.add(quote!);
            }
            else{ // Remove the quote from the list
              userFavorites.remove(quote);}


            // Update the database with the new list
            await _dbRef.child('users').child(key).update({
              'favs': userFavorites,
            });

            print('Quote added to favorites: $quote');
          }
        });
      }
    });
  }

}
