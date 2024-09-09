import '../../domain/models/todo.dart';

class PocketbaseTodo {
  late String name;
  late int id;
  late bool isComplete;

  PocketbaseTodo();
  // Convert PocketbaseTodo to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'isComplete': isComplete,
    };
  }

  // Convert from JSON to PocketbaseTodo
  PocketbaseTodo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = int.parse(json['id']);
    isComplete = json['isComplete'];
  }

  // Convert from PocketbaseTodo to Todo model
  Todo toDomain() {
    return Todo(id: id, name: name, isComplete: isComplete);
  }

  // Convert from Todo model to PocketbaseTodo
  static PocketbaseTodo fromDomain(Todo todo) {
    return PocketbaseTodo()
      ..id = todo.id
      ..name = todo.name
      ..isComplete = todo.isComplete;
  }
}
