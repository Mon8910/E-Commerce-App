
import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/providers/product_occaisons_details.dart';
import 'package:demo_project/widgets/decoration.details.dart';
import 'package:demo_project/widgets/list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OccaisonsListDetails extends StatefulWidget {
  const OccaisonsListDetails({super.key, this.idproductdetails});
  final int? idproductdetails;
  @override
  State<OccaisonsListDetails> createState() {
    return _OccaisonsListDetailsState();
  }
}

class _OccaisonsListDetailsState extends State<OccaisonsListDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductDetailsProvider>(context, listen: false)
          .getdetails(widget.idproductdetails!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Selector<ProductDetailsProvider, Product>(
                selector: ((p0, p1) => p1.productlists),
                builder: (context, value, child) {
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
                                value.image.toString(),
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
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          const Color.fromARGB(1, 255, 255, 255)
                                              .withOpacity(1)),
                                  child:  IconButton(onPressed:(){
                                    Navigator.of(context).pop();
                                  } , icon:const Icon(Icons.arrow_back_ios,
                                    size: 16,))
                                ))
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
                                color: const Color.fromARGB(1, 110, 123, 137)
                                    .withOpacity(1),
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
                          value.name.toString(),
                          style: GoogleFonts.jost(
                              color: const Color.fromARGB(1, 26, 26, 26)
                                  .withOpacity(1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                       Row(
                         children: [
                           RatingBarIndicator(itemBuilder: (context,_){
                           return const Icon(Icons.star,color: Colors.amber,);
                           },itemCount: 5,rating: 0,itemSize: 15,),
                          const SizedBox(width: 4,),
                           Text(value.avgRate.toString(),style: GoogleFonts.jost(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
                           ),),
                           const SizedBox(width: 5,),
                           Text('(${value.avgRate})',style: GoogleFonts.jost(
                            color:const Color.fromARGB(1, 66, 66, 66).withOpacity(1),
                            fontSize: 8,
                            fontWeight: FontWeight.w400
                           ),)
                         ],
                       ),
                      const SizedBox(height: 10,),
                       Row(
                        children: [
                          Text('\SAR ${value.price}',style: GoogleFonts.jost(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)
                          ),),
                       const   SizedBox(width: 8,),
                       Text('\SAR ${value.priceAfterDiscount}',style: GoogleFonts.jost(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:const Color.fromARGB(1, 197, 197, 197).withOpacity(1),
                        decoration:  TextDecoration.lineThrough
                       ),)
                        ],
                       ),
                       const SizedBox(height: 12,),
                       Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*.290,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(
                            width: 1,
                            color:const Color.fromARGB(1, 236, 236, 236).withOpacity(1)
                          ),
                          bottom: BorderSide(
                            width: 1,color:const Color.fromARGB(1, 236, 236, 236).withOpacity(1),
        
                          ))
                        ),
        
                        child:  Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Colors ',style: GoogleFonts.jost(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
        
                            ),)
                           
                           , const SizedBox(height: 10,),
                         const  DecorationDetails(),
                         const  SizedBox(height: 10,),
                         Text('Sizes ',style: GoogleFonts.jost(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
        
                            ),),
                           const SizedBox(height: 10,),
                          const ListButtons()
                            
                          ],
                        ),

                        
                       )
                     , const SizedBox(height: 10,),

                    Text('Description',style: GoogleFonts.jost(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color:const Color.fromARGB(1, 26, 26, 26) .withOpacity(1),
                    ),)
                    ,const SizedBox(height:10 ,),
                    Text(value.description.toString(),style: GoogleFonts.jost(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:const Color.fromARGB(1, 82, 82, 82).withOpacity(1)
                    ),)
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
  }
}
