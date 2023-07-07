import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/product_modal.dart';
import 'cart_details_view.dart';
import '../utils/products.dart';



class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool showCart = false;
  bool showDetails = false;

  double storeHeight = 770;

  final List<Product> products = productsdata;

  final List<Product> cartItems = [];

  void addToCart(Product product) {
    for (Product cartProduct in cartItems) {
      if (cartProduct.id == product.id) {
        cartProduct.quantity = product.quantity;
        return;
      }
    }

    setState(() {
      cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0.0) {
            setState(() {
              showCart = !showCart;
            });
          }
        },
        child: Container(
          color: Colors.black,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              AnimatedPositioned(
                top: showCart ? 0 : mediaQuery.height,
                curve: Curves.easeOutQuad,
                duration: const Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () {},
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! > 0.0) {
                      setState(() {
                        showCart = !showCart;
                      });
                    }
                  },
                  child: Container(
                    height: mediaQuery.height,
                    width: mediaQuery.width,
                    color: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 20,
                      ),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 180),
                            Expanded(
                              child: cartItems.isEmpty
                                  ? const SizedBox(
                                      child: Center(
                                        child: Text(
                                          "No Products",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      child: ListView.builder(
                                        itemCount: cartItems.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor: Colors.white,
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: Image.asset(
                                                      cartItems[index].imageUrl,
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  cartItems[index]
                                                      .quantity
                                                      .toString(),
                                                  style:
                                                      GoogleFonts.lexendDeca()
                                                          .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "x",
                                                  style:
                                                      GoogleFonts.lexendDeca()
                                                          .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  cartItems[index].title,
                                                  style:
                                                      GoogleFonts.lexendDeca()
                                                          .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "\$ ${cartItems[index].price}",
                                                  style:
                                                      GoogleFonts.lexendDeca()
                                                          .copyWith(
                                                    color: Colors.white70,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: SizedBox(
                                    height: 30,
                                    child: Icon(
                                      Icons.delivery_dining_sharp,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Delivery",
                                  style: GoogleFonts.lexendDeca().copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "\$ 25.5",
                                  style: GoogleFonts.lexendDeca().copyWith(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: GoogleFonts.quicksand().copyWith(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "\$ 2345.84",
                                  style: GoogleFonts.quicksand().copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                      0xffFEC449) // Background color
                                  ),
                              child: SizedBox(
                                height: 50,
                                // width: MediaQuery.sizeOf(context).width / 2,
                                child: Center(
                                  child: Text(
                                    "Next",
                                    style: GoogleFonts.lexendDeca().copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: showCart ? -storeHeight : 0,
                bottom: showDetails
                    ? 0
                    : showCart
                        ? storeHeight
                        : 120,
                curve: Curves.easeOutQuad,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  height: mediaQuery.height,
                  width: mediaQuery.width,
                  decoration: const BoxDecoration(
                    color: Color(0xffe8e6dc), //Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      SafeArea(
                        bottom: false,
                        child: Container(
                          height: 50,
                          // color: Colors.lightGreen,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.back,
                                size: 25,
                              ),
                              const SizedBox(width: 40),
                              Text(
                                "Apple Store",
                                style: GoogleFonts.lexendDeca().copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.slider_horizontal_3,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              childAspectRatio: 0.75,
                            ),
                            itemCount: products.length,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       return CartDetailsView(
                                  //         productIndex: index,
                                  //         product: products[index],
                                  //       );
                                  //     },
                                  //   ),
                                  // );

                                  setState(() {
                                    showDetails = true;
                                  });

                                  final result =
                                      await Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 700),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 800),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: CartDetailsView(
                                            product: products[index],
                                            onAddProduct: (product) {
                                              addToCart(product);
                                            }),
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return child;
                                      },
                                    ),
                                  );

                                  if (result != null) {
                                    setState(() {
                                      showDetails = false;
                                    });
                                  }
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 120,
                                          width: 140,
                                          child: Hero(
                                            tag: "${products[index].id}",
                                            child: Image.asset(
                                              products[index].imageUrl,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\$ ${products[index].price}",
                                          style:
                                              GoogleFonts.lexendDeca().copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          products[index].title,
                                          style:
                                              GoogleFonts.quicksand().copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "500 gm",
                                          style:
                                              GoogleFonts.quicksand().copyWith(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                bottom: showDetails
                    ? -80
                    : showCart
                        ? storeHeight - 80
                        : 40,
                // bottom: showDetails || showCart ? -80 : 40,
                child: GestureDetector(
                  onTap: () {},
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! < 0.0) {
                      setState(() {
                        showCart = !showCart;
                      });
                    }
                  },
                  child: SizedBox(
                    width: mediaQuery.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text(
                            "Cart",
                            style: GoogleFonts.quicksand().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: showCart
                                ? const SizedBox()
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cartItems.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Hero(
                                          tag: "${cartItems[index].id}cart",
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.white,
                                            child: SizedBox(
                                              height: 30,
                                              child: Image.asset(
                                                cartItems[index].imageUrl,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.orange.shade300,
                            child: Text(
                              cartItems.isEmpty
                                  ? "0"
                                  : cartItems.length.toString(),
                              style: GoogleFonts.lexendDeca().copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
