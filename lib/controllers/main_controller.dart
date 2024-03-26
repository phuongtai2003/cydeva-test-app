import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt currentNavIndex = 0.obs;
  final RxInt currentPageIndex = 0.obs;
  final SwiperController pageController = SwiperController();

  void changeNavIndex(int index) {
    currentNavIndex.value = index;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
