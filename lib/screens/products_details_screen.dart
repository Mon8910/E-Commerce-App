import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/providers/product_details_provider.dart';
import 'package:demo_project/repo/products_details_repo.dart';
import 'package:demo_project/widgets/decoration.details.dart';
import 'package:demo_project/widgets/list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key, this.productDetailsId});
  final int? productDetailsId;
  @override
  State<ProductsDetailsScreen> createState() {
    return _ProductDetailsScreenState();
  }
}

class _ProductDetailsScreenState extends State<ProductsDetailsScreen> {
  late final productDetailsProvider = context.read<ProductDetailsProvider>();
  @override
  void initState() {
    super.initState();
    _getProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProductDetailsProvider, Tuple2<bool,ProductModels>>(
      selector: (context, provider) => Tuple2(provider.isloading, provider.productDetails),
      builder: (context, productsDetailsProvider, child) {
        return productsDetailsProvider.item1
            ? const Scaffold(body: Center(child: CircularProgressIndicator(),),)
            : Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        
                             SingleChildScrollView(
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
                                          productsDetailsProvider.item2.image.toString(),
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
                                              255, 110, 123, 137),
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
                                    productsDetailsProvider.item2.name.toString(),
                                    style: GoogleFonts.jost(
                                        color:
                                            const Color.fromARGB(255, 26, 26, 26),
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
                                        productsDetailsProvider.item2.avgRate.toString(),
                                        style: GoogleFonts.jost(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromARGB(
                                              255, 26, 26, 26),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '(${productsDetailsProvider.item2.avgRate})',
                                        style: GoogleFonts.jost(
                                            color: const Color.fromARGB(
                                                255, 66, 66, 66),
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
                                        '${productsDetailsProvider.item2.currency!.name} ${productsDetailsProvider.item2.price}',
                                        style: GoogleFonts.jost(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 26, 26, 26)),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${productsDetailsProvider.item2.currency!.name} ${productsDetailsProvider.item2.priceAfterDiscount}',
                                        style: GoogleFonts.jost(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 197, 197, 197),
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
                                                    255, 236, 236, 236)),
                                            bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 236, 236, 236),
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
                                                255, 26, 26, 26),
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
                                                255, 26, 26, 26),
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
                                          const Color.fromARGB(255, 26, 26, 26),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    productsDetailsProvider.item2.description.toString(),
                                    style: GoogleFonts.jost(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(
                                            255, 82, 82, 82)),
                                  )
                                ],
                              ),
                            )
                          ,
                        
                      ]),
                    ),
                  ),
                          );}
    );
              
      
    
      }
      Future<void> _getProductDetails() async {
    ProductsDetailsRepo productsDetailsRepo = ProductsDetailsRepo();
    productDetailsProvider.setIsloading(true);
    ProductModels? productDetails =
        await productsDetailsRepo.getProductsDetailsRepo(widget.productDetailsId!);
    
      // ignore: use_build_context_synchronously
      context
          .read<ProductDetailsProvider>()
          .updateProductDetails(productDetails!);
    
    
      productDetailsProvider.setIsloading(false);
  }
      }
      

  

