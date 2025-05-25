import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
    int id;
    String title;
    String slug;
    int price;
    String description;
    Category category;
    List<String> images;
    DateTime creationAt;
    DateTime updatedAt;

    ProductList({
        required this.id,
        required this.title,
        required this.slug,
        required this.price,
        required this.description,
        required this.category,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
    });

    factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Category {
    int id;
    Name name;
    Slug slug;
    String image;
    DateTime creationAt;
    DateTime updatedAt;

    Category({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        slug: slugValues.map[json["slug"]]!,
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "slug": slugValues.reverse[slug],
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum Name {
    ELECTRONICS,
    FURNITURE,
    MISCELLANEOUS,
    SHOES,
    STRING,
    UPDATED_CATEGORY_NAME
}

final nameValues = EnumValues({
    "Electronics": Name.ELECTRONICS,
    "Furniture": Name.FURNITURE,
    "Miscellaneous": Name.MISCELLANEOUS,
    "Shoes": Name.SHOES,
    "string": Name.STRING,
    "Updated Category Name": Name.UPDATED_CATEGORY_NAME
});

enum Slug {
    ELECTRONICS,
    FURNITURE,
    MISCELLANEOUS,
    SHOES,
    STRING,
    UPDATED_CATEGORY_NAME
}

final slugValues = EnumValues({
    "electronics": Slug.ELECTRONICS,
    "furniture": Slug.FURNITURE,
    "miscellaneous": Slug.MISCELLANEOUS,
    "shoes": Slug.SHOES,
    "string": Slug.STRING,
    "updated-category-name": Slug.UPDATED_CATEGORY_NAME
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
