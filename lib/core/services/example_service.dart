import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:my_tom/data/models/MyExampleDataObject.dart';

class ExampleService {
  final Dio _dio = Get.find<Dio>();

  Future<List<MyExampleDataObject>> getExampleElements() async {
    Response response = await _dio.get("example/getExampleElements");
    List<MyExampleDataObject> exampleElements =
        response.data.map<MyExampleDataObject>((rawExampleDataObject) => MyExampleDataObject.fromJson(rawExampleDataObject)).toList();
    exampleElements.sort((a, b) => b.name.compareTo(a.name));
    return exampleElements;
  }
}
