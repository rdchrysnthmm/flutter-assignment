class ResponseCategory {
  String method;
  bool status;
  List<Category> results;

  ResponseCategory({required this.method, required this.status, required this.results});

  factory ResponseCategory.fromJson(Map<String, dynamic> json) => ResponseCategory(
      method: json['method'],
      status: json['status'] == "true",
      results: List<Category>.from(json['results'].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };

}

class Category {
  String category;
  String url;
  String key;

  Category({required this.category, required this.url, required this.key});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      category: json['category'],
      url: json['url'],
      key: json['key']);

  Map<String, dynamic> toJson() => {
    'category': category,
    'url': url,
    'key':key,
  };
}
