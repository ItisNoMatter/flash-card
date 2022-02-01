import 'package:flutter/material.dart';
import 'package:flash_card/db/words_database.dart';
import 'package:flash_card/model/word.dart';
import 'package:flash_card/Widgets/word_form_widget.dart';

class AddWordPage extends StatefulWidget {
  @override
  _AddWordPageState createState() => _AddWordPageState();
}

class _AddWordPageState extends State<AddWordPage> {
  late String heads;
  late String tails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.heads = '';
    this.tails = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('単語追加ページ'),
        ),
        body: Center(
          child: Column(
            children: [
              WordFormWidget(
                heads: heads,
                tails: tails,
                onChangedHeads: (heads) => setState(() => this.heads = heads),
                onChangedTails: (tails) => setState(() => this.tails = tails),
              ),
              saveButton(),
            ],
          ),
        ));
  }

  Widget saveButton() => OutlinedButton(
      onPressed: () async {
        final word = Word(heads:heads,tails:tails);
        await WordsDatabase.instance.create(word);
        Navigator.of(context).pop();
      },
      child: Text('保存'));
}
