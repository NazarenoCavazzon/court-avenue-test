import 'package:courtavenue/access_logs/widgets/widgets.dart';
import 'package:courtavenue/l10n/l10n.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';

class AccessLogPage extends StatelessWidget {
  const AccessLogPage(
    this.accessLog, {
    super.key,
  });

  final AccessLog? accessLog;

  @override
  Widget build(BuildContext context) {
    final shadowAccesLog = accessLog;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text(
          context.l10n.accessLog,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (shadowAccesLog == null) {
            return Center(
              child: Text(
                context.l10n.noAccessLog,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
          return AccessLogTitle(shadowAccesLog);
        },
      ),
    );
  }
}
