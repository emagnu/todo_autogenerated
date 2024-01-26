//   //
//  Import LIBRARIES
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
//  Import FILES
import '../models/todo.dart';
//  PARTS  -- dart run build_runner watch --delete-conflicting-outputs
part 'todo_provider.g.dart';
//  PROVIDERS

//  //  /

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  List<Todo> build() {
    // throw UnimplementedError();
    return <Todo>[];
  }

  void add(String title, String body) {
    Todo newTodo = Todo(
      id: const Uuid().v4(),
      title: title,
      body: body,
    );
    // state.add(newTodo);
    state = [...state, newTodo];
  }

  void update(Todo newTodo) {
    int index = state.indexWhere((element) => element.id == newTodo.id);
    state[index] = newTodo;
    state = [...state];
  }

  void remove(String id) {
    state.removeWhere((element) => element.id == id);
    state = [...state];
  }
}
