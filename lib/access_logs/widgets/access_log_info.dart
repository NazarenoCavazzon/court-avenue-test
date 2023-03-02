import 'package:courtavenue/l10n/l10n.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';

class AccessLogTitle extends StatelessWidget {
  const AccessLogTitle(
    this.accessLog, {
    super.key,
  });

  final AccessLog accessLog;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'id: ${accessLog.id}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            '${context.l10n.username}: ${accessLog.username}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            '${context.l10n.date}: ${accessLog.formattedDate}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
