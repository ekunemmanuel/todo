/*
Isar Database Repo

This implements the todo repo and handles storing the data retrieving the data. writing into the db and deleting the data from isar db

*/

import 'package:isar/isar.dart';
import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  // the isatace of the database ISAR
  final Isar db;

  IsarTodoRepo({required this.db});

  @override
  Future<void> addTodo(Todo newTodo) async {
    // convert todo to isarTodo
    final isarTodo = IsarTodo.toIsar(newTodo);

    // add to database
    await db.writeTxn(() => db.isarTodos.put(isarTodo));
    return;
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final isarTodo = IsarTodo.toIsar(todo);

    await db.writeTxn(() => db.isarTodos.delete(isarTodo.isarId));
    return;
  }

  @override
  Future<List<Todo>> getTodos() async {
    // fetch from the database
    final todos = await db.isarTodos.where().findAll();

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // convert todo to isarTodo
    final isarTodo = IsarTodo.toIsar(todo);

    // add to database
    await db.writeTxn(() => db.isarTodos.put(isarTodo));
    return;
  }

  @override
  String get name => "Local Isar Database";
}
