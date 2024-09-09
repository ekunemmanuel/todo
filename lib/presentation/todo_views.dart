import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/todo_cubit.dart';
import 'package:todo/presentation/todo_state.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return BlocConsumer<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state is TodoInitial) {
          final todos = state.todos;
          if (todos.isEmpty) {
            return const Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.hourglass_empty_outlined,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("You don't have any task")
              ],
            ));
          }
        } else if (state is TodoSuccess) {
          final todos = state.todos;
          if (todos.isEmpty) {
            return const Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.hourglass_empty_outlined,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("You don't have any task")
              ],
            ));
          }
          return ListView.separated(
            itemCount: todos.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(todos[index].name),
              leading: Checkbox(
                value: todos[index].isComplete,
                onChanged: (val) => todoCubit.isComplete(
                  todo: todos[index],
                ),
              ),
              trailing: IconButton(
                onPressed: () => todoCubit.deleteTodo(todo: todos[index]),
                icon: const Icon(Icons.cancel),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(height: 10),
          );
        } else if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                width: 200,
                child: Text(
                    'Something went wrong. Click on the load again button',
                    textAlign: TextAlign.center,
                    style: TextStyle()),
              ),
            ),
            TextButton(
              onPressed: () => todoCubit.loadTodo(),
              child: const Text('Reload'),
            )
          ],
        );
      },
      listener: (context, state) {
        if (state is TodoFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
          todoCubit.loadTodo();
        }
      },
    );
  }
}
