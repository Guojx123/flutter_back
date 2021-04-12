import 'package:back/model/skill/skill_category.dart';
import 'package:back/pages/skill/skill_main_list_item.dart';
import 'package:flutter/material.dart';

class SkillMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开发技巧'),
        backgroundColor: Color(0xFF81BF4E).withOpacity(0.8),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF81BF4E).withOpacity(0.8),
        child: ListView.builder(
          itemBuilder: (context, index) {
            SkillItemCategory itemCategory = buildSkillCategoryList[index];
            return SkillMainPageListItem(
              itemCategory.name,
              itemCategory.itemList,
            );
          },
          itemCount: buildSkillCategoryList.length,
        ),
      ),
    );
  }
}
