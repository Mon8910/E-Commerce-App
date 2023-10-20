
class Currency {
   int? id;
   String? name;
   String? lookupKey;

  Currency({
     this.id,
     this.name,
     this.lookupKey,
  });

   Currency.fromJson(Map<String, dynamic> json) {
     Currency(
      id: json['id'],
      name: json['name'],
      lookupKey: json['lookup_key'],
    );
  }}

class Product {
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
   
   
  Product(
      {this.id, this.name, this.status, this.price, this.priceAfterDiscount,this.image,this.description,this.currency,this.avgRate,this.reviewsCount});
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
     image = json['image'];
     description=json['description'];
    // currency=json['currency'];
    currency= Currency.fromJson(json['currency']);
    avgRate=json['avg_rate'];
    reviewsCount=json['reviews_count'];
    
     

  }
}
