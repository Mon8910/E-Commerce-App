import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/providers/prooduct_list.dart';
import 'package:demo_project/providers/show_occasion_types_provider.dart';
import 'package:demo_project/repo/product_list_repo.dart';
import 'package:demo_project/repo/show_occasion_types.dart';
import 'package:demo_project/widgets/product_occasions_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.productListId});
  final int? productListId;

  @override
  State<ProductListScreen> createState() {
    return _ProductListScreenState();
  }
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final productListProvider=context.read<ProductOccaisonsProvider>();
  @override
  void initState() {
    super.initState();
    _getProductList();

    _getShowOccaisonType();
  }

  //final occasionLists = Apiprovderdetails();
  @override
  Widget build(BuildContext context) {
    return Selector<ProductOccaisonsProvider, bool>(
      selector: (ctx, mytype) => mytype.isloading,
      builder: (context,isloading , child) {
        return isloading?const Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Selector<ShowOccaisonsProvider, OccaionsModel>(
            selector: (ctx, getOccaison) => getOccaison.getOccaison,
            builder: (context, showOccaisonsType, child) {
              return Text(showOccaisonsType.name.toString());
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
        body: const ProductListWidget());
      },
    );
  }

  Future<void> _getShowOccaisonType() async {
    ShowOccaisonsRepo occaisonsRepo = ShowOccaisonsRepo();
    OccaionsModel? showOccaionsTypes =
        await occaisonsRepo.showOccaison(widget.productListId!);
        // ignore: use_build_context_synchronously
    context.read<ShowOccaisonsProvider>().updateOccaisonShow(showOccaionsTypes!);
    //------------Or--------------------------------------
    // if (showOccaionsTypes != null) {
    //   // ignore: use_build_context_synchronously
    //   context
    //       .read<ShowOccaisonsProvider>()
    //       .updateOccaisonShow(showOccaionsTypes);
    // }
    // ignore: use_build_context_synchronously
   
  }

  Future<void> _getProductList() async {
    ProductListRepo productListRepo = ProductListRepo();
    productListProvider.setIsloading(true);
    List<Product>? model =
        await productListRepo.productList(widget.productListId!);
        // ignore: use_build_context_synchronously
        context.read<ProductOccaisonsProvider>().updateProductList(model??[]);
        productListProvider.setIsloading(false);

    // if (model != null) {
    //   // ignore: use_build_context_synchronously
    //   context.read<ProductOccaisonsProvider>().updateProductList(model);
    // }
  }
}
