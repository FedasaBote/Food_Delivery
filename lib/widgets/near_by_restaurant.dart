import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

import '../restaurant_screen.dart';

class NearbyRestaurant extends StatelessWidget {
  const NearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: restaurants.map(
      (restaurant) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RestaurantScreen(
                          restaurant: restaurant,
                        )));
          },
          child: Container(
            height: 135,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Hero(
                      tag: restaurant.name,
                      child: Image(
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(restaurant.name,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "⭐" * restaurant.rating,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "200 Main St, New York, NY",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "0.2 miles away",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).toList());
  }
}
