import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/providers/get_Occaisons_provider.dart';
import 'package:demo_project/providers/prooduct_list.dart';
import 'package:demo_project/widgets/product_occasions_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OccaionsListScreen extends StatefulWidget {
  const OccaionsListScreen({super.key, this.occasionTypeId});
  final int? occasionTypeId;

  @override
  State<OccaionsListScreen> createState() {
    return _OccaionsListScreenState();
  }
}

class _OccaionsListScreenState extends State<OccaionsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductOccaisons>(context, listen: false).productListsProvider(widget.occasionTypeId!);
          
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetOccaisonsprovider>(context, listen: false)
          .ocdprovider(widget.occasionTypeId!);
    });
  }

  //final occasionLists = Apiprovderdetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Selector<GetOccaisonsprovider, OccaionsModel>(
            selector: (p0, p1) => p1.ocdd,
            builder: (context, value, child) {
              return Text(value.name.toString());
            },
          ),
          actions: const [Icon(Icons.search)],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
              )),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.onPrimary,
          elevation: 0.0,
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: const ProductOccasionWidget());
  }
}
