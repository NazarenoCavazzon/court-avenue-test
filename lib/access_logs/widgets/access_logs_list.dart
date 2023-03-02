import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';

class AccessLogList extends StatelessWidget {
  const AccessLogList(this.accessLogs, {super.key});

  final List<AccessLog> accessLogs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: accessLogs
            .map(
              (accesLog) => Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    accesLog.accessToString,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
