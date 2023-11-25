import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import '../entities/book_entity.dart';

class FetchNewsBooksUseCase {
  final HomeRepo homeRepo;

  FetchNewsBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<List<BookEntity>> call() async => await homeRepo.fetchNewsBooks();
}
