import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:todo/data/simple_result.dart';

import 'todo_api.dart';

class MockDio extends Mock implements Dio {}

void main() {
  test('getTodoList returns a list of todos', () async {
    final dio = MockDio();

    when(dio.get<List>('sweetodo/todo/list')).thenAnswer((_) async => Response(
            data: [
              {
                'todoName': 'Test Todo',
                'scope': 'Test Scope',
                'date': '2022-01-01'
              }
            ],
            statusCode: 200,
            requestOptions: RequestOptions(path: 'sweetodo/todo/list')));

    final todoApi = TodoApi.instance;

    final result = await todoApi.getTodoList();

    expect(result.isSuccess, true);
    //expect(result.success.first.todoName, 'Test Todo');
  });
}
