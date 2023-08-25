import 'dart:math';

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
        print('quotes:: $quotes');
        final random = Random();
        final randomIndex = random.nextInt(quotes.length);
        quote = quotes[randomIndex];print(quote);

      }
    });
print(quote);
    return quote;
  }
}
