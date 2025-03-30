import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrders({required OrderEntity order});
}
