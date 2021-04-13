import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FactoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cat = Animal('cat', 'Kiri');
    var dog = Animal('dog', 'Paco');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TitleWidget("作用"),
        SubtitleWidget("当你使用factory关键词时，你能控制在使用构造函数时，并不总是创建一个新的该类的对象，比如它可能会从缓存中返回一个已有的实例，或者是返回子类的实例。"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  cat.getNoise();
                },
                child: Text("猫-🐱")),
            ElevatedButton(
                onPressed: () {
                  dog.getNoise();
                },
                child: Text("狗-🐕")),
          ],
        ),
      ],
    );
  }
}

abstract class Animal {
  String name;

  void getNoise();

  factory Animal(String type, String name) {
    switch (type) {
      case "cat":
        return Cat(name);
      case "dog":
        return new Dog(name);
      default:
        throw "The '$type' is not an animal";
    }
  }
}

class Cat implements Animal {
  @override
  String name;

  Cat(this.name);

  @override
  void getNoise() {
    Get.snackbar('${this.name}', '喵喵喵喵喵喵！',snackPosition: SnackPosition.BOTTOM);
  }
}

class Dog implements Animal {
  @override
  String name;

  Dog(this.name);

  @override
  void getNoise() {
    Get.snackbar('${this.name}', '汪汪汪汪汪汪！',snackPosition: SnackPosition.BOTTOM);
  }
}
