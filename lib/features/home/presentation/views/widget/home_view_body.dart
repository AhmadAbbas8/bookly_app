import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widget/feature_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widget/list_view_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Best Seller',
                ),
              ),
              SizedBox(height: 20),
              // ListViewBestSeller(),
            ],
          ) ,
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListViewBestSeller(),
          ),
        )
      ],
    );

  }
}

