import 'package:flutter/material.dart';

class TaggedView extends StatefulWidget {
  const TaggedView({super.key});

  @override
  State<TaggedView> createState() => _TaggedViewState();
}

class _TaggedViewState extends State<TaggedView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tagged Tab"),
    );
  }
}
