final String tableWords = 'words';
class Word {
  final int? id;
  final String heads;
  final String tails;
  const Word({
    this.id,
    required this.heads,
    required this.tails
  });

  Map <String,Object?> toJson() => {
    WordFields.id: id,
    WordFields.heads: heads,
    WordFields.tails: tails
  };

  static Word fromJson(Map<String,Object?> json) =>Word(
    id: json[WordFields.id] as int,
    heads:  json[WordFields.heads] as String,
    tails: json[WordFields.tails] as String,
  );
}

class WordFields {
  static final List<String> varues = [
    id,heads,tails
  ];
  static final String id = '_id';
  static final String heads = 'heads';
  static final String tails = 'tails';
}