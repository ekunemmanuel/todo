import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/todo_cubit.dart';

import '../domain/repository/todo_repo.dart';
import 'todo_views.dart';

class TodoPage extends StatefulWidget {
  final List<TodoRepo> dbRepos;
  const TodoPage({super.key, required this.dbRepos});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isSelected = true;
  late TodoRepo selectedRepo;

  @override
  void initState() {
    super.initState();
    selectedRepo =
        widget.dbRepos.first; // Default repo is the first in the list
  }

  void _showTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    TextEditingController textEditingController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          decoration: InputDecoration(
            label: const Text('What do you have in mind'),
            hintText: 'Cook for the family',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: textEditingController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (textEditingController.text.isEmpty) {
                // Access ScaffoldMessenger using the parent context (not the dialog context)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Cannot store an empty task"),
                  ),
                );
              } else {
                todoCubit.addTodo(name: textEditingController.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('T O D O s'),
        centerTitle: true,
        actions: [
          DropdownButton<TodoRepo>(
            value: selectedRepo,
            onChanged: (TodoRepo? newRepo) {
              if (newRepo != null) {
                setState(() {
                  selectedRepo = newRepo;
                });
                todoCubit.updateRepo(newRepo);
              }
            },
            items: widget.dbRepos.map((TodoRepo repo) {
              return DropdownMenuItem<TodoRepo>(
                value: repo,
                child:
                    Text(repo.name), // Assuming TodoRepo has a toString method
              );
            }).toList(),
          ),
        ],
      ),
      body: const TodoView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTodoBox(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
