import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../common/common_image.dart';

class ImageGridView extends StatefulWidget {
  final bool isUpload;
  final List<String>? images;
  final ValueChanged<List<String>>? onChanged;
  const ImageGridView({super.key, this.isUpload = true, this.images, this.onChanged});

  @override
  State<ImageGridView> createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  List<File> files = [];
  List<String> uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    var itemWidth = (MediaQuery.of(context).size.width - 2 * 9 - 2 * 20) / 3;
    var itemHeight = itemWidth;
    Widget addBtn = InkWell(
      onTap: _pickImage,
      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: const CommonImage(
          src: 'assets/icons/feedback_camera_icon.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget wrapper(File file) {
      return Container(
        width: itemWidth,
        height: itemHeight,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Image.file(file, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IconButton(
                alignment: Alignment.bottomCenter,
                onPressed: () => _deleteFile(file),
                padding: EdgeInsets.zero,
                icon: const CommonImage(src: 'assets/icons/feedback_delete_icon.png', width: double.infinity, fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      );
    }

    List<Widget> getList() {
      if (widget.isUpload) {
        List<Widget> widgets = files.map((file) => wrapper(file)).toList();

        if (widgets.length < 9) {
          widgets = widgets..add(addBtn);
        }
        return widgets;
      } else {
        return widget.images
                ?.map((imgUrl) => Container(
                    width: itemWidth,
                    height: itemHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CommonImage(src: imgUrl, fit: BoxFit.cover)))
                .toList() ??
            [];
      }
    }

    return Wrap(spacing: 8, runSpacing: 9, children: getList());
  }

  void _deleteFile(File currentImg) {
    int index = files.indexOf(currentImg);
    setState(() {
      files.removeAt(index);
      uploadedImages.removeAt(index);
      if (widget.onChanged != null) widget.onChanged!(uploadedImages);
    });
  }

  void _pickImage() async {
    PermissionStatus status = await Permission.photos.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar(
        'You did not allow us to access the Photo Library, which will help you obtain a loan. Would you like to set up authorization.',
        type: SnackType.info,
      );
    }

    ImagePicker picker = ImagePicker();
    var imgFile = await picker.pickImage(source: ImageSource.gallery);
    if (imgFile == null) return;
    EasyLoading.show(status: 'uploading...', maskType: EasyLoadingMaskType.black);
    var imgUrl = await ApiUtil.uploadImage(imgFile.path);
    uploadedImages.add(imgUrl['imgPath']);
    if (widget.onChanged != null) {
      widget.onChanged!(uploadedImages);
    }
    EasyLoading.dismiss();
    setState(() {
      files.add(File(imgFile.path));
    });
  }
}
