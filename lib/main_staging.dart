import 'dart:async';

import 'package:courtavenue/app/app.dart';
import 'package:courtavenue/bootstrap.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataPesistence = DataPersistence();
  await dataPesistence.init('staging');

  unawaited(
    bootstrap(
      () => App(
        dataPesistence: dataPesistence,
      ),
    ),
  );
}
