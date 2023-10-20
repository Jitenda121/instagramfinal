import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/example_two.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  //double value = 1.0;
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ExampleTwoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscribe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleTwoProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  //print(val);
                  value.setValue(val);
                  // value = provider.value;
                  //value = provider.value;
                  //print(val);
                  // setState(() {});
                });
          }),
          Consumer<ExampleTwoProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)),
                  child: Center(
                    child: Text("Container 1"),
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(value.value)),
                  child: Center(
                    child: Text("Container 1"),
                  ),
                ))
              ],
            );
          })
        ],
      ),
    );
  }
}
