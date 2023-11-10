import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/providers/occaisons_provider.dart';
import 'package:demo_project/screens/products_occasion_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Ocaions extends StatefulWidget {
  const Ocaions({super.key});
  @override
  State<StatefulWidget> createState() {
    return _OcaionsState();
  }
}

class _OcaionsState extends State<Ocaions> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Occaisonsprovider>(context, listen: false).occaisonsprovider();
    });
  }

  @override
  Widget build(BuildContext context) {final provider=Provider.of<Occaisonsprovider>(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset('assets/images/noty.png'),
          ),
        ],
        title: Text(
          'Occasions',
          style: GoogleFonts.jost(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1)),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body:provider.isloading?const Center(child:CircularProgressIndicator() ,) : Selector<Occaisonsprovider, List<OccaionsModel>>(
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .21,
                      width: MediaQuery.of(context).size.width * 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              value[index].banner.toString(),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 0,
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 21,
                                          child: Image.network(
                                            value[index].icon.toString(),
                                            //color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          value[index].name.toString(),
                                          style: GoogleFonts.jost(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                      1, 255, 255, 255)
                                                  .withOpacity(1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            value[index].description.toString(),
                                            style: GoogleFonts.jost(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                      1, 255, 255, 255)
                                                  .withOpacity(1),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                            onPressed: () {
                                              // send id to details screen
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return //ProductsDatas(idd: snapshot.data!.data!.occasionTypes![index].id as int);
                                                    OccaionsListScreen(
                                                  occasionTypeId:
                                                      value[index].id as int,
                                                );
                                              }));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                            1, 242, 85, 0)
                                                        .withOpacity(1)),
                                            child: Text(
                                              'View ',
                                              style: GoogleFonts.jost(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: const Color.fromARGB(
                                                        1, 255, 255, 255)
                                                    .withOpacity(1),
                                              ),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          selector: (context, p1) => p1.occaionsList),
    );
  }
}
