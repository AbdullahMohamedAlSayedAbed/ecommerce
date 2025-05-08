import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/helper/get_user.dart';
import 'package:ecommerce/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:ecommerce/core/utils/backend_endpoint.dart';
import 'package:ecommerce/features/auth/data/model/user_model.dart';
import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ImagesRepo imagesRepo;
  final DatabaseService databaseService; // إضافة DatabaseService

  ProfileCubit(this.imagesRepo, this.databaseService) : super(const ProfileState());

  Future<void> pickAndUploadImage(ImageSource source) async {
    try {
      // اختيار الصورة
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile == null) return;

      final imageFile = File(pickedFile.path);
      emit(state.copyWith(image: imageFile, uploadStatus: UploadStatus.loading));

      // رفع الصورة
      final result = await imagesRepo.uploadImage(imageFile);
      await result.fold(
        (failure) async => emit(state.copyWith(
          uploadStatus: UploadStatus.error,
          errorMessage: failure.message,
        )),
        (url) async {
          // تحديث بيانات المستخدم برابط الصورة
          final currentUser = getUser(); // استرجاع المستخدم الحالي
          final updatedUser = UserEntity(
            id: currentUser.id,
            email: currentUser.email,
            name: currentUser.name,
            imageUrl: url, // إضافة رابط الصورة
          );

          // حفظ في Firestore
          await databaseService.addDate(
            path: BackendEndpoint.addUserData,
            data: UserModel.fromEntity(updatedUser).toJson(),
            documentId: currentUser.id,
          );

          // حفظ محليًا في Prefs
          final jsonData = jsonEncode(UserModel.fromEntity(updatedUser).toJson());
          await Prefs.setString(kUserData, jsonData);

          // تحديث الحالة
          emit(state.copyWith(
            imageUrl: url,
            uploadStatus: UploadStatus.success,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        uploadStatus: UploadStatus.error,
        errorMessage: 'حدث خطأ غير متوقع',
      ));
    }
  }
}