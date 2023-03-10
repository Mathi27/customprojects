import 'package:flutter/material.dart';

class DogModel {
  String? status;
  String? message;

  DogModel({required this.status, required this.message});

  DogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
