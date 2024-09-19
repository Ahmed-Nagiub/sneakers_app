import 'package:flutter/material.dart';
import 'package:sneakers_app/models/sneakers_model.dart';
import 'package:sneakers_app/utils/app_colors.dart';

class SneakersCard extends StatelessWidget {
  final SneakersItem sneakersItem;

  const SneakersCard({super.key, required this.sneakersItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.network(
                  sneakersItem.imageUrl,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border,
                      size: 24, color: AppColors.favoriteColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              sneakersItem.title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 160,
              child: Text(
                sneakersItem.description,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'EGP ${sneakersItem.price}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.fontColor,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  'EGP ${sneakersItem.originalPrice}',
                  style: const TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.discountColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Review (${sneakersItem.rating})'),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ),
                const Icon(Icons.add_circle,
                    color: AppColors.addColor, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
