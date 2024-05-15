import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

class AppController extends GetxController {
  var counter = 0.obs;
  void add() => counter.value++;
  void subtract() => counter.value--;
 }

 class MyWidget extends StatelessWidget {
  final AppController controller = Get.put(AppController());
  MyWidget({super.key});
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('GetX Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('O valor do contador é :',
              style: TextStyle(fontSize: 25.0)),
              Obx(() => Text(
                      '${controller.counter.value}',
                      style: const TextStyle(
                        fontSize: 40.0,
                      ),
                    )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    child: const Text('Vá para a segunda tela'),
                    onPressed: () {
                      Get.to(SecondPage());
                    },
                  ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: controller.add,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: controller.subtract,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
    }
 }

 class SecondPage extends StatelessWidget {
  final AppController controller = Get.find();
  SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'O valor no controller é:',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            Obx(() => Text(
                      '${controller.counter.value}',
                      style: const TextStyle(
                        fontSize: 40.0,
                      ),
                    )),
          ],
        ),
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: controller.add,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: controller.subtract,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
    }
  }