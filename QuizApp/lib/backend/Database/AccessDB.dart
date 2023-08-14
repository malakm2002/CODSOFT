import 'package:firebase_database/firebase_database.dart';

class AccessDB{
  DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
}