import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/classes/MyExampleDataObject.dart';
import 'package:my_tom/services/example_service.dart';
import 'package:my_tom/widgets/example/example_list_item.dart';

class ExampleController extends GetxController {
  static ExampleController get to => Get.find();
}

class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExampleController());
  }
}

class ExamplePage extends GetView<ExampleController> {
  ExamplePage({super.key});

  final ExampleService _exampleService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MyExampleDataObject>>(
        future: _exampleService.getExampleElements(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading..."),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) => ExampleListItemWidget(
                exampleDataObject: snapshot.data[index],
              ),
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context, int index) => Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(0.0),
                child: Divider(color: Colors.black.withAlpha(20), thickness: 2),
              ),
            );
          }
        },
      ),
    );
  }
}
