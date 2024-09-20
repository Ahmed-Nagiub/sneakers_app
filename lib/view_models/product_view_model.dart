import 'package:either_dart/either.dart';
import 'package:sneakers_app/data/models/product_model.dart';
import 'package:sneakers_app/data/repository/product_repo.dart';

class ProductViewModel {
  final ProductRepo productRepo;
  ProductViewModel(this.productRepo);

  Future<Either<String, List<ProductModel>>> getProduct() async {
    final response = await productRepo.getProduct();
    if (response.isRight) {
      return Right(response.right);
    } else {
      return Left(response.left);
    }
  }
}
