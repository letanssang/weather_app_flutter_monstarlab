import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(color: Colors.black),
          title: const Text(
            'Setting',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Unit'),
              buildUnitListTile(
                'Temperature',
                ['\u00b0C', '\u00b0F'],
              ),
              buildUnitListTile(
                'Wind Speed',
                ['m/s', 'km/h', 'mph'],
              ),
              buildUnitListTile(
                'Pressure',
                ['hPa', 'inHg', 'mmHg'],
              ),
            ],
          ),
        ));
  }

  ListTile buildUnitListTile(
    String title,
    List<String> values,
  ) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
      trailing: DropdownButton<String>(
        value: values[0],
        borderRadius: BorderRadius.circular(10),
        onChanged: (String? newValue) {},
        items: values.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                )),
          );
        }).toList(),
      ),
    );
  }
}
