import 'dart:io';

import 'package:RMFlutter/app/locator.dart';
import 'package:RMFlutter/services/media_service.dart';
import 'package:stacked/stacked.dart';

class ServiceExampleViewModel extends BaseViewModel {
  final _api = locator<Api>();
  final int _userId;
  final _mediaService = locator<MediaService>();

  ServiceExampleViewModel(this._userId);

  File _selectedImage;

  bool get hasSelectedImage => _selectedImage != null;

  File get selectedImage => _selectedImage;

  Future<void> selectImage(bool fromGallery) async {
    _selectedImage = await runBusyFuture(
      _mediaService.getImage(
        fromGallery: fromGallery,
      ),
    );
  }

  Future<User> getUserProfile() async {
    return await _api.getUserProfile(_userId);
  }

  Future<List<Post>> getPostsForUser() async {
    return await _api.getPostsForUser(_userId);
  }
}
