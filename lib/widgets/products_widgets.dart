import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/providers/product_provider.dart';
import 'package:demo_project/providers/show_occasion_types_provider.dart';
import 'package:demo_project/screens/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .099,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 26, 26, 26),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Selector<ShowOccasionsProvider, OccasionsModels>(
                selector: (context, provider) => provider.getOccaSion,
                builder: (context, showOccasionsProvider, child) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/images/discount-shape.png',
                    ),
                    title: Text(
                      'Top offers for ${showOccasionsProvider.name}',
                      style: GoogleFonts.jost(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    subtitle:
                         Text(
                          'Discover top offers for ${showOccasionsProvider.name}’s gift and save money ',
                          style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400, fontSize: 10),
                        ),
                      
                    
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  );
                }),
          ),
        ),
        Expanded(
          child: Selector<ProductsProvider, List<ProductModels>>(
            selector: (context, provider) => provider.productList,
            builder: (context, productsProvider, child) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .70,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 1),
                  itemCount: productsProvider.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsDetailsScreen(
                                  productDetailsId:
                                      productsProvider[index].id as int)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              productsProvider[index].image.toString(),
                              width: 168,
                              height: 168,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              productsProvider[index].name.toString(),
                              style: GoogleFonts.jost(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 26, 26, 26)),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  ' ${productsProvider[index].currency!.name} ${productsProvider[index].price}',
                                  style: GoogleFonts.jost(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 26, 26, 26)),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                    '${productsProvider[index].currency!.name} ${productsProvider[index].priceAfterDiscount}',
                                    style: GoogleFonts.jost(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 197, 197, 197)))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
