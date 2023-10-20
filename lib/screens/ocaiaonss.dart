import 'package:demo_project/displaydata/occaisons.dart';
import 'package:demo_project/models/ocaisons_list.dart';
import 'package:demo_project/screens/occaisons_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ocaions extends StatefulWidget {
  const Ocaions({super.key});
  @override
  State<StatefulWidget> createState() {
    return _OcaionsState();
  }
}

class _OcaionsState extends State<Ocaions> {
  final ocaisinprovider = Apiprovider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<OccasionType>(
                    future: ocaisinprovider.getData(),
                    builder: (context, snapshot) {
                      int len = 0;
                      if (snapshot.data != null) {
                        len = snapshot.data!.data!.occasionTypes!.length;
                        print("Len=======:  $len");
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return snapshot.data?.data?.occasionTypes != null
                          ? ListView.builder(
                              itemCount:
                                  snapshot.data!.data!.occasionTypes!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .37,
                                      width: MediaQuery.of(context).size.width *
                                          12,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(29))),
                                            child: Image.network(
                                              snapshot.data!.data!
                                                  .occasionTypes![index].banner
                                                  .toString(),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                          Positioned(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .166,
                                              right: 0,
                                              bottom: 0,
                                              left: 0,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 10),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 20,
                                                            height: 21,
                                                            child:
                                                                Image.network(
                                                              snapshot
                                                                  .data!
                                                                  .data!
                                                                  .occasionTypes![
                                                                      index]
                                                                  .icon
                                                                  .toString(),
                                                              //color: Colors.white,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data!
                                                                .occasionTypes![
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            style: GoogleFonts.jost(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color
                                                                        .fromARGB(
                                                                        1,
                                                                        255,
                                                                        255,
                                                                        255)
                                                                    .withOpacity(
                                                                        1)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      child: Row(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'Nam facilisis risus leo,\n vitae tempus nisl.',
                                                              style: GoogleFonts
                                                                  .jost(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color
                                                                        .fromARGB(
                                                                        1,
                                                                        255,
                                                                        255,
                                                                        255)
                                                                    .withOpacity(
                                                                        1),
                                                              ),
                                                            ),
                                                          ),
                                                         const Spacer(),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                // send id to details screen
                                                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                                               return  //ProductsDatas(idd: snapshot.data!.data!.occasionTypes![index].id as int);
                                                                OccaionsListScreen(occasionTypeId: snapshot.data!.data!.occasionTypes![index].id as int, );
                                                                }));
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16)),
                                                                  backgroundColor:
                                                                     const Color.fromARGB(
                                                                              1,
                                                                              242,
                                                                              85,
                                                                              0)
                                                                          .withOpacity(
                                                                              1)),
                                                              child: Text(
                                                                'View ',
                                                                style:
                                                                    GoogleFonts
                                                                        .jost(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: const Color
                                                                          .fromARGB(
                                                                          1,
                                                                          255,
                                                                          255,
                                                                          255)
                                                                      .withOpacity(
                                                                          1),
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
                              })
                          : const SizedBox.shrink();
                    },
                    ),
                    )
          ],
        ),
        );
  }
}
