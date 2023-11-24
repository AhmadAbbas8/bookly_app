import 'package:bookly_app/features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class ListViewBestSeller extends StatelessWidget {
  const ListViewBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: BestSellerListViewItem(),
      ),
      itemCount: 10,
    );
  }
}
