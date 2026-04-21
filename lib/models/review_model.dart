
import 'dart:convert';

class ReviewModel {
    final int? rating;
    final String? comment;
    final String? date;
    final String? reviewerName;
    final String? reviewerEmail;

    ReviewModel({
        this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail,
    });

    ReviewModel copyWith({
        int? rating,
        String? comment,
        String? date,
        String? reviewerName,
        String? reviewerEmail,
    }) => 
        ReviewModel(
            rating: rating ?? this.rating,
            comment: comment ?? this.comment,
            date: date ?? this.date,
            reviewerName: reviewerName ?? this.reviewerName,
            reviewerEmail: reviewerEmail ?? this.reviewerEmail,
        );

    factory ReviewModel.fromJson(String str) => ReviewModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ReviewModel.fromMap(Map<String, dynamic> json) => ReviewModel(
        rating: json["rating"],
        comment: json["comment"],
        date: json["date"],
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
    );

    Map<String, dynamic> toMap() => {
        "rating": rating,
        "comment": comment,
        "date": date,
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
    };
}
