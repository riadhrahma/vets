import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';

class ViewChatImageWidget extends StatelessWidget {
  const ViewChatImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundCOlor,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.file_download,
              color: kGreyCOlor,
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            AppAssets.arrowLeftIcon,
            color: kDarkCOlor,
            fit: BoxFit.scaleDown,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: SizeConfig().height,
          width: SizeConfig().widht,
          child: PhotoView(
            backgroundDecoration: const BoxDecoration(
              color: kScaffoldBackgroundCOlor,
            ),
            imageProvider: const NetworkImage(
              'https://www.oliverpetcare.com/wp-content/uploads/2019/11/puppy-dog-animal-pet-mammal-pug-1046756-pxhere.com_-e1572947696385.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
