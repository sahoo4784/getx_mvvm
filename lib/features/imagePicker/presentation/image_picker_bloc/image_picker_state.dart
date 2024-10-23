import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  final XFile? file;
  final bool? imagePicked;
  const ImagePickerState({this.file,this.imagePicked = false});

  ImagePickerState copyWith({XFile? file,bool? imagePickedd}) {
    return ImagePickerState(file: file ?? this.file,imagePicked: imagePickedd ?? imagePicked);
  }

  @override
  List<Object?> get props => [file,imagePicked];
}
