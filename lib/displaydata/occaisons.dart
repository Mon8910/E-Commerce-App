import 'package:demo_project/constants/variables.dart';
import 'package:demo_project/models/ocaisons_list.dart';
import 'package:http/http.dart' as http;


class Apiprovider{
  Future<OccasionType>  getData()async{
    final url=Uri.parse(Appurl.occaisonsType);
    final req=await http.get(url,headers: {
      'Cookie':'__profilin=p%3Dt',
      'Postman-Token':'<calculated when request is sent>',
      'User-Agent':'PostmanRuntime/7.33.0',
      'Accept':'*/*',
      'Accept-Encoding':'gzip, deflate, br',
      'Connection':'keep-alive'

    });
    if(req.statusCode==200){
      final body=req.body;
       final occasionType = occasionTypeFromJson(body);
       print(occasionType);
       return occasionType;
      
      
       
        //return occasionTypes;

       

    }else{
      final body=req.body;
       final error = occasionTypeFromJson(body);
       print(error);
       return error;

    }
    


  }

}