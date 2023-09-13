import 'package:get/get.dart';
import 'package:getx_tutorial/homepage.dart';
import 'package:getx_tutorial/obx/get_builder.dart';
import 'package:getx_tutorial/obx/obx.dart';
import 'package:getx_tutorial/obx/option_page.dart';
import 'package:getx_tutorial/obx/sumxy/mainxy.dart';

class Routes {
  List<GetPage<dynamic>> router = [
    GetPage(name: '/homepage', page: () => Homepage()),
    GetPage(name: '/option_page', page: () => OptionPage()),
    GetPage(name: '/get_builder_screen', page: () => GetBuilderScreen()),
    GetPage(name: '/obx_screen', page: () => ObxScreen()),
    GetPage(name: '/main_XY_screen', page: () => MainXYScreen()),
  ];
}
