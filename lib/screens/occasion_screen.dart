import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/repo/occasions_repo.dart';
import 'package:demo_project/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _OccasionsScreenState();
  }
}

class _OccasionsScreenState extends State<OccasionsScreen> {
  late final occasionsProvider = context.read<OccasionsProvider>();

  @override
  void initState() {
    super.initState();
    _getOccasion();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<OccasionsProvider, Tuple2<bool, List<OccasionsModels>>>(
        selector: (context, provider) =>
            Tuple2(provider.isloading, provider.occaionsList),
        builder: (context, occasionsProvider, child) {
          return occasionsProvider.item1
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
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
                          color: const Color.fromARGB(255, 26, 26, 26)),
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  body: ListView.builder(
                    itemCount: occasionsProvider.item2.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                              height: MediaQuery.of(context).size.height * .21,
                             
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      occasionsProvider.item2[index].banner
                                          .toString(),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                    height: 21,
                                                    child: Image.network(
                                                      occasionsProvider
                                                          .item2[index].icon
                                                          .toString(),
                                                      //color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    occasionsProvider
                                                        .item2[index].name
                                                        .toString(),
                                                    style: GoogleFonts.jost(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromARGB(255, 255,
                                                            255, 255)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      occasionsProvider
                                                          .item2[index]
                                                          .description
                                                          .toString(),
                                                      style: GoogleFonts.jost(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        // send id to details screen
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return ProductsScreen(
                                                            productsId:
                                                                occasionsProvider
                                                                    .item2[
                                                                        index]
                                                                    .id as int,
                                                          );
                                                        }));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(255,
                                                                  242, 85, 0)),
                                                      child: Text(
                                                        'View ',
                                                        style: GoogleFonts.jost(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              255, 255, 255),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              )));
                    },
                  ));
        });
  }

  Future<void> _getOccasion() async {
    OccasionsRepo occasionRepo = OccasionsRepo();
    occasionsProvider.setIsloading(true);
    List<OccasionsModels>? model = await occasionRepo.occaionsRepo();

    // ignore: use_build_context_synchronously
    context.read<OccasionsProvider>().updateOccasionList(model ?? []);
    occasionsProvider.setIsloading(false);
  }
}
