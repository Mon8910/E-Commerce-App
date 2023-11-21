class Currency {
  int? id;
  String? name;
  String? lookupKey;

  Currency({this.id, this.name, this.lookupKey});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lookupKey = json['lookup_key'];
  }
}

class ProductModels {
  int? id;
  String? name;
  String? status;
  double? price;
  double? priceAfterDiscount;
  String? image;
  String? description;
  Currency? currency;
  double? avgRate;
  int? reviewsCount;
  static List<ProductModels> productList(dynamic extradata){
    final List<ProductModels> productlist = [];
     
        for (var i in extradata) {
          productlist.add(ProductModels.fromJson(i as Map<String, dynamic>));
        }
        return productlist;

      
  }

  ProductModels(
      {this.id,
      this.name,
      this.status,
      this.price,
      this.priceAfterDiscount,
      this.image,
      this.description,
      this.currency,
      this.avgRate,
      this.reviewsCount});
  ProductModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    image = json['image'];
    description = json['description'];

    currency = json['currency'] != null
        ?  Currency.fromJson(json['currency'])
        : null;
    avgRate = json['avg_rate'];
    reviewsCount = json['reviews_count'];
  }
}
