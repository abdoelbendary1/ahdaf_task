import 'package:ahdaf_task/core/constants/my_assets.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/provider/home_state_providers.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/utils/row_section_widget.dart';

import 'package:ahdaf_task/presentation/home/tabs/homeTab/widgets/header.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/widgets/widget_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  @override
  void initState() {
    super.initState();
    // Fetching data on widget init
    _fetchData();
  }

  // Fetch data for all sections
  void _fetchData() {
    Future.microtask(() {
      ref.read(sliderProvider.notifier).fetchSliders();
      ref.read(categoriesProvider.notifier).fetchCategories();
      ref.read(offersProvider.notifier).fetchOffers();
      ref.read(bestSellersProvider.notifier).fetchBestSellers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the state of each provider
    final sliderState = ref.watch(sliderProvider);
    final categoriesState = ref.watch(categoriesProvider);
    final offersState = ref.watch(offersProvider);
    final bestSellerState = ref.watch(bestSellersProvider);

    // Check if any section is loading

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(
            greetingText: "أهلا بك",
            homeIconPath: MyAssets.notSelectedHomeIcon,
            accountIconPath: MyAssets.notSelectedAccountIcon,
            padding: EdgeInsets.all(16), //
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.horizontalPadding.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacing.verticalSpacing.h),

                    // Announcements Section
                    buildSection(
                      sliderState,
                      onSuccess: (sliders) => buildAnnouncementSection(sliders),
                      errorMessage: "Error loading sliders",
                    ),

                    SizedBox(height: AppSpacing.verticalSpacing.h),

                    // Categories Section
                    buildSection(
                      categoriesState,
                      onSuccess: (categories) => buildCategories(categories),
                      errorMessage: "Error loading categories",
                    ),

                    SizedBox(height: AppSpacing.verticalSpacing.h),

                    // Row Section for Offers
                    RowSectionWidget(name: 'عروض وخصومات'),
                    buildSection(
                      offersState,
                      onSuccess: (offers) => buildGridView(offers),
                      errorMessage: "Error loading offers",
                    ),

                    SizedBox(height: AppSpacing.verticalSpacing.h),

                    // Row Section for Best Sellers
                    RowSectionWidget(name: 'الأكثر مبيعا'),
                    buildSection(
                      bestSellerState,
                      onSuccess: (bestSellers) => buildGridView(bestSellers),
                      errorMessage: "Error loading best sellers",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
