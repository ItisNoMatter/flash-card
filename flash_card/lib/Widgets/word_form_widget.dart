import 'package:flutter/material.dart';

class WordFormWidget extends StatelessWidget {
  final ValueChanged<String> onChangedHeads;
  final ValueChanged<String> onChangedTails;
  final String? heads;
  final String? tails;
  //final ValueChanged<String> onChangedTails;
  const WordFormWidget({
      this.heads = '',
      this.tails = '',
      required this.onChangedHeads,
      required this.onChangedTails,


    //required this.onChangedTails
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Card(
        child: Column(
          children: [
            Text('表の単語 $heads'),
            buildHeads(),
            Text('裏の単語 $tails'),
            buildTails(),
          ],
        ),
      ),
    );
  }
  Widget buildHeads() => TextFormField(
    maxLines: 1,
    initialValue: '',
    onChanged: onChangedHeads,
  );
  Widget buildTails() => TextFormField(
    maxLines: 1,
    initialValue: '',
    onChanged: onChangedTails,
  );


}
