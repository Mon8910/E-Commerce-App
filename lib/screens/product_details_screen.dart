import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/providers/product_list_details.dart';
import 'package:demo_project/repo/product_details_repo.dart';
import 'package:demo_project/widgets/decoration.details.dart';
import 'package:demo_project/widgets/list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, this.productDetailsId});
  final int? productDetailsId;
  @override
  State<ProductDetailsScreen> createState() {
    return _ProductDetailsScreenState();
  }
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final productDetailsProvider = context.read<ProductDetailsProvider>();
  @override
  void initState() {
    super.initState();
    _getProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProductDetailsProvider, bool>(
      selector: (ctx, mytype) => mytype.isloading,
      builder: (context, isloading, child) {
        return isloading
            ? const Scaffold(body: Center(child: CircularProgressIndicator(),),)
            : Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Selector<ProductDetailsProvider, Product>(
                          selector: ((ctx, productDetails) => productDetails.productDetails),
                          builder: (context, productDetails, child) {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        //height: MediaQuery.of(context).size.height*.35,
                                        child: Image.network(
                                          productDetails.image.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          top: 20,
                                          child:
                                              // RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)
                                              Container(
                                                  width: 60,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromARGB(
                                                              1,
                                                              255,
                                                              255,
                                                              255)),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                        Icons.arrow_back_ios,
                                                        size: 16,
                                                      ))))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'More from Shop ',
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              1, 110, 123, 137),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.favorite_border_rounded)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    productDetails.name.toString(),
                                    style: GoogleFonts.jost(
                                        color:
                                            const Color.fromARGB(1, 26, 26, 26),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        itemBuilder: (context, _) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          );
                                        },
                                        itemCount: 5,
                                        rating: 0,
                                        itemSize: 15,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        productDetails.avgRate.toString(),
                                        style: GoogleFonts.jost(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromARGB(
                                              1, 26, 26, 26),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '(${productDetails.avgRate})',
                                        style: GoogleFonts.jost(
                                            color: const Color.fromARGB(
                                                1, 66, 66, 66),
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${productDetails.currency!.name} ${productDetails.price}',
                                        style: GoogleFonts.jost(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                1, 26, 26, 26)),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${productDetails.currency!.name} ${productDetails.priceAfterDiscount}',
                                        style: GoogleFonts.jost(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                1, 197, 197, 197),
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .290,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    1, 236, 236, 236)),
                                            bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  1, 236, 236, 236),
                                            ))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Colors ',
                                          style: GoogleFonts.jost(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                1, 26, 26, 26),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const DecorationDetails(),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Sizes ',
                                          style: GoogleFonts.jost(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                1, 26, 26, 26),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const ListButtons()
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Description',
                                    style: GoogleFonts.jost(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromARGB(1, 26, 26, 26),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    productDetails.description.toString(),
                                    style: GoogleFonts.jost(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(
                                            1, 82, 82, 82)),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Future<void> _getProductDetails() async {
    ProductDetailsRepo productDetailsRepo = ProductDetailsRepo();
    productDetailsProvider.setIsloading(true);
    Product? productDetails =
        await productDetailsRepo.getProductDetailsRepo(widget.productDetailsId!);
    if (productDetails != null) {
      // ignore: use_build_context_synchronously
      context
          .read<ProductDetailsProvider>()
          .updateProductDetails(productDetails);
    
    }
      productDetailsProvider.setIsloading(false);
  }
}
