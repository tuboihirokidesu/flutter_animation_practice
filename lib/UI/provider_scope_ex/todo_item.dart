import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/provider_scope_ex/todo_list_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoItemTile extends ConsumerWidget {
  const TodoItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: todo
    // TODOアイテムのIndexを取得
    final index = ref.watch(currentTodoIndex);
    return ListTile(title: Text('$index番目のTODO'));
  }
}
