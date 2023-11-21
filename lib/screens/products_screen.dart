import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/providers/product_provider.dart';
import 'package:demo_project/providers/show_occasion_types_provider.dart';
import 'package:demo_project/repo/products_repo.dart';
import 'package:demo_project/repo/show_occasion_types.dart';
import 'package:demo_project/widgets/products_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, this.productsId});
  final int? productsId;

  @override
  State<ProductsScreen> createState() {
    return _ProductsScreenState();
  }
}

class _ProductsScreenState extends State<ProductsScreen> {
  late final productListProvider=context.read<ProductsProvider>();
  @override
  void initState() {
    super.initState();
    _getProducts();

    _getShowOccasionType();
  }

  //final occasionLists = Apiprovderdetails();
  @override
  Widget build(BuildContext context) {
    return Selector<ProductsProvider, bool>(
      selector: (context, provider) => provider.isloading,
      builder: (context,isloading , child) {
        return isloading?const Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Selector<ShowOccasionsProvider, OccasionsModels>(
            selector: (context, provider) => provider.getOccaSion,
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
        body: const ProductsWidget());
      },
    );
  }

  Future<void> _getShowOccasionType() async {
    ShowOccaisonsRepo occaisonsRepo = ShowOccaisonsRepo();
    OccasionsModels? showOccaionsTypes =
        await occaisonsRepo.showOccaison(widget.productsId!);
        // ignore: use_build_context_synchronously
    context.read<ShowOccasionsProvider>().updateOccasionShow(showOccaionsTypes!);
    
   
  }

  Future<void> _getProducts() async {
    ProductsRepo productListRepo = ProductsRepo();
    productListProvider.setIsloading(true);
    List<ProductModels>? productsList =
        await productListRepo.productsRepo(widget.productsId!);
        // ignore: use_build_context_synchronously
        context.read<ProductsProvider>().updateProductList(productsList??[]);
        productListProvider.setIsloading(false);
        //------------------Or--------------------------
    // if (model != null) {
    //   // ignore: use_build_context_synchronously
    //   context.read<ProductOccaisonsProvider>().updateProductList(model);
    // }
  }
}
