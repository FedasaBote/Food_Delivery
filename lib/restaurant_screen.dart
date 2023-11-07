import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    // RenderBox renderboc = context.findRenderObject() as RenderBox;
    // renderboc.localToGlobal(Offset.zero);
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: widget.restaurant.name,
              child: Image(
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.restaurant.imageUrl,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    color: Colors.white,
                    iconSize: 35.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                    ),
                    color: Theme.of(context).primaryColor,
                    iconSize: 35.0,
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "0.2 miles away",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
            Text(
              "⭐ " * widget.restaurant.rating,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              widget.restaurant.address,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // if (states.contains(MaterialState.pressed)) {
                    //   return Theme.of(context)
                    //       .primaryColor
                    //       .withOpacity(0.2); // Set overlay color when pressed
                    // }
                    return Theme.of(context)
                        .primaryColor; // Set overlay color when not pressed
                  },
                ), shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                  (Set<MaterialState> states) {
                    // if (states.contains(MaterialState.disabled)) {
                    //   return RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     side: const BorderSide(
                    //         color: Colors.grey), // Border color when disabled
                    //   );
                    // }
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: const BorderSide(
                      //     color: Colors.blue), // Border color when enabled
                    );
                  },
                )),
                onPressed: () {},
                child: const Text(
                  "Reviews",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // if (states.contains(MaterialState.pressed)) {
                    //   return Theme.of(context)
                    //       .primaryColor
                    //       .withOpacity(0.2); // Set overlay color when pressed
                    // }
                    return Theme.of(context)
                        .primaryColor; // Set overlay color when not pressed
                  },
                ), shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                  (Set<MaterialState> states) {
                    // if (states.contains(MaterialState.disabled)) {
                    //   return RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     side: const BorderSide(
                    //         color: Colors.grey), // Border color when disabled
                    //   );
                    // }
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: const BorderSide(
                      //     color: Colors.blue), // Border color when enabled
                    );
                  },
                )),
                onPressed: () {},
                child: const Text(
                  "Contact",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Center(
          child: Text(
            "Menu",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10.0),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) => Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        width: constraints.maxWidth / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  widget.restaurant.menu[index].imageUrl,
                                ))),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                  0.1,
                                  0.4,
                                  0.6,
                                  0.9
                                ],
                                colors: [
                                  Colors.black45,
                                  Colors.black45,
                                  Colors.black45,
                                  Colors.black45
                                ])),
                      ),
                    ),
                    Positioned(
                      bottom: 65,
                      child: Column(
                        children: [
                          Text(
                            widget.restaurant.menu[index].name,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$${widget.restaurant.menu[index].price}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}

//  Expanded(
//           child: GridView.count(
//             padding: const EdgeInsets.all(10.0),
//             crossAxisCount: 2,
//             children: List.generate(
//               widget.restaurant.menu.length,
//               (index) {
//                 final menuItem = widget.restaurant.menu[index];
//                 return Center(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         height: 175,
//                         width: 175,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           image: DecorationImage(
//                             image: AssetImage(menuItem.imageUrl),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 175,
//                         width: 175,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           gradient: const LinearGradient(
//                             begin: Alignment.topRight,
//                             end: Alignment.bottomLeft,
//                             colors: [
//                               Colors.black45,
//                               Colors.black45,
//                               Colors.black45,
//                               Colors.black45,
//                             ],
//                             stops: [0.1, 0.4, 0.6, 0.9],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 65.0,
//                         child: Column(
//                           children: [
//                             Text(
//                               menuItem.name,
//                               style: const TextStyle(
//                                 fontSize: 24.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               "\$${menuItem.price}",
//                               style: const TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 10.0,
//                         right: 10.0,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).primaryColor,
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.add,
//                               size: 30.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       )

//                       // Positioned(
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         )
