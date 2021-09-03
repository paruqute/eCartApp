class CartModel {
  CartModel({
    this.name,
    this.id,
    this.sku,
    this.image,
    this.price,
    this.specialPrice,
    this.quantity,
    this.rating,
    this.storage,
    this.productTag,
    this.preorder,
  });

  String name;
  String id;
  String sku;
  String image;
  double price;
  int specialPrice;
  int quantity;
  String rating;
  String storage;
  String productTag;
  String preorder;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    name: json["name"],
    id: json["id"],
    sku: json["sku"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"].toDouble(),
    specialPrice:
    json["special_price"] == null ? null : json["special_price"],
    rating: json["rating"] == null ? null : json["rating"],
    storage: json["storage"].toString(),
    productTag: json["product_tag"] == null ? null : json["product_tag"],
    preorder: json["preorder"] == null ? null : json["preorder"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "sku": sku,
    "image": image == null ? null : image,
    "price": price,
    "special_price": specialPrice == null ? null : specialPrice,
    "rating": rating == null ? null : rating,
    "storage": storage,
    "product_tag": productTag == null ? null : productTag,
    "preorder": preorder == null ? null : preorder,
  };
}
