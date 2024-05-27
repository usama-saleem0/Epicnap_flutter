import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;

import '../model/response_model.dart';

import 'package:http_parser/http_parser.dart';




class HttpRequestClient{

  HttpRequestClient._internalConstructor();

  static final HttpRequestClient _instance = HttpRequestClient._internalConstructor();

  factory HttpRequestClient(){
    return _instance;
  }

  static const int _kSecondsTimeout = 30;

  static const String _kTimeOutMessage = "Unable to process request";
  static const String _kInternetIssue = "Your internet connection is not stable";
  static const String _kOtherException = "Unable to process request";



  // Future<ResponseModel> postRequest({required String url,dynamic requestBody,bool isTokenRequired=false,dynamic requestHeader})async{
  //   try{
  //     ResponseModel responseModel = ResponseModel();
  //     Map<String,String> header ={};
  //     if(isTokenRequired){
  //       header = await getRequestHeader(isBearer: true);
  //     }
  //     http.Response response = await http.post(Uri.parse(url),body: requestBody).timeout(const Duration(seconds: _kSecondsTimeout));
  //     // print(response.body);
  //     if((response.statusCode>=200 && response.statusCode<=230)){
  //       return responseModel=ResponseModel.fromJson(jsonDecode(response.body));
  //
  //     }else{
  //       responseModel = ResponseModel.errorFromJson(jsonDecode(response.body));
  //     }
  //     return responseModel;
  //   } on TimeoutException catch (e) {
  //     return Future.value(
  //       ResponseModel.named(
  //         statusCode: 408,
  //         statusDescription: _kTimeOutMessage,
  //         data: e.toString(),
  //       ),
  //     );
  //   } on SocketException catch (e) {
  //     return Future.value(
  //       ResponseModel.named(
  //         statusCode: 400,
  //         statusDescription: _kInternetIssue,
  //         data: e.toString(),
  //       ),
  //     );
  //   } catch (e) {
  //     return Future.value(
  //       ResponseModel.named(
  //         statusCode: 500,
  //         statusDescription: _kOtherException,
  //         data: e.toString(),
  //       ),
  //     );
  //   }
  // }

  Future<ResponseModel> postRequest({
    required String url,
    dynamic requestBody,
    bool isTokenRequired = false,
    dynamic requestHeader,
  }) async {
    try {
      ResponseModel responseModel = ResponseModel();
      Map<String, String> headers = {
        'Content-Type':'application/json'
      };

      // Set Content-Type to application/json


      // if (isTokenRequired) {
      //   Map<String, String> tokenHeader = await getRequestHeader(isBearer: true);
      //   headers.addAll(tokenHeader);
      // }
      //
      // if (requestHeader != null && requestHeader is Map<String, String>) {
      //   headers.addAll(requestHeader);
      // }

      print("headers : $headers");
      print("url : $url");


      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody), // Encode requestBody to JSON
      ).timeout(const Duration(seconds: _kSecondsTimeout));

      if (response.statusCode >= 200 && response.statusCode <= 230) {
        return responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      } else {
        responseModel = ResponseModel.errorFromJson(jsonDecode(response.body));
      }

