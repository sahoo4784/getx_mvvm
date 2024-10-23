import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromGalleryEvent extends ImagePickerEvent {}

class PickImageFromCameraEvent extends ImagePickerEvent {}
