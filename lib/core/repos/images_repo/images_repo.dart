import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';



abstract class ImagesRepo {
  Future<Either<Failure,String>> uploadImage(File image);
}
