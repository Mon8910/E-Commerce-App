class UserModel  {
  final int? id;
 final String? countrycode;
 final String? phoneNumber;
 final String? name;
 final String? status;
 final String? userType;


  UserModel ({this.id, this.countrycode, this.phoneNumber, this.name,this.status,this.userType});
  UserModel .fromJson(Map<String, dynamic> json)
      : id = json['id'],
        countrycode = json['country_code'],
        phoneNumber = json['phone_number'],
        name = json['name'],
        status=json['status'],
        userType=json['user_type'];
        Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "country_code": countrycode,
      "phone_number": phoneNumber,
      "status": status,
      "user_type":userType
      
    };
        }
}
