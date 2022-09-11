class MovieReviews {
  MovieReviews({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int id;
  late final int page;
  late final List<Reviews> results;
  late final int totalPages;
  late final int totalResults;

  MovieReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    page = json['page'];
    results =
        List.from(json['results']).map((e) => Reviews.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['page'] = page;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Reviews {
  Reviews({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });
  late final String author;
  late final AuthorDetails authorDetails;
  late final String content;
  late final String createdAt;
  late final String id;
  late final String updatedAt;
  late final String url;

  Reviews.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    authorDetails = AuthorDetails.fromJson(json['author_details']);
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['author'] = author;
    _data['author_details'] = authorDetails.toJson();
    _data['content'] = content;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['url'] = url;
    return _data;
  }
}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });
  late final String name;
  late final String username;
  late final String? avatarPath;
  late final int? rating;

  AuthorDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    avatarPath = null;
    rating = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['username'] = username;
    _data['avatar_path'] = avatarPath;
    _data['rating'] = rating;
    return _data;
  }
}
