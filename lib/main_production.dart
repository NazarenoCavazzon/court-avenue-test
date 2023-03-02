import 'dart:async';

import 'package:courtavenue/app/app.dart';
import 'package:courtavenue/bootstrap.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataPesistence = DataPersistence();
  await dataPesistence.init('production');

  unawaited(
    bootstrap(
      () => App(
        dataPesistence: dataPesistence,
      ),
    ),
  );
}
