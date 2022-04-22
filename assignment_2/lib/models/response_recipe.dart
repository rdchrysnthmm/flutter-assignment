class ResponseRecipe {
  ResponseRecipe({
    required this.method,
    required this.status,
    required this.results,
  });
  late final String method;
  late final bool status;
  late final Results results;

  ResponseRecipe.fromJson(Map<String, dynamic> json){
    method = json['method'];
    status = json['status'];
    results = Results.fromJson(json['results']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['method'] = method;
    _data['status'] = status;
    _data['results'] = results.toJson();
    return _data;
  }
}

class Results {
  Results({
    required this.title,
    required this.thumb,
    required this.servings,
    required this.times,
    required this.dificulty,
    required this.author,
    required this.desc,
    required this.needItem,
    required this.ingredient,
    required this.step,
  });
  late final String title;
  late final String thumb;
  late final String servings;
  late final String times;
  late final String dificulty;
  late final Author author;
  late final String desc;
  late final List<NeedItem> needItem;
  late final List<String> ingredient;
  late final List<String> step;

  Results.fromJson(Map<String, dynamic> json){
    title = json['title'];
    thumb = json['thumb'];
    servings = json['servings'];
    times = json['times'];
    dificulty = json['dificulty'];
    author = Author.fromJson(json['author']);
    desc = json['desc'];
    needItem = List.from(json['needItem']).map((e)=>NeedItem.fromJson(e)).toList();
    ingredient = List.castFrom<dynamic, String>(json['ingredient']);
    step = List.castFrom<dynamic, String>(json['step']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['thumb'] = thumb;
    _data['servings'] = servings;
    _data['times'] = times;
    _data['dificulty'] = dificulty;
    _data['author'] = author.toJson();
    _data['desc'] = desc;
    _data['needItem'] = needItem.map((e)=>e.toJson()).toList();
    _data['ingredient'] = ingredient;
    _data['step'] = step;
    return _data;
  }
}

class Author {
  Author({
    required this.user,
    required this.datePublished,
  });
  late final String user;
  late final String datePublished;

  Author.fromJson(Map<String, dynamic> json){
    user = json['user'];
    datePublished = json['datePublished'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['datePublished'] = datePublished;
    return _data;
  }
}

class NeedItem {
  NeedItem({
    required this.itemName,
    required this.thumbItem,
  });
  late final String itemName;
  late final String thumbItem;

  NeedItem.fromJson(Map<String, dynamic> json){
    itemName = json['item_name'];
    thumbItem = json['thumb_item'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item_name'] = itemName;
    _data['thumb_item'] = thumbItem;
    return _data;
  }
}