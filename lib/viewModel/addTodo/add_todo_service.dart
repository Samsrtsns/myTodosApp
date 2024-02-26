import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newtodoapp/model/todosmodel/todos.dart';

class FireStoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> addTodo(MyTodosModel todo) async {
    try {
      await _firestore.collection('todos').add(
        {
          'firstText': todo.firstText,
          'secondText': todo.secondText,
        },
      );
      print("Todo added to Firestore");
    } catch (e) {
      print('Error adding todo to Firestore: $e');
    }
  }
}
