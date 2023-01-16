import 'package:dio/dio.dart';

import '../models/driver_model.dart';
import 'db_provider.dart';

class EmployeeApiProvider {
  Future<List<Driver?>> getAllEmployees() async {
    var url = "https://63bc2bdacf99234bfa71f0ca.mockapi.io/api/drivers/Driver";
    Response response = await Dio().get(url);

    return (response.data as List).map((driver) {
      // ignore: avoid_print
      print('Inserting $driver');
      DBProvider.db.createEmployee(Driver.fromJson(driver));
    }).toList();
  }
}
