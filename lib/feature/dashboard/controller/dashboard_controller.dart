import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/home/screens/home_screen.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/custom_left_appbar.dart';
import 'package:ueh_project_admin/feature/employ/screens/employ_main_screen.dart';
import 'package:ueh_project_admin/feature/profile/screns/profile_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/create_project_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/task_screen.dart';

class DashboardController extends GetxController {
  var isOpened = false.obs;

  var pageIndex = 0.obs;

  void selectPage(int value) {
    pageIndex.value = value;
    update([Utils.idLeftNavigatorBar]);
  }

  void openAppBar() {
    isOpened.value = !isOpened.value;
  }

  late final leftAppBarWidget = Obx(() {
    return CustomLeftAppBar(
      isOpened: isOpened.value,
      widthDevice: Get.width,
      openAppBar: openAppBar,
      selectPage: selectPage,
    );
  });

  late final pages = Obx(
    () => IndexedStack(
      alignment: Alignment.center,
      index: pageIndex.value,
      children: [
        ProfileScreen(),
        HomeScreen(),
        EmployMainScreen(),
        TaskScreen(),
      ],
    ),
  );
}
