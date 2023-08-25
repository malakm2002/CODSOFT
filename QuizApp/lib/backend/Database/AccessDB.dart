import 'package:firebase_database/firebase_database.dart';

class AccessDB {
  static final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  // database: real-time database of firebase

  static Future<Map<String, Map<String, dynamic>>> getRandomQuestions(
      String category, int count) async {
    Map<String, Map<String, dynamic>> questions = {};
    var val;
    await _dbRef.child('questions').get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        (snapshot.value as Map).forEach((key, value) {
          if ((value['category'] as String).compareTo(category) == 0 &&
              questions.length < count) {
            questions[key] = {
              'question': value['question'],
              'options': value['options'],
              'correctAnswer': value['correctAnswer'],
              'category': value['category'],
            };
          }
        });
      }
    });

    return questions;
  }


  static Future<List<dynamic>> getCategories()async{
    List<dynamic> categories = [];
    await _dbRef.child('questions').get().then((DataSnapshot snapshot) => {
      if(snapshot.value!=null){
        (snapshot.value as Map).forEach((key, value) {
            categories.add((value as Map)['category']);
        })

      }
    });
    return categories;
  }

  static Future<void> addUserQuiz(dynamic answers) async{
    await _dbRef.child('quizzes').push().set(answers);

  }
}
