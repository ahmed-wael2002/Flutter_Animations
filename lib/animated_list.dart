import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  final Duration duration;
  final Curve curve;

  const AnimatedListExample({super.key, required this.duration, required this.curve});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = List.generate(10, (index) => index); // Initial list of items

  void _removeItem(int index) {
    final int removedItem = _items[index];
    _items.removeAt(index);

    _listKey.currentState!.removeItem(
      index, (context, animation) {
        return _buildAnimatedItem(removedItem, animation, isRemoved: true);
      },
      duration: widget.duration,
    );
  }

  Widget _buildAnimatedItem(int item, Animation<double> animation, {bool isRemoved = false}) {
    return SlideTransition(
      // sizeFactor: animation,
      // axisAlignment: 0.0,
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ),
      ),
      child: ListTile(
        title: Text('Item $item'),
        trailing: isRemoved
            ? null
            : IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            final int index = _items.indexOf(item);
            _removeItem(index);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _items.length,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int index, Animation<double> animation) {
        return _buildAnimatedItem(_items[index], animation);
      },
    );
  }
}
