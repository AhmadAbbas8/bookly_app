import 'package:bookly_app/features/home/presentation/views/widget/custom_list_view_image_item.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomListViewImageItem(image: books[index].image ?? ''),
        ),
      ),
    );
  }
}
