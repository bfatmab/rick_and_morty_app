class CharactersModel {
   CharacterInfos info;
  final List<CharacterModel> results;

  CharactersModel({
    required this.info,
    required this.results,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      info: CharacterInfos.fromJson(json['info']),
      results: (json['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList(),
    );
  }
}

class CharacterInfos {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterInfos({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
  CharacterInfos.fromJson(Map<String, dynamic> json)
    : count = json['count'],
      pages = json['pages'],
      next = json['next'],
      prev = json['prev'];
}

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String gender;
  final String image;
  final Location location;
  final Origin origin;
  final List<String> episode;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.image,
    required this.location,
    required this.episode,
    required this.origin,
  });

  CharacterModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      status = json['status'],
      gender = json['gender'],
      image = json['image'],
      location = Location.fromJson(json['location']),
      origin = Origin.fromJson(json['origin']),
      episode = List<String>.from(json['episode']);
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  Location.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      url = json['url'];
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});
  Origin.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      url = json['url'];
}
