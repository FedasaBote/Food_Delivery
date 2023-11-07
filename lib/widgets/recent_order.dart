import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

import '../models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  Widget _buildRecentOrder(BuildContext context, int index) {
    Order order = currentUser.orders[index];
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[200]!)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(order.food.imageUrl),
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          order.date,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10.0,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text("Recent Orders"),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 120.0,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: currentUser.orders.length,
          itemBuilder: (context, index) {
            return _buildRecentOrder(context, index);
          },
        ),
      ),
    ]);
  }
}
