import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MJ1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BluetoothAlarmScreen(),
    );
  }
}

class BluetoothAlarmScreen extends StatefulWidget {
  const BluetoothAlarmScreen({super.key});

  @override
  _BluetoothAlarmScreenState createState() => _BluetoothAlarmScreenState();
}

class _BluetoothAlarmScreenState extends State<BluetoothAlarmScreen> {
  List<ScanResult> scanResults = [];
  bool isScanning = false;
  BluetoothDevice? connectedDevice;
  List<DateTime> alarms = [];
  Timer? alarmTimer;
  BluetoothCharacteristic? writeCharacteristic;

  void startScan() async {
    setState(() {
      isScanning = true;
      scanResults = [];
    });

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });

    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isScanning = false;
    });
  }

  void stopScan() {
    FlutterBluePlus.stopScan();
    setState(() {
      isScanning = false;
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    setState(() {
      connectedDevice = device;
    });

    await device.connect();

    List<BluetoothService> services = await device.discoverServices();
    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.properties.write) {
          setState(() {
            writeCharacteristic = characteristic;
          });
          break;
        }
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Connected to ${device.name}')),
    );
  }

  void addAlarm(DateTime alarmTime) {
    setState(() {
      alarms.add(alarmTime);
      alarms.sort();
    });

    _startAlarmTimer();
  }

  void _startAlarmTimer() {
    alarmTimer?.cancel();
    alarmTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      for (var alarm in alarms) {
        if (now.hour == alarm.hour && now.minute == alarm.minute && now.second == 0) {
          _sendBluetoothSignal();
          break;
        }
      }
    });
  }

  void _sendBluetoothSignal() async {
    if (writeCharacteristic != null) {
      try {
        await writeCharacteristic!.write([1]); // Send the signal "1"
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Bluetooth Signal Sent'),
            content: const Text('신호를 전달했습니다.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('확인'),
              ),
            ],
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send signal: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No writable characteristic found')),
      );
    }
  }

  @override
  void dispose() {
    alarmTimer?.cancel();
    connectedDevice?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Alarm'),
      ),
      body: Column(
        children: [
          // Bluetooth Devices List
          Flexible(
            flex: 2, // Adjust the size of the Bluetooth devices list
            child: Column(
              children: [
                const Divider(),
                const Text('Bluetooth Devices', style: TextStyle(fontSize: 20)),
                Expanded(
                  child: ListView.builder(
                    itemCount: scanResults.length,
                    itemBuilder: (context, index) {
                      final result = scanResults[index];
                      return ListTile(
                        title: Text(result.device.name.isNotEmpty
                            ? result.device.name
                            : 'Unknown Device'),
                        subtitle: Text(result.device.id.toString()),
                        onTap: () => connectToDevice(result.device),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Alarm List
          Flexible(
            flex: 3, // Adjust the size of the alarm list
            child: Column(
              children: [
                const Text('알람 목록', style: TextStyle(fontSize: 20)),
                Expanded(
                  child: ListView.builder(
                    itemCount: alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = alarms[index];
                      return ListTile(
                        title: Text(
                          '${alarm.hour.toString().padLeft(2, '0')}:${alarm.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              alarms.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Buttons moved to the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Bluetooth Scan Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: isScanning ? stopScan : startScan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: connectedDevice != null ? Colors.green : Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      connectedDevice != null ? '연결됨' : (isScanning ? '스캔 중지' : '블루투스 스캔'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Add Alarm Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
                      );
                      if (selectedTime != null) {
                        addAlarm(DateTime(
                          now.year,
                          now.month,
                          now.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      '알람 추가',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
