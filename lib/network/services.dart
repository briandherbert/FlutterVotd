import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_app/model/votd_story.dart';
import 'dart:convert';

Future<VotdStory> getVotdStory(String url) async {
  final response = await http.get(url);
  return VotdStory.fromJson(json.decode(response.body));
}