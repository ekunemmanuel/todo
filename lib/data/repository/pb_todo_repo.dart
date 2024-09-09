import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/data/models/pb_todo.dart';
import 'package:pocketbase/pocketbase.dart';

class PocketbaseTodoRepo implements TodoRepo {
  final PocketBase pocketBase;

  PocketbaseTodoRepo({required this.pocketBase});

  @override
  Future<void> addTodo(Todo todo) async {
    try {
      // convert to pocketbase model
      PocketbaseTodo pocketbaseTodo = PocketbaseTodo.fromDomain(todo);
      // convert to json
      final json = pocketbaseTodo.toJson();
      await pocketBase.collection('todos').create(body: json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      // convert to pocketbase model
      PocketbaseTodo pocketbaseTodo = PocketbaseTodo.fromDomain(todo);
      // convert to json
      final json = pocketbaseTodo.toJson();

      await pocketBase.collection('todos').delete(json['id']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      // get all the todos
      final result = await pocketBase.collection('todos').getFullList();

      final pocketbaseTodos = result
          .map((e) => PocketbaseTodo.fromJson({'id': e.id, ...e.data}))
          .toList();

      // return to domain format
      return pocketbaseTodos.map((e) => e.toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      // convert to pocketbase model
      PocketbaseTodo pocketbaseTodo = PocketbaseTodo.fromDomain(todo);
      // convert to json
      final json = pocketbaseTodo.toJson();

      await pocketBase.collection('todos').update(json['id'], body: json);
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  String get name => "Pocketbase Database";
}
