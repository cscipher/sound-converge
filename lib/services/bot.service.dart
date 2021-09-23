import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/services/endpointConfig.dart';

Future<BotChat> querySong(String song) async {
  final url = finalUrl(Endpoint.querySong);
  final resp = await httpClient(url, Request.post);
  return BotChat.fromJson(resp);
}
