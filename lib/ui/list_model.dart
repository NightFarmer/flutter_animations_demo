import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/task.dart';
import 'package:flutter_demo/ui/task_row.dart';

class ListModel{
 
  final List<Task> items;
  final GlobalKey<AnimatedListState> listKey;
  int get length => items.length;
  ListModel(this.listKey, items) : this.items  = new List.of(items);
  AnimatedListState get _animationList => listKey.currentState;
  void insert(int index,Task item){
    items.insert(index, item);
    _animationList.insertItem(index, duration: new Duration(milliseconds: (150 + 200*(index/length)).toInt()));
  }
  Task removeAt(int index) {
    final Task removedItem = items.removeAt(index);
    if (removedItem != null) {
      _animationList.removeItem(
        index,
        (context, animation) => new TextRow(
              task: removedItem,
              animation: animation,
            ),
        duration: new Duration(milliseconds: (150 + 200*(index/length)).toInt())
      );
    }
    return removedItem;
  }
  Task operator [](int index) => items[index];
  int indexOf(Task item) => items.indexOf(item);

}