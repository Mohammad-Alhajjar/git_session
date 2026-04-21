import 'dart:convert';

class MetaModel {
    final String? createdAt;
    final String? updatedAt;
    final String? barcode;
    final String? qrCode;

    MetaModel({
        this.createdAt,
        this.updatedAt,
        this.barcode,
        this.qrCode,
    });

    MetaModel copyWith({
        String? createdAt,
        String? updatedAt,
        String? barcode,
        String? qrCode,
    }) => 
        MetaModel(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            barcode: barcode ?? this.barcode,
            qrCode: qrCode ?? this.qrCode,
        );

    factory MetaModel.fromJson(String str) => MetaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MetaModel.fromMap(Map<String, dynamic> json) => MetaModel(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        barcode: json["barcode"],
        qrCode: json["qrCode"],
    );

    Map<String, dynamic> toMap() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "barcode": barcode,
        "qrCode": qrCode,
    };
}