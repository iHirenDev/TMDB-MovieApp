// ignore_for_file: unnecessary_this, unnecessary_getters_setters

class UpcomingMovies {
  Dates? _dates;
  int? _page;
  List<UpcomingMovieResult>? _results;
  int? _totalPages;
  int? _totalResults;

  UpcomingMovies(
      {Dates? dates,
      int? page,
      List<UpcomingMovieResult>? results,
      int? totalPages,
      int? totalResults}) {
    if (dates != null) {
      this._dates = dates;
    }
    if (page != null) {
      this._page = page;
    }
    if (results != null) {
      this._results = results;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalResults != null) {
      this._totalResults = totalResults;
    }
  }

  Dates? get dates => _dates;
  set dates(Dates? dates) => _dates = dates;
  int? get page => _page;
  set page(int? page) => _page = page;
  List<UpcomingMovieResult>? get results => _results;
  set results(List<UpcomingMovieResult>? results) => _results = results;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;

  UpcomingMovies.fromJson(Map<String, dynamic> json) {
    _dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    _page = json['page'];
    if (json['results'] != null) {
      _results = <UpcomingMovieResult>[];
      json['results'].forEach((v) {
        _results!.add(new UpcomingMovieResult.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this._dates != null) {
      data['dates'] = this._dates!.toJson();
    }
    data['page'] = this._page;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this._totalPages;
    data['total_results'] = this._totalResults;
    return data;
  }
}

class Dates {
  String? _maximum;
  String? _minimum;

  Dates({String? maximum, String? minimum}) {
    if (maximum != null) {
      this._maximum = maximum;
    }
    if (minimum != null) {
      this._minimum = minimum;
    }
  }

  String? get maximum => _maximum;
  set maximum(String? maximum) => _maximum = maximum;
  String? get minimum => _minimum;
  set minimum(String? minimum) => _minimum = minimum;

  Dates.fromJson(Map<String, dynamic> json) {
    _maximum = json['maximum'];
    _minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = this._maximum;
    data['minimum'] = this._minimum;
    return data;
  }
}

class UpcomingMovieResult {
  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  Results(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (backdropPath != null) {
      this._backdropPath = backdropPath;
    }
    if (genreIds != null) {
      this._genreIds = genreIds;
    }
    if (id != null) {
      this._id = id;
    }
    if (originalLanguage != null) {
      this._originalLanguage = originalLanguage;
    }
    if (originalTitle != null) {
      this._originalTitle = originalTitle;
    }
    if (overview != null) {
      this._overview = overview;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (posterPath != null) {
      this._posterPath = posterPath;
    }
    if (releaseDate != null) {
      this._releaseDate = releaseDate;
    }
    if (title != null) {
      this._title = title;
    }
    if (video != null) {
      this._video = video;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  String? get backdropPath => _backdropPath;
  set backdropPath(String? backdropPath) => _backdropPath = backdropPath;
  List<int>? get genreIds => _genreIds;
  set genreIds(List<int>? genreIds) => _genreIds = genreIds;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get originalLanguage => _originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _originalLanguage = originalLanguage;
  String? get originalTitle => _originalTitle;
  set originalTitle(String? originalTitle) => _originalTitle = originalTitle;
  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get posterPath => _posterPath;
  set posterPath(String? posterPath) => _posterPath = posterPath;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  String? get title => _title;
  set title(String? title) => _title = title;
  bool? get video => _video;
  set video(bool? video) => _video = video;
  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;

  UpcomingMovieResult.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    data['genre_ids'] = this._genreIds;
    data['id'] = this._id;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['popularity'] = this._popularity;
    data['poster_path'] = this._posterPath;
    data['release_date'] = this._releaseDate;
    data['title'] = this._title;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    return data;
  }
}
