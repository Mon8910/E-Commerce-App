class datamodel {
  int? id;
    String? name;
    String? icon;
    String? banner;
    String? description;
   
   
   
  datamodel(
      {this.id, this.name, this.icon, this.banner, });
  datamodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banner = json['banner'];
     description = json['description'];
     icon=json['icon'];
     
    
     

  }
}
