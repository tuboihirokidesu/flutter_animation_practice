import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/provider_scope_ex/todo_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentTodoIndex = Provider<int>((watch) => throw UnimplementedError());

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ProviderScope(
          overrides: [
            currentTodoIndex.overrideWithValue(index),
          ],
          child: const TodoItemTile(),
        );
      },
    );
  }
}
