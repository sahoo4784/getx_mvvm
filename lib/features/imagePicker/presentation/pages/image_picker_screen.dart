import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_mvvm/features/imagePicker/presentation/image_picker_bloc/image_picker_bloc.dart';
import 'package:getx_mvvm/features/imagePicker/presentation/image_picker_bloc/image_picker_event.dart';
import 'package:getx_mvvm/features/imagePicker/presentation/image_picker_bloc/image_picker_state.dart';
import 'package:getx_mvvm/utils/custom_widgets.dart';
import 'package:getx_mvvm/utils/dimensions.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight(context),
        width: Dimensions.screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: CupertinoColors.activeGreen, width: 1.3)),
                  child: state.file != null
                      ? Image.file(File(state.file!.path.toString()))
                      : Image.network(
                      'https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg'),
                );
              },
            ),
            CustomWidgets.verticalSpacing(height: 20),
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                return CustomWidgets.appButton(
                  buttonLabel: 'Pick image',
                  height: 45,
                  width: 200,
                  color: CupertinoColors.systemGreen,
                  onPressed: () {
                    if (state.imagePicked == false){
                      CustomWidgets.showBottomSheet(
                          context: context,
                          bottomSheetHeight: 200,
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomWidgets.appButton(
                                color: Colors.green,
                                  onPressed: () =>
                                      context
                                          .read<ImagePickerBloc>()
                                          .add(PickImageFromGalleryEvent()),
                                  buttonLabel: 'Pick from Gallery'),
                              CustomWidgets.verticalSpacing(height: 20),
                              CustomWidgets.appButton(
                                  color: Colors.green,
                                  onPressed: () =>
                                      context
                                          .read<ImagePickerBloc>()
                                          .add(PickImageFromCameraEvent()),
                                  buttonLabel: 'Pick from Camera')
                            ],
                          ));
                    }else{
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
