import 'package:back/Widgets/demo_item.dart';
import 'package:back/model/study/study_category_assets.dart';
import 'package:back/model/study/study_category_environment.dart';
import 'package:back/model/study/study_category_layout.dart';
import 'package:back/model/study/study_category_native.dart';
import 'package:back/model/study/study_category_network.dart';
import 'package:back/model/study/study_category_optimization.dart';
import 'package:back/model/study/study_category_route.dart';
import 'package:back/model/study/study_category_structure.dart';
import 'package:back/model/study/study_category_widgets.dart';

List<DemoItemCategory> buildStudyCategoryList = [
  environment,
  widgets,
  assets,
  appStructure,
  route,
  network,
  layout,
  native,
  optimization,
];

DemoItemCategory environment = DemoItemCategory(
  name: '1.Flutter开发环境',
  subName: '简介',
  icon: 'images/logo.png',
  list: buildEnvironmentDemoItems('lib/category/study/config/'),
);

DemoItemCategory widgets = DemoItemCategory(
  name: '2.基本Widget使用',
  subName: '简介',
  icon: 'images/stack.png',
  list: buildWidgetDemoItems('lib/category/study/widgets/'),
);

DemoItemCategory assets = DemoItemCategory(
  name: '3.Assets 资源、图片、图标',
  subName: '简介',
  icon: 'images/icon.png',
  list: buildAssetsDemoItems('lib/category/study/assets/'),
);

DemoItemCategory appStructure = DemoItemCategory(
  name: '4.应用程序结构',
  subName: '简介',
  icon: 'images/layout_structure_regions_mobile.png',
  list: buildStructureDemoItems('lib/category/study/structure/'),
);

DemoItemCategory route = DemoItemCategory(
  name: '5.页面路由',
  subName: '简介',
  icon: 'images/patterns-swipe-to-refresh.png',
  list: buildRouteDemoItems('lib/category/study/route/'),
);

DemoItemCategory network = DemoItemCategory(
  name: '6.网络请求与数据渲染',
  subName: '简介',
  icon: 'images/components_dialogs.png',
  list: buildNetworksDemoItems('lib/category/study/network/'),
);

DemoItemCategory layout = DemoItemCategory(
  name: '7.布局',
  subName: '简介',
  icon: 'images/padding.png',
  list: buildLayoutDemoItems('lib/category/study/layout/'),
);

DemoItemCategory native = DemoItemCategory(
  name: '8.与原生交互',
  subName: '简介',
  icon: 'images/cupertino-page-transition.png',
  list: buildNativeDemoItems('lib/category/study/native/'),
);

DemoItemCategory optimization = DemoItemCategory(
  name: '9.性能优化',
  subName: '简介',
  icon: 'images/custompaint.png',
  list: buildOptimizationDemoItems('lib/category/study/optimization/'),
);





