import 'dart:convert';
import 'package:cruid_app_ii_by_rabbil_hasan/Utility/Utility.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';


Future<bool> ProductDeleteReq(id) async {
  var URL= Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct/"+id);
  var PostHeader={"Content-type":"application/json"};
  var response= await http.get(URL,headers:PostHeader);
  var ResultCode=response.statusCode;
  var ResultBoady=jsonDecode(response.body);

  if(response.statusCode==200 ){
    SuccesTost("Delete Succesfull");
    return true;

  }else{
    ErrorTost('Error on server! Try Again');
    return false;
  }

}




Future<List> ProductGridViewListRequest() async {
  var URL= Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader={"Content-type":"application/json"};
  var response= await http.get(URL,headers:PostHeader);


  //response code && body
  var restlcode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(response.statusCode==200){
    SuccesTost("Refreshed");
    return ResultBody['data'];
  }else{
    ErrorTost('Request failed ! Try Again');
    return [];
  }



  // Response response = await post(
  //   URL,
  //   body: jsonEncode(URL),
  //   headers: {'content-type': 'application/json'},
  // );

}






Future<bool> ProductCreateRequest(FormValues) async {
  
  // Step 1: Set Url
  const String addNewProductUrl = 'https://crud.teamrabbil.com/api/v1/CreateProduct';

  // Step 2:  Prepare

  // URI -> Uniform Resource Identifier
  // Step 3: Parse
  Uri uri = Uri.parse(addNewProductUrl);
  // Step 4: Send Request
  Response response = await post(
    uri,
    body: jsonEncode(FormValues),
    headers: {'content-type': 'application/json'},
  );
  print(response.statusCode);
  print(response.body);
  print(response.headers);

  if (response.statusCode == 200) {
    SuccesTost("Succesfully Added");
    return true;
  } else {
    ErrorTost('Request failed ! Try Again');
    return false;
  }
}






















// ProductCreateRequest(FormValues) async{
//   var URL=Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
//   var PostBody=json.encode(FormValues);
//   var PostHeader={"Content-Type":"application/json"};
//
//   Response response = await post(
//     URL,
//     body: jsonEncode(FormValues),
//     headers: {'content-type': 'application/json'},
//   );
//   var ResultCode=response.statusCode;
//   // var ResultBody=response.body;
//   var ResultBody=json.decode(response.body);
//
//
//
//   if(ResultCode == 200 ){
// print('OK');
//   }else{
//     ErrorTost("Request Failed!");
//   }
//
// }