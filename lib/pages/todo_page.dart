//   //
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../models/todo.dart';
import '../providers/todo_provider.dart';
//  PARTS
//  PROVIDERS

//  //  /

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Page')),
      body: Consumer(
        builder: (context, ref, child) {
          List<Todo> todos = ref.watch(todoNotifierProvider);
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              Todo todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                leading: IconButton.filledTonal(
                  onPressed: () => buildUpdate(todo),
                  // ref.read(todoNotifierProvider.notifier).update(newTodo);

                  icon: const Icon(Icons.edit),
                ),
                trailing: IconButton.filledTonal(
                  onPressed: () {
                    ref.read(todoNotifierProvider.notifier).remove(todo.id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => buildAdd(),
        child: const Icon(Icons.add),
      ),
    );
  }

  // buildAdd(BuildContext context) {
  // buildAdd(BuildContext context, WidgetRef ref) {
  buildAdd() {
    final edtTitle = TextEditingController();
    final edtBody = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Add Todo'),
        contentPadding: const EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            controller: edtTitle,
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: edtBody,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(todoNotifierProvider.notifier)
                  .add(edtTitle.text, edtBody.text);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  buildUpdate(Todo oldTodo) {
    final edtTitle = TextEditingController();
    final edtBody = TextEditingController();
    edtTitle.text = oldTodo.title;
    edtBody.text = oldTodo.body;

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Update Todo'),
        contentPadding: const EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            controller: edtTitle,
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: edtBody,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Todo todoUpdated = oldTodo.copyWith(
                title: edtTitle.text,
                body: edtBody.text,
              );
              ref.read(todoNotifierProvider.notifier).update(todoUpdated);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
  // //
}
