import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:photo_view/photo_view.dart';

import '../../view_model/job_cubit.dart';
class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(cubit.selectedOtherFile!
          .path
          .split('/')
          .last, context),
      body: Container(
        color: Colors.white,
          child: PhotoView(
            imageProvider: FileImage(cubit.selectedOtherFile!),
          )
      ),
    );
  }
}
