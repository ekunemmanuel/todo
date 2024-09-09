import 'package:equatable/equatable.dart';
import 'package:todo/domain/models/todo.dart';

class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {
  final List todos;
  TodoInitial(this.todos);
}

class TodoSuccess extends TodoState {
  final List<Todo> todos;

  TodoSuccess(this.todos);
}

class TodoFailure extends TodoState {
  final String error;

  TodoFailure(this.error);
}

class TodoLoading extends TodoState {}
