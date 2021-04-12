import 'package:back/widgets/demo_item.dart';
import 'package:back/model/skill/skill_category_design_patterns.dart';

List<SkillItemCategory> buildSkillCategoryList = [
  designPatternsCreate,
];

SkillItemCategory designPatternsCreate = SkillItemCategory(
  name: '设计模式',
  itemList: buildDesignPatternsCreateDemoItems('lib/category/skill/patterns/'),
);

class SkillItemCategory {
  final String name;
  final List<DemoItem> itemList;

  SkillItemCategory({this.name, this.itemList});
}