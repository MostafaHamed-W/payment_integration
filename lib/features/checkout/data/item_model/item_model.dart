import 'item.dart';
import 'shipping_address.dart';

class ItemModel {
  List<Item>? items;
  ShippingAddress? shippingAddress;

  ItemModel({required this.items, this.shippingAddress});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        shippingAddress: json['shipping_address'] == null
            ? null
            : ShippingAddress.fromJson(json['shipping_address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'shipping_address': shippingAddress?.toJson(),
      };
}
