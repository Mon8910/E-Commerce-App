class OccasionsModels {
  final int? id;
  final  String? name;
  final  String? icon;
  final  String? banner;
  final  String? description;





  static List<OccasionsModels> occasionTypelist(dynamic extradata){
    final List<OccasionsModels> productlist = [];
     
        for (var i in extradata) {
          productlist.add(OccasionsModels.fromJson(i as Map<String, dynamic>));
        }
        return productlist;

      
  }
   
   
   
  OccasionsModels(
      {this.id, this.name, this.icon, this.banner,this.description });
  OccasionsModels.fromJson(Map<String, dynamic> json) : id = json['id'],
    name = json['name'],
    banner = json['banner'],
     description = json['description'],
     icon=json['icon'];
     
}

