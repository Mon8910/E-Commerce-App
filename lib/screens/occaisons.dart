import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/providers/occaisons_provider.dart';
import 'package:demo_project/repo/occasion_types_list_repo.dart';
import 'package:demo_project/screens/product_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _OccasionsScreenState();
  }
}

class _OccasionsScreenState extends State<OccasionsScreen> {
  late final occaisonsProvider = context.read<OccaisonsProvider>();

  @override
  void initState() {
    super.initState();
    _occaionsList();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<OccaisonsProvider, bool>(
      selector: (ctx, isloading) => isloading.isloading,
      builder: (context, isloading, child) {
        return isloading
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
                        color: const Color.fromARGB(1, 26, 26, 26)),
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                body: Selector<OccaisonsProvider, List<OccaionsModel>>(
                    builder: (context, occaionsList, child) {
                      return ListView.builder(
                          itemCount: occaionsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .21,
                                width: MediaQuery.of(context).size.width * .12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        occaionsList[index].banner.toString(),
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
                                                      occaionsList[index]
                                                          .icon
                                                          .toString(),
                                                      //color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    occaionsList[index]
                                                        .name
                                                        .toString(),
                                                    style: GoogleFonts.jost(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                                .fromARGB(1,
                                                                255, 255, 255)
                                                            ),
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
                                                      occaionsList[index]
                                                          .description
                                                          .toString(),
                                                      style: GoogleFonts.jost(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromARGB(
                                                            1, 255, 255, 255),
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
                                                          return //ProductsDatas(idd: snapshot.data!.data!.occasionTypes![index].id as int);
                                                              ProductListScreen(
                                                            productListId:
                                                                occaionsList[
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
                                                                  .fromARGB(1,
                                                                  242, 85, 0)),
                                                      child: Text(
                                                        'View ',
                                                        style: GoogleFonts.jost(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color
                                                              .fromARGB(
                                                              1, 255, 255, 255),
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
      },
    );
  }

  Future<void> _occaionsList() async {
    OccasionsRepo occasionRepo = OccasionsRepo();
    occaisonsProvider.setIsloading(true);
    List<OccaionsModel>? model = await occasionRepo.occaionsRepo();

    // ignore: use_build_context_synchronously
    context.read<OccaisonsProvider>().updateOccaisonList(model ?? []);
    occaisonsProvider.setIsloading(false);
  }
}
