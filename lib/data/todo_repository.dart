import 'memory/vo_todo.dart';
import 'simple_result.dart';

abstract interface class TodoRepository<Error> {
  Future<SimpleResult<List<Todo>, Error>> getTodoList();
  Future<SimpleResult<void, Error>> addTodo(Todo todo);
  Future<SimpleResult<void, Error>> updateTodo(Todo todo);
  Future<SimpleResult<void, Error>> removeTodo(Todo todo);
}
