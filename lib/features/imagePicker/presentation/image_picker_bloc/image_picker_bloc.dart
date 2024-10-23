import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/utils/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  final BuildContext context;

  ImagePickerBloc(this.imagePickerUtils,this.context) : super(const ImagePickerState()) {
    on<PickImageFromCameraEvent>(_handleImagePickingFromCamera);
    on<PickImageFromGalleryEvent>(_handleImagePickingFromGallery);
  }

  _handleImagePickingFromCamera(
      PickImageFromCameraEvent event, Emitter<ImagePickerState> emit) async {
    final XFile? pickedFileFromCamera =
        await imagePickerUtils.pickImageFromCamera();
    emit(state.copyWith(file: pickedFileFromCamera,imagePickedd: true),
    );

    if (kDebugMode) {
      print('pickedFileFromCamera : $pickedFileFromCamera');
    }
    context.pop();
  }

  _handleImagePickingFromGallery(
      PickImageFromGalleryEvent event, Emitter<ImagePickerState> emit) async {
    final XFile? pickedFileFromGallery =
        await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: pickedFileFromGallery,imagePickedd: true));
    if (kDebugMode) {
      print('pickedFileFromGallery : $pickedFileFromGallery');
    }
  }
}
