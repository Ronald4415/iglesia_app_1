// ignore: camel_case_types
class personajes {
  final int id;
  final String name;
  final String image;
  final String description;

  const personajes({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory personajes.fromJson(Map<String, dynamic> json) => personajes(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
      };
  personajes copy() =>
      personajes(id: id, name: name, image: image, description: description);
}
