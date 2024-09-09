import '../../domain/models/todo.dart';

class FirebaseTodo {
  late String name;
  late int id;
  late bool isComplete;

  FirebaseTodo();
  // Convert FirebaseTodo to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'isComplete': isComplete,
    };
  }

  // Convert from JSON to FirebaseTodo
  FirebaseTodo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = int.parse(json['id']);
    isComplete = json['isComplete'];
  }

  // Convert from FirebaseTodo to Todo model
  Todo toDomain() {
    return Todo(id: id, name: name, isComplete: isComplete);
  }

  // Convert from Todo model to FirebaseTodo
  static FirebaseTodo fromDomain(Todo todo) {
    return FirebaseTodo()
      ..id = todo.id
      ..name = todo.name
      ..isComplete = todo.isComplete;
  }
}
