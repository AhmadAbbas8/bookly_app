import 'package:bloc/bloc.dart';

import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.featuredBooksUseCase})
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    // if (pageNumber == 0) {
    //   emit(FeaturedBooksLoading());
    // } else {
      emit(FeaturedBooksPaginationLoading());
    // }
    var result = await featuredBooksUseCase.call(pageNumber);
    print(result);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(failure.message));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
