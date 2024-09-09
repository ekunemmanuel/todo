import 'package:isar/isar.dart';
import 'package:todo/domain/models/todo.dart';

// to generate isar todo object, run dart run build_runner build
part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id isarId = Isar.autoIncrement; // Automatically incremented ID
  late String isarName; // Deferred initialization
  late bool isComplete; // Deferred initialization

  // Converts IsarTodo to domain Todo model
  Todo toDomain() {
    return Todo(id: isarId, name: isarName, isComplete: isComplete);
  }

  // Converts domain Todo model to IsarTodo
  static IsarTodo toIsar(Todo todo) {
    return IsarTodo()
      ..isarId = todo.id
      ..isarName = todo.name
      ..isComplete = todo.isComplete;
  }
}
