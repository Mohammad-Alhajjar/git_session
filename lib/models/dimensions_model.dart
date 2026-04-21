import 'dart:convert';

class DimensionsModel {
    final double? width;
    final double? height;
    final double? depth;

    DimensionsModel({
        this.width,
        this.height,
        this.depth,
    });

    DimensionsModel copyWith({
        double? width,
        double? height,
        double? depth,
    }) => 
        DimensionsModel(
            width: width ?? this.width,
            height: height ?? this.height,
            depth: depth ?? this.depth,
        );

    factory DimensionsModel.fromJson(String str) => DimensionsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DimensionsModel.fromMap(Map<String, dynamic> json) => DimensionsModel(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "depth": depth,
    };
}
