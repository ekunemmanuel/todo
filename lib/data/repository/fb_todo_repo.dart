import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

import '../models/fb_todo.dart';

class FirebaseTodoRepo implements TodoRepo {
  final FirebaseFirestore firebaseFirestore;

  FirebaseTodoRepo({required this.firebaseFirestore});

  @override
  Future<void> addTodo(Todo todo) async {
    try {
      // convert to firebaseFirestore model
      FirebaseTodo firebaseTodo = FirebaseTodo.fromDomain(todo);
      // convert to json
      final json = firebaseTodo.toJson();
      await firebaseFirestore.collection('todos').doc(json["id"]).set(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      // convert to firebaseFirestore model
      FirebaseTodo firebaseTodo = FirebaseTodo.fromDomain(todo);
      // convert to json
      final json = firebaseTodo.toJson();

      await firebaseFirestore.collection('todos').doc(json['id']).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      // get all the todos
      final result = await firebaseFirestore.collection('todos').get();

      final firebaseTodos = result.docs
          .map((e) => FirebaseTodo.fromJson({'id': e.id, ...e.data()}))
          .toList();

      // return to domain format
      return firebaseTodos.map((e) => e.toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      // convert to firebaseFirestore model
      FirebaseTodo firebaseTodo = FirebaseTodo.fromDomain(todo);
      // convert to json
      final json = firebaseTodo.toJson();
      await firebaseFirestore.collection('todos').doc(json['id']).update(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  String get name => "Firebase Firestore Database";
}
