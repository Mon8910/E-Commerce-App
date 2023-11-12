import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/providers/prooduct_list.dart';
import 'package:demo_project/providers/show_occasion_types_provider.dart';
import 'package:demo_project/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ProductOccasionWidget extends StatelessWidget{
  const ProductOccasionWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProductOccaisons>(context);
   return provider.isloading? const Center(child: CircularProgressIndicator(),): Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .099,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
                    )),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/discount-shape.png',
                  ),
                  title: Selector<ShowOccaisonsProvider,OccaionsModel>(selector: (p0, p1) => p1.getOccaison,builder: (context,value,child){
            return Text('Top offers for ${value.name.toString()}',style: GoogleFonts.jost(
                        fontSize: 14, fontWeight: FontWeight.w700),);
          },) ,
                  subtitle:Selector<ShowOccaisonsProvider,OccaionsModel>(selector: (p0, p1) => p1.getOccaison,builder: (context,value,child){
            return Text('Discover top offers for ${value.name.toString()}’s gift and save money ' ,style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400, fontSize: 10),);
          },),
                  trailing:const Icon(Icons.keyboard_arrow_right,),
                ),
              ),
            ),
            Expanded(child: Selector<ProductOccaisons,List<Product>>(selector: (p0, p1) => p1.productList,
              builder: (context, value, child) {
                
                return GridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .70,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 1
                        )
                        ,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OccaisonsListDetails(idproductdetails: value[index].id as int) ));
                          },

                         
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start
                              
                              
                              ,children: [
                                Image.network(value[index].image.toString(),width: 168,height: 168,fit: BoxFit.cover,),
                               const SizedBox(
                                  height: 10,
                                ),
                                Text(value[index].name.toString(),style: GoogleFonts.jost(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)

                          ),),
                        const Spacer(),
                          Row(
                            children: [
                            Text(' ${value[index].currency!.name.toString()} ${value[index].price.toString()}',style: GoogleFonts.jost(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)
                            ),),
                           const SizedBox(width: 4,),
                             Text('${value[index].currency!.name.toString()} ${value[index].priceAfterDiscount.toString()}',
                          style: GoogleFonts.jost(
                            decoration:  TextDecoration.lineThrough,
                            fontSize:12 ,
                            fontWeight: FontWeight.w500,
                            color:const Color.fromARGB(1, 197, 197, 197).withOpacity(1)
                          ))
                            ],
                          ),
                          

                                
                            
                            ],
                            )
                          
                        
                                             ,
                          ),
                        
                      );
                    });
              },
             
              
            ),
              
            ),
            
            
          ],
        )
                         ;
  }
}