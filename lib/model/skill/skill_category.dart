import 'package:back/model/skill/skill_category_page_carousel.dart';
import 'package:back/widgets/demo_item.dart';
import 'package:back/model/skill/skill_category_design_patterns.dart';

List<SkillItemCategory> buildSkillCategoryList = [
  designPatternsCreate,
  carouselCreate
];

/// add item [SkillItemCategory]
SkillItemCategory designPatternsCreate = SkillItemCategory(
  name: '设计模式',
  itemList: buildDesignPatternsCreateDemoItems('lib/category/skill/patterns/'),
);

SkillItemCategory carouselCreate = SkillItemCategory(
  name: '页面轮播',
  itemList: buildCarouselCreateDemoItems('lib/category/skill/page_view/'),
);

class SkillItemCategory {
  final String name;
  final List<DemoItem> itemList;

  SkillItemCategory({this.name, this.itemList});
}