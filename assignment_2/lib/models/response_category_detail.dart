class ResponseCategoryDetail {
  String method;
  bool status;
  List<CategoryDetail> results;

  ResponseCategoryDetail({required this.method, required this.status, required this.results});

  factory ResponseCategoryDetail.fromJson(Map<String, dynamic> json) => ResponseCategoryDetail(
    method: json['method'],
    status: json['status'],
    results: List<CategoryDetail>.from(json['results'].map((x) => CategoryDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class CategoryDetail {
  String title;
  String thumb;
  String key;
  String times;
  String portion;
  String dificulty;

  CategoryDetail(
      {required this.title,
        required this.thumb,
        required this.key,
        required this.times,
        required this.portion,
        required this.dificulty});

  factory CategoryDetail.fromJson(Map<String, dynamic> json) =>CategoryDetail(
    title : json['title'],
    thumb : json['thumb'],
    key : json['key'],
    times : json['times'],
    portion : json['portion'],
    dificulty : json['dificulty'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'thumb': thumb,
    'key': key,
    'times':times,
    'portion':portion,
    'dificulty': dificulty,
  };
}
