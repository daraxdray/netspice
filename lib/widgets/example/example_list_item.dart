import 'package:flutter/material.dart';
import 'package:my_tom/classes/MyExampleDataObject.dart';

class ExampleListItemWidget extends StatelessWidget {
  final MyExampleDataObject exampleDataObject;

  const ExampleListItemWidget({super.key, required this.exampleDataObject});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Example List Item'),
      subtitle: Text('This is an example list item'),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
