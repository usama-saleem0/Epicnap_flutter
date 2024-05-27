import 'dart:convert';

import 'package:first_project/model/alarm_model.dart';
import 'package:first_project/model/influncer_model.dart';
import 'package:first_project/model/notification_model.dart';
import 'package:first_project/model/survey_model.dart';

class UserModel {
  int id=0;
  String name="";
  String email="";
  String emailVerifiedAt="";
  String createdAt="";
  String updatedAt="";
  String country="";
  String type="";
  String message="";
  String lastbedtime="";
  String wakeup="";

  int totallastsleep= 0;
  int totalweek= 0;
  int totalmonth= 0;
  int sleepquality=0;
  int sleepmood=0;
  int sleepamount=0;
  int totalsleep=0;
  int totalsleepmonth=0;
  String lastAlarmTimer="";
  List<AlarmModel> alarms;
  List<SurveyModel> surveys;
  List<NotificationModel> notify;

  InfluencerModel influencerModel=InfluencerModel.empty();

  // UserModel.empty();

  UserModel.empty()
      : id = 0,
        name = '',
        email = '',
        emailVerifiedAt = '',
        createdAt = '',
        updatedAt = '',
        country = '',
        type = '',
        message = '',
        lastAlarmTimer = '',
        lastbedtime = '',
        wakeup = '',

        totallastsleep = 0,
        totalmonth = 0,
        totalweek = 0,
        sleepquality = 0,
        sleepmood = 0,
        sleepamount = 0,
        totalsleep = 0,
        totalsleepmonth = 0,
        alarms = [],
        surveys = [],
        notify = [];


  UserModel(
      {required this.id,
        required this.name,
        required this.email,
        required  this.emailVerifiedAt,
        required  this.createdAt,
        required  this.updatedAt,
        required  this.country,
        required  this.type,
        required  this.lastAlarmTimer,
        required  this.lastbedtime,
        required  this.wakeup,

        required  this.totallastsleep,
        required  this.totalmonth,
        required  this.totalweek,
        required  this.sleepquality,
        required  this.sleepmood,
        required  this.sleepamount,
        required  this.totalsleep,
        required  this.totalsleepmonth,
        required this.alarms,
        required this.surveys,
        required this.notify,
        // required this.influencerModel
      });


  UserModel.fromJson(Map<String, dynamic> json, String messageD)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        email = json['email'] ?? '',
        emailVerifiedAt = json['email_verified_at'] ?? '',
        createdAt = json['created_at'] ?? '',
        updatedAt = json['updated_at'] ?? '',
        country = json['country'] ?? '',
        type = json['type'] ?? '',
        message = messageD,
        lastAlarmTimer = json['last_alarm_timer'] ?? '',
        lastbedtime = json['last_bed_time'] ?? '',
        wakeup = json['wakeup'] ?? '',

        totallastsleep = json['totallastsleep'] ?? 0,
        totalweek = json['totalweek'] ?? 0,
        totalmonth = json['totalmonth'] ?? 0,
        sleepquality = json['sleepquality'] ?? 0,
        sleepmood = json['sleepmood'] ?? 0,
        sleepamount = json['sleepamount'] ?? 0,
        totalsleepmonth = json['totalsleepmonth'] ?? 0,
        totalsleep = json['totalsleep'] ?? 0,
        alarms = (json['alarm'] as List<dynamic> ?? [])
            .map((alarmJson) => AlarmModel.fromJson(alarmJson))
            .toList(),

        surveys = (json['survey'] as List<dynamic> ?? [])
            .map((surveyJson) => SurveyModel.fromJson(surveyJson))
            .toList(),
        notify = (json['notify'] as List<dynamic> ?? [])
            .map((notifyJson) => NotificationModel.fromJson(notifyJson))
            .toList(),


        influencerModel = InfluencerModel.fromJson(json['influencer'] ?? {});



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'country': country,
      'type': type,
      'message': message,
      'last_alarm_timer' : lastAlarmTimer,
      'last_bed_time' : lastbedtime,
      'wakeup' : wakeup,

      'totallastsleep' : totallastsleep,
      'totalmonth' : totalmonth,
      'totalweek' : totalweek,
      'sleepquality' : sleepquality,
      'sleepmood' : sleepmood,
      'sleepamount' : sleepamount,
      'totalsleep' : totalsleep,
      'totalsleepmonth' : totalsleepmonth,
      'alarm': alarms.map((alarm) => alarm.toJson()).toList(),
      'survey': surveys.map((survey) => survey.toJson()).toList(),
      'notify': notify.map((notify) => notify.toJson()).toList(),
      // 'influencer': influencerModel.toJson(),
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

}
