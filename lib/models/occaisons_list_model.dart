class OccaionsModel {
  final int? id;
  final  String? name;
  final  String? icon;
  final  String? banner;
  final  String? description;





  static List<OccaionsModel> occaisonTypelist(dynamic extradata){
    final List<OccaionsModel> productlist = [];
     
        for (var i in extradata) {
          productlist.add(OccaionsModel.fromJson(i as Map<String, dynamic>));
        }
        return productlist;

      
  }
   
   
   
  OccaionsModel(
      {this.id, this.name, this.icon, this.banner,this.description });
  OccaionsModel.fromJson(Map<String, dynamic> json) : id = json['id'],
    name = json['name'],
    banner = json['banner'],
     description = json['description'],
     icon=json['icon'];
     
}

