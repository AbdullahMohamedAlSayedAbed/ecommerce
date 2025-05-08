import 'package:ecommerce/core/helper/get_user.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/widgets/custom_network_image.dart';
import 'package:ecommerce/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (state.imageUrl != null)
              Skeletonizer(
                enabled: state.uploadStatus == UploadStatus.loading,
                child: SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CustomNetworkImage(imageUrl: getUser().imageUrl!),
                  ),
                ),
              )
            else if (state.image != null)
              Image.file(state.image!, fit: BoxFit.cover)
            else
              Skeletonizer(
                enabled: state.uploadStatus == UploadStatus.loading,
                child: Image.asset(Assets.imagesProfileImage),
              ),

            // أيقونة الكاميرا
            Positioned(
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (modalContext) {
                      // استخدام اسم مختلف للسياق الجديد
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('كاميرا'),
                              onTap: () {
                                Navigator.pop(modalContext);
                                // استخدام context الأصلي من build
                                context.read<ProfileCubit>().pickAndUploadImage(
                                  ImageSource.camera,
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text('معرض الصور'),
                              onTap: () {
                                Navigator.pop(modalContext);
                                // استخدام context الأصلي من build
                                context.read<ProfileCubit>().pickAndUploadImage(
                                  ImageSource.gallery,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3B5998),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
