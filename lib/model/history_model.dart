// class HistoryModel {
//   int id=0;
//   String wakeup="";
//   String bedtime="";
//
//   String createdAt="";
//   String updatedAt="";
//
//
//
//   HistoryModel.empty();
//
//   HistoryModel(
//       {required this.id,
//         required this.wakeup,
//         required this.bedtime,
//
//         required this.createdAt,
//         required this.updatedAt,
//         });
//
//   HistoryModel.fromJson(Map<String, dynamic> json ) {
//
//     id = json['id']??0;
//     wakeup = json['wakeup']??'';
//     bedtime = json['bedtime']??'';
//
//     createdAt = json['created_at']??'';
//     updatedAt = json['updated_at']??'';
//
//   }
//
//   @override
//   String toString() {
//     return 'Data{id: $id, name: $wakeup, description: $bedtime,  createdAt: $createdAt, updatedAt: $updatedAt,}';
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class HistoryModel {
  int id = 0;
  String wakeup = "";
  String bedtime = "";
  String createdAt = "";
  String updatedAt = "";

  HistoryModel.empty();

  HistoryModel({
    required this.id,
    required this.wakeup,
    required this.bedtime,
    required this.createdAt,
    required this.updatedAt,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    wakeup = json['wakeup'] ?? '';
    bedtime = json['bedtime'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  @override
  String toString() {
    return 'HistoryModel{id: $id, wakeup: $wakeup, bedtime: $bedtime, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}