class PetModel {
  PetModel({
    required this.image,
    required this.name,
    required this.location,
    required this.isFavorited,
    required this.description,
    required this.rate,
    required this.id,
    required this.price,
    required this.ownerName,
    required this.sex,
    required this.age,
    required this.color,
  });

  final String? image;
  final String? name;
  final String? location;
  final bool? isFavorited;
  final String? description;
  final num? rate;
  final String? id;
  final String? price;
  final String? ownerName;
  final String? sex;
  final String? age;
  final String? color;

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      image: json["image"],
      name: json["name"],
      location: json["location"],
      isFavorited: json["is_favorited"],
      description: json["description"],
      rate: json["rate"],
      id: json["id"],
      price: json["price"],
      ownerName: json["owner_name"],
      sex: json["sex"],
      age: json["age"],
      color: json["color"],
    );
  }

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "location": location,
        "is_favorited": isFavorited,
        "description": description,
        "rate": rate,
        "id": id,
        "price": price,
        "owner_name": ownerName,
        "sex": sex,
        "age": age,
        "color": color,
      };
}
