import 'package:courtavenue/l10n/l10n.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';

class AccessLogPage extends StatelessWidget {
  const AccessLogPage({
    required this.accessLog,
    super.key,
  });

  final AccessLog? accessLog;

  @override
  Widget build(BuildContext context) {
    final shadowAccesLog = accessLog;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.l10n.accessLog,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (shadowAccesLog == null) {
            return const Center(
              child: Text(
                'No access log',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'id: ${shadowAccesLog.id}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  '${context.l10n.username}: ${shadowAccesLog.username}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  '${context.l10n.date}: ${shadowAccesLog.formattedDate}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
