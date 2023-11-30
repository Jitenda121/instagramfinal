import 'package:flutter/material.dart';

class TaggedView1 extends StatefulWidget {
  const TaggedView1({super.key});

  @override
  State<TaggedView1> createState() => _TaggedViewState();
}

class _TaggedViewState extends State<TaggedView1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tagged Tab"),
    );
  }
}
