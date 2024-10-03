import 'package:get/get.dart';
import 'package:tubez/screens/home.dart';
import 'package:tubez/screens/list.dart';
import 'package:tubez/screens/profile.dart';
import 'package:tubez/widgets/navigation.dart';

class BottomNavigationBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const homeScreeen(),
    const ListScreen(),
    const profileScreen(),
  ];
}
