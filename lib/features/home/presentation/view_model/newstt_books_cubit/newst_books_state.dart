part of 'newst_books_cubit.dart';

@immutable
abstract class NewstBooksState {}

class NewstBooksInitial extends NewstBooksState {}
class NewestBooksLoading extends NewstBooksState {}

class NewestBooksSuccess extends NewstBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewstBooksState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}