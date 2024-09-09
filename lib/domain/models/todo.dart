/* 

Todo model

This is what a todo object is 


it has an id, task name, a boolean for whether it has been acheive or not



*/

class Todo {
  final int id;
  final String name;
  final bool isComplete;

  Todo({
    required this.id,
    required this.name,
    this.isComplete = false,
  });

  // the method to toggle the when done

  Todo toggleComplete() {
    return Todo(
      id: id,
      name: name,
      isComplete: !isComplete,
    );
  }
}
