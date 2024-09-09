import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/presentation/todo_state.dart';
// import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super(TodoInitial(const []));

  String get name => todoRepo.name;

  // load
  Future<void> loadTodo() async {
    try {
      emit(TodoLoading());
      final todos = await todoRepo.getTodos();
      emit(TodoSuccess(todos)); // loads the todo in the stored database
    } catch (e) {
      emit(TodoFailure(e.toString()));
    }
  }

  // add
  Future<void> addTodo({required String name}) async {
    try {
      final newTodo = Todo(
        id: id(),
        name: name,
      );
      emit(TodoLoading());
      await todoRepo.addTodo(newTodo);
      loadTodo();
    } catch (e) {
      emit(TodoFailure(e.toString()));
    }
  }

  // delete
  Future<void> deleteTodo({required Todo todo}) async {
    try {
      emit(TodoLoading());
      await todoRepo.deleteTodo(todo);
      loadTodo();
    } catch (e) {
      emit(TodoFailure(e.toString()));
    }
  }

  // toggle
  Future<void> isComplete({required Todo todo}) async {
    try {
      final updateTodo = todo.toggleComplete();
      emit(TodoLoading());
      await todoRepo.updateTodo(updateTodo);
      loadTodo();
    } catch (e) {
      emit(TodoFailure(e.toString()));
    }
  }

  // update repository
  void updateRepo(TodoRepo newRepo) {
    todoRepo = newRepo;
    loadTodo();
  }
}

/// Generates a random number with the specified number of digits.
int id() {
  return DateTime.now().millisecondsSinceEpoch + 100000000000012;
}