      return responseModel;
    }
    on TimeoutException catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 408,
          statusDescription: _kTimeOutMessage,
          data: e.toString(),
        ),
      );
    } on SocketException catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 400,
          statusDescription: _kInternetIssue,
          data: e.toString(),
        ),
      );
    } catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 500,
          statusDescription: _kOtherException,
          data: e.toString(),
        ),
      );
    }
  }


  Future<ResponseModel> postmultipartRequest({
    required String url,
    dynamic requestBody,
    bool isTokenRequired = false,
    dynamic requestHeader,
  }) async {
    // try {
    ResponseModel responseModel = ResponseModel();
    Map<String, String> header = {};
    if (isTokenRequired) {
      header = await getRequestHeader(isBearer: true);
    }

    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add headers


    // Add fields

    print("---------------------------------------------}");

    if (requestBody != null) {
      for (var key in requestBody.keys) {
        if (requestBody[key] is http.MultipartFile) {

          request.files.add(await http.MultipartFile.fromPath('image', requestBody[key].path));

          // request.files.add(http.MultipartFile(
          //     key,
          //     requestBody[key].readAsBytes().asStream(),
          //     requestBody[key].lengthSync(),
          //     filename: (requestBody[key] as http.MultipartFile).filename,
          //     contentType: MediaType('application', 'octet-stream')),
          // );
        }

        else {
          request.fields[key] = requestBody[key].toString();
        }



      }
      request.headers.addAll(header);
      print(
          "image type : ${request.fields.toString()}");
    }

    http.Response response =
    await http.Response.fromStream(await request.send()).timeout(
      const Duration(seconds: _kSecondsTimeout),
    );


    print("response ${response.body}");
    if ((response.statusCode >= 200 && response.statusCode <= 230)) {
      return responseModel = ResponseModel.fromJson(jsonDecode(response.body));
    } else {
      responseModel = ResponseModel.errorFromJson(jsonDecode(response.body));
    }

    return responseModel;
  }
  //   } on TimeoutException catch (e) {
  //     print("res catch err :2 $e");
  //     return Future.value(
  //       ResponseModel.named(
  //         statusCode: 408,
  //         statusDescription: _kTimeOutMessage,
  //         data: e.toString(),
  //       ),
  //     );
  //   } on SocketException catch (e) {
  //     print("res catch err : 1 $e");
  //     return Future.value(
  //       ResponseModel.named(
  //         statusCode: 400,
  //         statusDescription: _kInternetIssue,
  //         data: e.toString(),
  //       ),
  //     );
  //   } catch (e) {
  //     print("res catch err : $e");
  //     return Future.value(
  //       ResponseModel.named(
  //         statusCode: 500,
  //         statusDescription: _kOtherException,
  //         data: e.toString(),
  //       ),
  //     );
  //   }
  // }


  Future<ResponseModel> postRequestWithToken({required String url,dynamic requestBody,bool isTokenRequired=false,dynamic requestHeader})async{
    try{
      ResponseModel responseModel = ResponseModel();
      Map<String,String> header ={};
      if(isTokenRequired){
        header = await getRequestHeaderWithToken(isBearer: true);
      }
      http.Response response = await http.post(Uri.parse(url),body: jsonEncode(requestBody),headers: isTokenRequired ? header : requestHeader).timeout(const Duration(seconds: _kSecondsTimeout));
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = response.body.startsWith('{') || response.body.startsWith('[') ? jsonDecode(response.body) : response.body;
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
        responseModel.header=response.headers;
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(response.body));
      }
      return responseModel;
    } on TimeoutException catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 408,
          statusDescription: _kTimeOutMessage,
          data: e.toString(),
        ),
      );
    } on SocketException catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 400,
          statusDescription: _kInternetIssue,
          data: e.toString(),
        ),
      );
    } catch (e) {
      return Future.value(
        ResponseModel.named(
          statusCode: 500,
          statusDescription: _kOtherException,
          data: e.toString(),
        ),
      );
    }
  }

  Future<ResponseModel> getRequestWithOutHeader({required String url,bool isTokenRequired=false}) async {
    try {
      Map<String,String> header ={};
      if(isTokenRequired){
        header = await getRequestHeaderWithToken(isBearer: true,isContentType: true);
      }
      http.Response response = await http.get(Uri.parse(url),headers: isTokenRequired ? header : {}).timeout(const Duration(seconds: _kSecondsTimeout));
      ResponseModel responseModel = ResponseModel();
      if (response.statusCode ==200) {
        responseModel.statusCode = response.statusCode;
        responseModel.statusDescription = "Success";
        responseModel.data = response.body;
      }

      return responseModel;
    } on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: ""));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: ""));
    } catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: ""));
    }
  }

  Future<ResponseModel> putRequestWithOutHeader({required String url,bool isTokenRequired=false}) async {
    try {
      Map<String,String> header ={};
      if(isTokenRequired){
        header = await getRequestHeaderWithToken(isBearer: true,isContentType: true);
      }
      http.Response response = await http.put(Uri.parse(url),headers: isTokenRequired ? header : {}).timeout(const Duration(seconds: _kSecondsTimeout));
      ResponseModel responseModel = ResponseModel();
      if (response.body.length > 4) {
        responseModel.statusCode = response.statusCode;
        responseModel.statusDescription = "Success";
        responseModel.data = response.body;
      }

      return responseModel;
    } on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: ""));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: ""));
    } catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: ""));
    }
  }


  Future<Map<String, String>> getRequestHeader({bool isBearer = true,bool isContentType=true})async{
    //  String token = await SessionManagement().getSessionToken(tokenKey: kLoginSessionTokenKey);
    Map<String,String> header={
      // 'Authorization' : isBearer ? 'Bearer token' : 'token',
      if(isContentType)'Content-Type': 'application/json'
    };
    return header;
  }

  Future<Map<String, String>> getRequestHeaderWithToken({bool isBearer = true,bool isContentType=true})async{

    Map<String,String> header={

      if(isContentType)'Content-Type': 'application/json'
    };
    return header;
  }

}