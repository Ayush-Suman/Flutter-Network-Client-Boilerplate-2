import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:networkclietboilerplate/base/calltype.dart';
import 'package:networkclietboilerplate/base/httpworker.dart';
import 'package:networkclietboilerplate/base/modelclassselector.dart';
import 'package:networkclietboilerplate/base/tokenhandler.dart' as TokenHandler;

Function _modifyToken = (token)=> token;

void networkInit({@required String Url, @required ModelClassSelector modelClassSelector, Function tokenModifier}){
  URL = Url;
  init(modelClassSelector);
  _modifyToken = tokenModifier;
}

void setTokenModifier({Function tokenModifier}){
  _modifyToken = tokenModifier;
}

get _token => _modifyToken(TokenHandler.token);

Future<T> request<T>(String route, {
  @required CALLTYPE call,
  Map<String, String> param,
  Map<String, dynamic> header,
  Map<String, dynamic> body,
  bool auth=false,
  http.Client client,
}) async {

  Map<String, dynamic> data = {
    'route':route,
    'call':call,
    'param':param,
    'header':header,
    'body':body,
    'auth':auth,
    'client':client,
    'token': _token
  };
  await isReady;
  dynamic response = await sendRequest(data);
  return response as T;
}

void authenticate(String token){
  TokenHandler.saveToken(token);
}

void unauthenticate(){
  TokenHandler.deleteToken();
}

