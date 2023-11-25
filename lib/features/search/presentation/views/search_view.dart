import 'package:bookly_app/features/home/presentation/views/widget/custom_list_view_image_item.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String kSearchView = '/searchView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}

