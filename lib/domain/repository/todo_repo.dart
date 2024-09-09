/*
 Todo Repository

 Here you define what the app is doing 

*/

import 'package:todo/domain/models/todo.dart';

abstract class TodoRepo {

  //  i want to give a name here but be able to change  it when i'm implementing with other class else use the default
  String get name => 'TodoRepo';

  // get list of todos
  Future<List<Todo>> getTodos();

  // add a new todo
  Future<void> addTodo(Todo newTodo);

  // update an existing todo
  Future<void> updateTodo(Todo todo);

  // delete a todo
  Future<void> deleteTodo(Todo todo);
}


// This repo outlines what operations the app can do, but doesn't worry about the specific implementation details
// This is purely a dart file is not bother about the framework