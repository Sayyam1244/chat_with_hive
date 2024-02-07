import 'dart:convert';

class ProductAllResponse {
  bool? success;
  Body? body;
  dynamic error;

  ProductAllResponse({
    this.success,
    this.body,
    this.error,
  });

  ProductAllResponse copyWith({
    bool? success,
    Body? body,
    dynamic error,
  }) =>
      ProductAllResponse(
        success: success ?? this.success,
        body: body ?? this.body,
        error: error ?? this.error,
      );

  factory ProductAllResponse.fromRawJson(String str) =>
      ProductAllResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductAllResponse.fromJson(Map<String, dynamic> json) =>
      ProductAllResponse(
        success: json["Success"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "body": body?.toJson(),
        "error": error,
      };
}

class Body {
  List<Product>? products;
  int? totalPages;
  int? currentPage;
  int? pageSize;
  int? totalCount;

  Body({
    this.products,
    this.totalPages,
    this.currentPage,
    this.pageSize,
    this.totalCount,
  });

  Body copyWith({
    List<Product>? products,
    int? totalPages,
    int? currentPage,
    int? pageSize,
    int? totalCount,
  }) =>
      Body(
        products: products ?? this.products,
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
        totalCount: totalCount ?? this.totalCount,
      );

  factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalPages": totalPages,
        "currentPage": currentPage,
        "pageSize": pageSize,
        "totalCount": totalCount,
      };
}

class Product {
  Gallery? gallery;
  bool? isPaused;
  String? id;
  String? title;
  String? description;
  int? price;
  int? quantity;
  String? unit;
  int? minOrderQuantity;
  Category? category;
  Category? subCategory;
  Category? childSubCategory;
  List<dynamic>? features;
  Rating? rating;
  String? status;
  UserReff? userReff;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<String>? reviews;
  Location? location;

  Product({
    this.gallery,
    this.isPaused,
    this.id,
    this.title,
    this.description,
    this.price,
    this.quantity,
    this.unit,
    this.minOrderQuantity,
    this.category,
    this.subCategory,
    this.childSubCategory,
    this.features,
    this.rating,
    this.status,
    this.userReff,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reviews,
    this.location,
  });

  Product copyWith({
    Gallery? gallery,
    bool? isPaused,
    String? id,
    String? title,
    String? description,
    int? price,
    int? quantity,
    String? unit,
    int? minOrderQuantity,
    Category? category,
    Category? subCategory,
    Category? childSubCategory,
    List<String>? features,
    Rating? rating,
    String? status,
    UserReff? userReff,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    List<String>? reviews,
    Location? location,
  }) =>
      Product(
        gallery: gallery ?? this.gallery,
        isPaused: isPaused ?? this.isPaused,
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        minOrderQuantity: minOrderQuantity ?? this.minOrderQuantity,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        childSubCategory: childSubCategory ?? this.childSubCategory,
        features: features ?? this.features,
        rating: rating ?? this.rating,
        status: status ?? this.status,
        userReff: userReff ?? this.userReff,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        reviews: reviews ?? this.reviews,
        location: location ?? this.location,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        gallery:
            json["gallery"] == null ? null : Gallery.fromJson(json["gallery"]),
        isPaused: json["isPaused"],
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        unit: json["unit"],
        minOrderQuantity: json["minOrderQuantity"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        subCategory: json["subCategory"] == null
            ? null
            : Category.fromJson(json["subCategory"]),
        childSubCategory: json["childSubCategory"] == null
            ? null
            : Category.fromJson(json["childSubCategory"]),
        features: json["features"] ?? json["features"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        status: json["status"],
        userReff: json["userReff"] == null
            ? null
            : UserReff.fromJson(json["userReff"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        reviews: json["reviews"] == null
            ? []
            : List<String>.from(json["reviews"].map((x) => x)),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "gallery": gallery?.toJson(),
        "isPaused": isPaused,
        "_id": id,
        "title": title,
        "description": description,
        "price": price,
        "quantity": quantity,
        "unit": unit,
        "minOrderQuantity": minOrderQuantity,
        "category": category?.toJson(),
        "subCategory": subCategory?.toJson(),
        "childSubCategory": childSubCategory?.toJson(),
        "features": features,
        "rating": rating?.toJson(),
        "status": status,
        "userReff": userReff?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "location": location?.toJson(),
      };
}

class Category {
  String? id;
  String? title;
  String? background;
  String? icon; // Changed from enum to string
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<dynamic>? deepChildCategories;

  Category({
    this.id,
    this.title,
    this.background,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.deepChildCategories,
  });

  Category copyWith({
    String? id,
    String? title,
    String? background,
    String? icon,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    List<dynamic>? deepChildCategories,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        background: background ?? this.background,
        icon: icon ?? this.icon,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        deepChildCategories: deepChildCategories ?? this.deepChildCategories,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        background: json["background"],
        icon: json["icon"], // Changed from enum to string
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        deepChildCategories: json["deepChildCategories"] == null
            ? []
            : List<dynamic>.from(json["deepChildCategories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "background": background,
        "icon": icon, // Changed from enum to string
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "deepChildCategories": deepChildCategories == null
            ? []
            : List<dynamic>.from(deepChildCategories!.map((x) => x)),
      };
}

class Gallery {
  List<String>? images;
  List<String>? videos;

  Gallery({
    this.images,
    this.videos,
  });

  Gallery copyWith({
    List<String>? images,
    List<String>? videos,
  }) =>
      Gallery(
        images: images ?? this.images,
        videos: videos ?? this.videos,
      );

  factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        videos: json["videos"] == null
            ? []
            : List<String>.from(json["videos"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
      };
}

class Location {
  Address? address;
  Coordinates? coordinates;

  Location({
    this.address,
    this.coordinates,
  });

  Location copyWith({
    Address? address,
    Coordinates? coordinates,
  }) =>
      Location(
        address: address ?? this.address,
        coordinates: coordinates ?? this.coordinates,
      );

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "coordinates": coordinates?.toJson(),
      };
}

class Address {
  String? country;
  String? state;
  String? city;
  String? zipCode;
  String? addressLine;

  Address({
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.addressLine,
  });

  Address copyWith({
    String? country,
    String? state,
    String? city,
    String? zipCode,
    String? addressLine,
  }) =>
      Address(
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        addressLine: addressLine ?? this.addressLine,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zipCode"],
        addressLine: json["addressLine"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "zipCode": zipCode,
        "addressLine": addressLine,
      };
}

class Coordinates {
  double? long;
  double? lat;

  Coordinates({
    this.long,
    this.lat,
  });

  Coordinates copyWith({
    double? long,
    double? lat,
  }) =>
      Coordinates(
        long: long ?? this.long,
        lat: lat ?? this.lat,
      );

  factory Coordinates.fromRawJson(String str) =>
      Coordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "long": long,
        "lat": lat,
      };
}

class Rating {
  int? total;
  int? count;

  Rating({
    this.total,
    this.count,
  });

  Rating copyWith({
    int? total,
    int? count,
  }) =>
      Rating(
        total: total ?? this.total,
        count: count ?? this.count,
      );

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        total: json["total"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
      };
}

class UserReff {
  String? id;
  String? fullname;
  String? email;

  UserReff({
    this.id,
    this.fullname,
    this.email,
  });

  UserReff copyWith({
    String? id,
    String? fullname,
    String? email,
  }) =>
      UserReff(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
      );

  factory UserReff.fromRawJson(String str) =>
      UserReff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserReff.fromJson(Map<String, dynamic> json) => UserReff(
        id: json["_id"],
        fullname: json["fullname"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "email": email,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
