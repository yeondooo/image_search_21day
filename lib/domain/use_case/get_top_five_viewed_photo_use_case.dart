import 'package:image_search_21day/core/result.dart';
import 'package:image_search_21day/domain/model/photo.dart';
import 'package:image_search_21day/domain/repository/photo_repository.dart';

class GetTopFiveViewedPhotoUseCase {
  final PhotoRepository _photoRepository;

  GetTopFiveViewedPhotoUseCase(this._photoRepository);

  Future<Result<List<Photo>>> execute(query) async {
    try {
      final photos = await _photoRepository.getPhotos(query);
      photos.sort((a, b) => -a.views.compareTo(b.views));
      return Result.success(photos.take(5).toList());
    } catch (err) {
      return const Result.error('오류가 발생했습니다.');
    }
  }
}
