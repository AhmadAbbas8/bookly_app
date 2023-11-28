import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newst_books_state.dart';

class NewstBooksCubit extends Cubit<NewstBooksState> {
  NewstBooksCubit({required this.fetchNewestdBooksUseCase}) : super(NewstBooksInitial());
  final FetchNewsBooksUseCase fetchNewestdBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestdBooksUseCase();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
