/// 搜索模型
class SearchModel {
  final List<SearchItem> data;
  String keyword;

  SearchModel({this.data, this.keyword});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<SearchItem> data = dataJson.map((i)=>SearchItem.fromJson(i)).toList();
    return SearchModel(data: data);
  }

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SearchItem {
  final String word;
  final String type;
  final String price;
  final String star;
  final String zonename;
  final String districtname;
  final String url;

  SearchItem(
      {this.word,
      this.type,
      this.price,
      this.star,
      this.zonename,
      this.districtname,
      this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      word: json["word"],
      type: json["type"],
      price: json["price"],
      star: json["star"],
      zonename: json["zonename"],
      districtname: json["districtname"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "word": word,
        "type": type,
        "price": price,
        "star": star,
        "zonename": zonename,
        "districtname": districtname,
        "url": url,
      };
}
