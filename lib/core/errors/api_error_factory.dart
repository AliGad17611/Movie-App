import 'package:flutter/material.dart';
import 'package:movie_app/core/errors/api_error_model.dart';
import 'package:movie_app/core/network/local_status_codes.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError => ApiErrorModel(
        message: "Something went wrong",
        icon: Icons.error,
        statusCode: LocalStatusCodes.defaultError,
      );
}
