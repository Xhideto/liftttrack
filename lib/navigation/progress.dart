import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:fl_chart/fl_chart.dart';
import 'exer.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('wss://your-websocket-url'),
  );

  List<Rep> reps = [];

  @override
  void initState() {
    super.initState();
    channel.stream.listen((data) {
      // Parse the incoming data and update the reps list
      final rep = Rep.fromJson(data);
      setState(() {
        reps.add(rep);
      });
    });
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final correctReps = reps.where((rep) => rep.isCorrect).length;
    final incorrectReps = reps.length - correctReps;

    return Scaffold(
      appBar: AppBar(
        title: Text('PROGRESS', style: TextStyle(color: Colors.white)), // White text
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: reps.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No data available.'),
          ],
        ),
      )
          : Column(
        children: [
          Text('Correct Reps: $correctReps'),
          Text('Incorrect Reps: $incorrectReps'),
          SizedBox(
            height: 200,
            child: ProgressGraph(reps: reps),
          ),
          TipsSection(tips: _generateTips(incorrectReps)),
        ],
      ),
    );
  }

  List<String> _generateTips(int incorrectReps) {
    // Generate tips based on the number of incorrect reps
    // Still needs to modify cause of different workouts
    return incorrectReps > 0
        ? ['Keep your back straight', 'Breathe properly', 'Maintain a steady pace']
        : ['Great job! Keep it up!'];
  }
}

class Rep {
  final DateTime dateTime;
  final bool isCorrect;

  Rep({required this.dateTime, required this.isCorrect});

  factory Rep.fromJson(Map<String, dynamic> json) {
    return Rep(
      dateTime: DateTime.parse(json['dateTime']),
      isCorrect: json['isCorrect'],
    );
  }
}

class ProgressGraph extends StatelessWidget {
  final List<Rep> reps;

  const ProgressGraph({super.key, required this.reps});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: reps.map((rep) => FlSpot(rep.dateTime.millisecondsSinceEpoch.toDouble(), rep.isCorrect ? 1 : 0)).toList(),
            isCurved: true,
            color: Colors.blue, // Updated parameter
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Text('${date.month}/${date.day}');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(value == 1 ? 'Correct' : 'Incorrect');
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TipsSection extends StatelessWidget {
  final List<String> tips;

  const TipsSection({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tips[index]),
          );
        },
      ),
    );
  }
}
