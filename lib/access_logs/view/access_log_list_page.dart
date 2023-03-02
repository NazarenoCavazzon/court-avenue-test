import 'package:courtavenue/access_logs/cubit/access_logs_cubit.dart';
import 'package:courtavenue/l10n/l10n.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccessLogListPage extends StatelessWidget {
  const AccessLogListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccessLogsCubit(
        dataPersistence: context.read<DataPersistence>(),
      ),
      child: const AccessLogListView(),
    );
  }
}

class AccessLogListView extends StatefulWidget {
  const AccessLogListView({super.key});

  @override
  State<AccessLogListView> createState() => _AccessLogListViewState();
}

class _AccessLogListViewState extends State<AccessLogListView> {
  @override
  void initState() {
    super.initState();
    context.read<AccessLogsCubit>().getAccessLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.l10n.accessLogList,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AccessLogsCubit, AccessLogsState>(
        builder: (context, state) {
          if (state.isFailure) {
            return Center(
              child: Text(
                'Error: ${state.error}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          } else if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.accessLogs.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noAccessLogs,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: state.accessLogs
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
        },
      ),
    );
  }
}
