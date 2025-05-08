import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce/core/utils/backend_endpoint.dart';

import '../../services/fire_storage_service.dart';

class ImagesRepoImpl implements ImagesRepo {
  final FireStorageService fireStorageService;
  ImagesRepoImpl({required this.fireStorageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await fireStorageService.uploadFile(
        image,
        BackendEndpoint.images,
      );
      return Right(url);
    } catch (e) {
      log("e.ImagesRepoImpl: $e");
      return Left(ServerFailure("Couldn't upload image"));
    }
  }
}
