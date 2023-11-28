import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widget/feature_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widget/list_view_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomAppBar(),
              ),
              BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
                builder: (context, state) {
                  if (state is FeaturedBooksSuccess) {
                    return  FeaturedBooksListView(books: state.books,);
                  } else if (state is FeaturedBooksFailure||state is FeaturedBooksPaginationFailure) {
                    return Text('Errror');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Best Seller',
                ),
              ),
              const SizedBox(height: 20),
              // ListViewBestSeller(),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListViewBestSeller(),
          ),
        )
      ],
    );
  }
}
