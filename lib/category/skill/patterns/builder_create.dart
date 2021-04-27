import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {
  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  String foodList = '';

  @override
  Widget build(BuildContext context) {
    MealBuilder mealBuilder = MealBuilder();
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWidget("模式分析"),
          SubtitleWidget(
              "建造者模式（Builder Pattern）使用多个简单的对象一步步构建成复杂的对象，它提供了创建对象的最佳方式。"),
          SubtitleWidget('一个 Builder 类会一步一步构造最终的对象。该 Builder 类是独立于其他对象的。'),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      SetMeal vegMeal = mealBuilder.prepareVegMeal();
                      foodList = vegMeal.showFoods();
                      setState(() {});
                    },
                    child: Text("养生套餐")),
                ElevatedButton(
                    onPressed: () {
                      SetMeal hapMeal = mealBuilder.prepareHapMeal();
                      foodList = hapMeal.showFoods();
                      setState(() {});
                    },
                    child: Text("快乐套餐")),
              ],
            ),
          ),
          SubtitleWidget(foodList),
        ],
      ),
    );
  }
}

/// 建造类（生成某款套餐）Director
class MealBuilder {
  SetMeal prepareVegMeal() {
    debugPrint('开始准备养生套餐...');
    SetMeal setMeal = SetMeal();
    setMeal.addItem(VegetableSalad());
    setMeal.addItem(Milk());
    return setMeal;
  }

  SetMeal prepareHapMeal() {
    debugPrint('开始准备快乐套餐...');
    SetMeal setMeal = SetMeal();
    setMeal.addItem(ChickenBurger());
    setMeal.addItem(Coke());
    return setMeal;
  }
}

/// 具体生成器（构造过程的不同实现）Concrete Builders
class SetMeal {
  List<Food> _foods = [];

  void addItem(Food food) => _foods.add(food);

  double getCost() {
    debugPrint('计算所有食品的总价');
    double cost = 0;
    for (var item in _foods) {
      cost += item.price;
    }
    return cost;
  }

  String showFoods() {
    debugPrint('展示所点的餐品');
    String list = '';
    for (var item in _foods) {
      debugPrint("餐品:" +
          item.name +
          ", 包装: " +
          item.packing().pack() +
          ", 价格:" +
          item.price.toString());
      list += ("餐品:" +
          item.name +
          ", 包装: " +
          item.packing().pack() +
          ", 价格:" +
          item.price.toString() +
          '\n');
    }
    return list;
  }
}

abstract class Food {
  String name;

  Packing packing();

  num price;
}

abstract class Salad implements Food {
  @override
  Packing packing() {
    return Plate();
  }
}

abstract class Burger implements Food {
  @override
  Packing packing() {
    return Wrapper();
  }
}

class VegetableSalad extends Salad {
  @override
  String name = '蔬菜沙拉';

  @override
  num price = 18.8;
}

class ChickenBurger extends Burger {
  @override
  String name = '鸡肉汉堡';

  @override
  num price = 22.5;
}

abstract class ColdDrink implements Food {
  @override
  Packing packing() {
    return Bottle();
  }
}

abstract class HotDrink implements Food {
  @override
  Packing packing() {
    return Glass();
  }
}

class Milk extends HotDrink {
  @override
  String name = '热牛奶';

  @override
  num price = 3.5;
}

class Coke extends ColdDrink {
  @override
  String name = '可乐';

  @override
  num price = 2.5;
}

abstract class Packing {
  String pack();
}

class Wrapper implements Packing {
  @override
  String pack() {
    return "纸袋";
  }
}

class Plate implements Packing {
  @override
  String pack() {
    return "盘子";
  }
}

class Bottle implements Packing {
  @override
  String pack() {
    return "瓶子";
  }
}

class Glass implements Packing {
  @override
  String pack() {
    return '玻璃杯';
  }
}
