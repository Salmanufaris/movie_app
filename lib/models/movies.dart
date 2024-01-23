class Movies {
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overView;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  int? id;

  Movies(
      {required this.title,
      required this.backDropPath,
      required this.originalTitle,
      required this.overView,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.id});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'] ?? 'No Data',
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overView: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}

// "adult": false,
// "backdrop_path": "/feSiISwgEpVzR1v3zv2n2AU4ANJ.jpg",
// "id": 609681,
// "title": "The Marvels",
// "original_language": "en",
// "original_title": "The Marvels",
// "overview": "Carol Danvers, aka Captain Marvel, has reclaimed her identity from the tyrannical Kree and taken revenge on the Supreme Intelligence. But unintended consequences see Carol shouldering the burden of a destabilized universe. When her duties send her to an anomalous wormhole linked to a Kree revolutionary, her powers become entangled with that of Jersey City super-fan Kamala Khan, aka Ms. Marvel, and Carol’s estranged niece, now S.A.B.E.R. astronaut Captain Monica Rambeau. Together, this unlikely trio must team up and learn to work in concert to save the universe.",
// "poster_path": "/Ag3D9qXjhJ2FUkrlJ0Cv1pgxqYQ.jpg",
// "media_type": "movie",
// "genre_ids": [
// 878,
// 12,
// 28
// ],
// "popularity": 796.803,
// "release_date": "2023-11-08",
// "video": false,
// "vote_average": 6.367,
// "vote_count": 920