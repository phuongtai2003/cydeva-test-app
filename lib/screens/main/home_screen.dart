import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/controllers/main_controller.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/widgets/camp_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:test_app/widgets/category_item.dart';
import 'package:test_app/widgets/guide_item.dart';
import 'package:test_app/widgets/recommended_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mainController = Get.find<MainController>();
  final _categoriesList = [
    CategoryItem(
      image: Image.asset(
        'assets/images/mountain.jpg',
        fit: BoxFit.cover,
      ),
      title: 'Mountain',
    ),
    CategoryItem(
      image: Image.asset(
        'assets/images/lockness_lake.png',
        fit: BoxFit.cover,
      ),
      title: 'Lake',
    ),
    CategoryItem(
      image: Image.asset(
        'assets/images/mountain.jpg',
        fit: BoxFit.cover,
      ),
      title: 'Forest',
    ),
  ];
  final _recommendedItems = [
    RecommendedItem(
      image: Image.asset(
        'assets/images/lockness_lake.png',
        fit: BoxFit.cover,
      ),
      title: 'Lockness Lake',
      country: 'USA',
      reviewer: '4.8k',
    ),
    RecommendedItem(
      image: Image.asset(
        'assets/images/ice_mountain.png',
        fit: BoxFit.cover,
      ),
      title: 'Ice Mountain',
      country: 'Russia',
      reviewer: '4.8k',
    ),
    RecommendedItem(
      image: Image.asset(
        'assets/images/infinity_field.png',
        fit: BoxFit.cover,
      ),
      title: 'Infinity Field',
      country: 'Netherlands',
      reviewer: '4.8k',
    ),
  ];
  final _guideItems = [
    GuideItem(
      image: Image.asset(
        'assets/images/news_holder_1.png',
        fit: BoxFit.cover,
      ),
      title: "Enjoy your trip",
      description: "Tips to help you have memorable moments",
    ),
    GuideItem(
      image: Image.asset(
        'assets/images/news_holder_2.png',
        fit: BoxFit.cover,
      ),
      title: "Tool preparation",
      description: "What tools you need to prepare",
    ),
    GuideItem(
      image: Image.asset(
        'assets/images/news_holder_4.png',
        fit: BoxFit.cover,
      ),
      title: "Travel articles",
      description: 'Catch weather information quickly',
    ),
    GuideItem(
      image: Image.asset(
        'assets/images/news_holder_3.png',
        fit: BoxFit.cover,
      ),
      title: "Make a plan",
      description: '',
      isImageOnly: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext cntext) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(cntext),
            const SizedBox(
              height: 8,
            ),
            ..._buildCamp(cntext),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: const BoxDecoration(
                color: GlobalColors.greyBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  ..._buildCategories(cntext),
                  const SizedBox(
                    height: 24,
                  ),
                  ..._buildRecommended(cntext),
                  const SizedBox(
                    height: 24,
                  ),
                  ..._buildGuides(cntext),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext cntext) {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(
                  8,
                ),
              ),
              child: Image.asset(
                'assets/images/header_bg.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ).copyWith(
                      bottom: 16,
                      top: 60,
                    ),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Let's start a new adventure\n",
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: "Tasha",
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/bell.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/avatar.png',
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  32,
                                ),
                              ),
                              border: Border.all(
                                  width: 0.5, color: GlobalColors.greyColor),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: GlobalColors.greyColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Where are you going?',
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: GlobalColors.greyColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Explore new lands, conquer big mountains',
                                        style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: GlobalColors.greyColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.mic,
                                  size: 20,
                                  color: GlobalColors.greyColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 0.5, color: GlobalColors.greyColor),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/end_icon.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCamp(BuildContext cntext) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hot camp',
              style: GoogleFonts.nunito(
                fontSize: 20,
                color: GlobalColors.iconColor,
              ),
            ),
            const Spacer(),
            Text(
              'see more',
              style: GoogleFonts.nunito(
                fontSize: 10,
                color: GlobalColors.iconColor,
              ),
            ),
            SvgPicture.asset(
              'assets/images/chevrons-right.svg',
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      AspectRatio(
        aspectRatio: 1.35,
        child: Swiper(
          loop: false,
          controller: _mainController.pageController,
          viewportFraction: 0.65,
          scale: 0.9,
          onIndexChanged: (value) =>
              _mainController.currentPageIndex.value = value,
          itemBuilder: (context, index) {
            return Obx(
              () {
                return CampWidget(
                  isSelected: _mainController.currentPageIndex.value == index,
                );
              },
            );
          },
          itemCount: 3,
        ),
      ),
    ];
  }

  List<Widget> _buildCategories(BuildContext cntext) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Categories',
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              'see all',
              style: GoogleFonts.nunito(
                fontSize: 10,
                color: GlobalColors.greyIconColor,
              ),
            ),
            SvgPicture.asset(
              'assets/images/chevrons-right-grey.svg',
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: AspectRatio(
          aspectRatio: 2.5,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _categoriesList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemBuilder: (context, index) {
              return _categoriesList[index];
            },
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildRecommended(BuildContext cntext) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Recommended for you',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _recommendedItems.length,
          itemBuilder: (context, index) {
            return _recommendedItems[index];
          },
        ),
      ),
    ];
  }

  List<Widget> _buildGuides(BuildContext cntext) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Guides to help you',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: MasonryGridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: _guideItems.length,
          itemBuilder: (context, index) {
            return _guideItems[index];
          },
        ),
      ),
    ];
  }
}
