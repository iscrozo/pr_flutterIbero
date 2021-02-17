class NewsApiModel {
  String status;
  int totalResults;
  List<News> articlesList;
  NewsApiModel(this.status, this.totalResults, this.articlesList);

  NewsApiModel.fromjson(Map<String, dynamic>map){
    var mapArticles = map['articles'] as List;

    status = map['status'];
    totalResults = map['totalResults'];
    articlesList = mapArticles.map((json) => News.fromjson(json)).toList();
  }
}

class News {
  Source source;
  String urlToImage;
  String title;
  String url;
  String author;
  String publishedAt;
  String content;
  String description;

  News({
    this.source,
    this.urlToImage,
    this.title,
    this.url,
    this.author,
    this.publishedAt,
    this.content,
    this.description
  });

  News.fromjson(Map<String, dynamic>map){
    source = Source.fromjson(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
    content = map['content'];
  }
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  Source.fromjson(Map<String, dynamic>map){
    id = map['id'];
    name = map['name'];
  }

}
