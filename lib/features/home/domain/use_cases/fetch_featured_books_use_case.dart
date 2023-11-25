import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> call() async =>
      await homeRepo.fetchFeatureBooks();
}
