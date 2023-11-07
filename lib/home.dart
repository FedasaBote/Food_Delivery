import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/widgets/near_by_restaurant.dart';
import 'package:food_delivery/widgets/recent_order.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int amount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.circle),
          onPressed: () {},
        ),
        title: const Center(child: Text("Home Page")),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                suffix: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
                fillColor: Colors.white,
                hintText: "Search Food or Restaurants",
                alignLabelWithHint: true,
              ),
            ),
          ),
          const RecentOrders(),
          const NearbyRestaurant()
        ],
      ),
    );
  }
}
