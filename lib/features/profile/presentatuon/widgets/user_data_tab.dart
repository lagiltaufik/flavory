import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/profile/data/repository/favorites_statistic_repository_impl.dart';
import 'package:flavory/features/profile/data/source/local/favorites_statistic_local.dart';
import 'package:flavory/features/profile/presentatuon/cubit/favorites_statistic_cubit/favorites_statistic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataTab extends StatelessWidget {
  const UserDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(20),
      child: BlocProvider(
        create: (context) => FavoritesStatisticCubit(
          repo: FavoritesStatisticRepositoryImpl(
            local: FavoritesStatisticLocalImpl(db: AppDatabase()),
          ),
        )..load(FirebaseAuth.instance.currentUser!.uid),
        child: BlocBuilder<FavoritesStatisticCubit, FavoritesStatisticState>(
          builder: (context, state) {
            return Column(
              children: [
                Text("Statistics"),
                const SizedBox(
                  height: 20,
                ),
                if (state.isLoading) const CircularProgressIndicator(),

                if (state.error != null) Text(state.error!),

                if (state.spots.isNotEmpty)
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: state.spots.isEmpty
                            ? 5
                            : state.spots
                                      .map((e) => e.y)
                                      .reduce((a, b) => a > b ? a : b) +
                                  1,

                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                        ),

                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: TextStyle(fontSize: 10),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              reservedSize: 30,
                            ),
                          ),
                        ),

                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.grey),
                        ),

                        lineBarsData: [
                          LineChartBarData(
                            spots: state.spots,
                            isCurved: true,
                            color: Colors.green,

                            barWidth: 3,

                            dotData: FlDotData(
                              show: true,
                            ),

                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.green.withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
