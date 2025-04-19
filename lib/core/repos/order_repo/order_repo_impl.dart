import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/utils/backend_endpoint.dart';
import 'package:ecommerce/features/checkout/data/models/order_model.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService firestoreService;

  OrderRepoImpl({required this.firestoreService});
  @override
  Future<Either<Failure, void>> addOrders({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await firestoreService.addDate(
        path: BackendEndpoint.addOrder,
        data: orderModel.toJson(),
        documentId: orderModel.orderId,
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
