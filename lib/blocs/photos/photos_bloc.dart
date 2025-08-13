import 'package:flutter_bloc/flutter_bloc.dart';
import 'photos_event.dart';
import 'photos_state.dart';
import '../../repositories/photo_repository.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotoRepository repository;
  PhotosBloc(this.repository) : super(PhotosInitial()) {
    on<FetchPhotos>((event, emit) async {
      emit(PhotosLoading());
      try {
        final photos = await repository.fetchPhotos(limit: 10);
        emit(PhotosLoaded(photos));
      } catch (e) {
        emit(PhotosError('Could not load photos'));
      }
    });
  }
}
