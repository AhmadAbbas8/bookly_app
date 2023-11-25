import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widget/book_rate_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widget/custom_list_view_image_item.dart';
import 'package:bookly_app/features/home/presentation/views/widget/feature_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomAppBarBookDetails(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: const CustomListViewImageItem(),
          ),
          const SizedBox(height: 43),
          const Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: 0.7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const BookRate(mainAxisAlignment: MainAxisAlignment.center),


        ],
      ),
    );
  }
}
