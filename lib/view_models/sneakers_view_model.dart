import 'package:sneakers_app/models/sneakers_model.dart';

class SneakersViewModel {
  Future<List<SneakersItem>> getShoes() async {
    await Future.delayed(const Duration(seconds: 2));
  const image = 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg';
    return [
      SneakersItem(
        title: 'Nike Air Jordan',
        description: 'Nike shoes flexible for workout',
        price: '1,000',
        originalPrice: '1,300',
        rating: 4.6,
        imageUrl: image,
      ),
      SneakersItem(
        title: 'Nike Air Jordan',
        description: 'Nike shoes flexible for workout',
        price: '1,000',
        originalPrice: '1,300',
        rating: 4.6,
        imageUrl: image,
      ),
      SneakersItem(
        title: 'Nike Air Jordan',
        description: 'Nike shoes flexible for workout',
        price: '1,000',
        originalPrice: '1,300',
        rating: 4.6,
        imageUrl: image,
      ),
      SneakersItem(
        title: 'Nike Air Jordan',
        description: 'Nike shoes flexible for workout',
        price: '1,000',
        originalPrice: '1,300',
        rating: 4.6,
        imageUrl: image,
      ),
      SneakersItem(
        title: 'Nike Air Jordan',
        description: 'Nike shoes flexible for workout',
        price: '1,000',
        originalPrice: '1,300',
        rating: 4.6,
        imageUrl: image,
      ),
      SneakersItem(
        title: 'Nike Air Jordan',
        description: 'Nike shoes flexible for workout',
        price: '1,000',
        originalPrice: '1,300',
        rating: 4.6,
        imageUrl: image,
      ),
    ];
  }
}
