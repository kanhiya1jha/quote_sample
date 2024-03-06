
class QuoteModel {
  String? id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;
  String? error;

  QuoteModel(
      {this.id,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

  QuoteModel.withError(String errorMessage) {
    error = errorMessage;
  }
}
