import 'package:get/get.dart';
import 'package:getx_tutorial/homepage.dart';
import 'package:getx_tutorial/obx/get_builder.dart';
import 'package:getx_tutorial/obx/obx.dart';
import 'package:getx_tutorial/obx/option_page.dart';
import 'package:getx_tutorial/obx/sumxy/mainxy.dart';
import 'package:getx_tutorial/sdb/plusmin.dart';
import 'package:getx_tutorial/sdb/first_screen.dart';
import 'package:getx_tutorial/sdb/second_screen.dart';

List<GetPage> router = [
  GetPage(name: '/', page: () => Homepage()),
  GetPage(name: '/plusmin', page: () => Plusmin()),

  //obx page
  GetPage(name: '/obx', page: () => OptionPage()),
  GetPage(name: '/obx/get_builder_screen', page: () => GetBuilderScreen()),
  GetPage(name: '/obx/obx_screen', page: () => ObxScreen()),
  GetPage(name: '/obx/main_XY_screen', page: () => MainXYScreen()),

  //sdb page
  GetPage(name: '/sdb', page: () => FirstScreen()),
  GetPage(name: '/sdb/second_screen', page: () => SecondScreen()),
];
