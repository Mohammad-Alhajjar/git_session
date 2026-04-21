import 'dart:convert';

class ProfileModel {
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? maidenName;
    final int? age;
    final String? gender;
    final String? email;
    final String? phone;
    final String? username;
    final String? password;
    final String? birthDate;
    final String? image;
    final String? bloodGroup;
    final double? height;
    final double? weight;
    final String? eyeColor;
    final Hair? hair;
    final String? ip;
    final Address? address;
    final String? macAddress;
    final String? university;
    final Bank? bank;
    final Company? company;
    final String? ein;
    final String? ssn;
    final String? userAgent;
    final Crypto? crypto;
    final String? role;

    ProfileModel({
        this.id,
        this.firstName,
        this.lastName,
        this.maidenName,
        this.age,
        this.gender,
        this.email,
        this.phone,
        this.username,
        this.password,
        this.birthDate,
        this.image,
        this.bloodGroup,
        this.height,
        this.weight,
        this.eyeColor,
        this.hair,
        this.ip,
        this.address,
        this.macAddress,
        this.university,
        this.bank,
        this.company,
        this.ein,
        this.ssn,
        this.userAgent,
        this.crypto,
        this.role,
    });

    ProfileModel copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? maidenName,
        int? age,
        String? gender,
        String? email,
        String? phone,
        String? username,
        String? password,
        String? birthDate,
        String? image,
        String? bloodGroup,
        double? height,
        double? weight,
        String? eyeColor,
        Hair? hair,
        String? ip,
        Address? address,
        String? macAddress,
        String? university,
        Bank? bank,
        Company? company,
        String? ein,
        String? ssn,
        String? userAgent,
        Crypto? crypto,
        String? role,
    }) => 
        ProfileModel(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            maidenName: maidenName ?? this.maidenName,
            age: age ?? this.age,
            gender: gender ?? this.gender,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            username: username ?? this.username,
            password: password ?? this.password,
            birthDate: birthDate ?? this.birthDate,
            image: image ?? this.image,
            bloodGroup: bloodGroup ?? this.bloodGroup,
            height: height ?? this.height,
            weight: weight ?? this.weight,
            eyeColor: eyeColor ?? this.eyeColor,
            hair: hair ?? this.hair,
            ip: ip ?? this.ip,
            address: address ?? this.address,
            macAddress: macAddress ?? this.macAddress,
            university: university ?? this.university,
            bank: bank ?? this.bank,
            company: company ?? this.company,
            ein: ein ?? this.ein,
            ssn: ssn ?? this.ssn,
            userAgent: userAgent ?? this.userAgent,
            crypto: crypto ?? this.crypto,
            role: role ?? this.role,
        );

    factory ProfileModel.fromJson(String str) => ProfileModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: json["birthDate"],
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        eyeColor: json["eyeColor"],
        hair: json["hair"] == null ? null : Hair.fromMap(json["hair"]),
        ip: json["ip"],
        address: json["address"] == null ? null : Address.fromMap(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: json["bank"] == null ? null : Bank.fromMap(json["bank"]),
        company: json["company"] == null ? null : Company.fromMap(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
        crypto: json["crypto"] == null ? null : Crypto.fromMap(json["crypto"]),
        role: json["role"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": birthDate,
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair?.toMap(),
        "ip": ip,
        "address": address?.toMap(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank?.toMap(),
        "company": company?.toMap(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
        "crypto": crypto?.toMap(),
        "role": role,
    };
}

class Address {
    final String? address;
    final String? city;
    final String? state;
    final String? stateCode;
    final String? postalCode;
    final Coordinates? coordinates;
    final String? country;

    Address({
        this.address,
        this.city,
        this.state,
        this.stateCode,
        this.postalCode,
        this.coordinates,
        this.country,
    });

    Address copyWith({
        String? address,
        String? city,
        String? state,
        String? stateCode,
        String? postalCode,
        Coordinates? coordinates,
        String? country,
    }) => 
        Address(
            address: address ?? this.address,
            city: city ?? this.city,
            state: state ?? this.state,
            stateCode: stateCode ?? this.stateCode,
            postalCode: postalCode ?? this.postalCode,
            coordinates: coordinates ?? this.coordinates,
            country: country ?? this.country,
        );

    factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Address.fromMap(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        stateCode: json["stateCode"],
        postalCode: json["postalCode"],
        coordinates: json["coordinates"] == null ? null : Coordinates.fromMap(json["coordinates"]),
        country: json["country"],
    );

    Map<String, dynamic> toMap() => {
        "address": address,
        "city": city,
        "state": state,
        "stateCode": stateCode,
        "postalCode": postalCode,
        "coordinates": coordinates?.toMap(),
        "country": country,
    };
}

class Coordinates {
    final double? lat;
    final double? lng;

    Coordinates({
        this.lat,
        this.lng,
    });

    Coordinates copyWith({
        double? lat,
        double? lng,
    }) => 
        Coordinates(
            lat: lat ?? this.lat,
            lng: lng ?? this.lng,
        );

    factory Coordinates.fromJson(String str) => Coordinates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
    };
}

class Bank {
    final String? cardExpire;
    final String? cardNumber;
    final String? cardType;
    final String? currency;
    final String? iban;

    Bank({
        this.cardExpire,
        this.cardNumber,
        this.cardType,
        this.currency,
        this.iban,
    });

    Bank copyWith({
        String? cardExpire,
        String? cardNumber,
        String? cardType,
        String? currency,
        String? iban,
    }) => 
        Bank(
            cardExpire: cardExpire ?? this.cardExpire,
            cardNumber: cardNumber ?? this.cardNumber,
            cardType: cardType ?? this.cardType,
            currency: currency ?? this.currency,
            iban: iban ?? this.iban,
        );

    factory Bank.fromJson(String str) => Bank.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Bank.fromMap(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
    );

    Map<String, dynamic> toMap() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
    };
}

class Company {
    final String? department;
    final String? name;
    final String? title;
    final Address? address;

    Company({
        this.department,
        this.name,
        this.title,
        this.address,
    });

    Company copyWith({
        String? department,
        String? name,
        String? title,
        Address? address,
    }) => 
        Company(
            department: department ?? this.department,
            name: name ?? this.name,
            title: title ?? this.title,
            address: address ?? this.address,
        );

    factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: json["address"] == null ? null : Address.fromMap(json["address"]),
    );

    Map<String, dynamic> toMap() => {
        "department": department,
        "name": name,
        "title": title,
        "address": address?.toMap(),
    };
}

class Crypto {
    final String? coin;
    final String? wallet;
    final String? network;

    Crypto({
        this.coin,
        this.wallet,
        this.network,
    });

    Crypto copyWith({
        String? coin,
        String? wallet,
        String? network,
    }) => 
        Crypto(
            coin: coin ?? this.coin,
            wallet: wallet ?? this.wallet,
            network: network ?? this.network,
        );

    factory Crypto.fromJson(String str) => Crypto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Crypto.fromMap(Map<String, dynamic> json) => Crypto(
        coin: json["coin"],
        wallet: json["wallet"],
        network: json["network"],
    );

    Map<String, dynamic> toMap() => {
        "coin": coin,
        "wallet": wallet,
        "network": network,
    };
}

class Hair {
    final String? color;
    final String? type;

    Hair({
        this.color,
        this.type,
    });

    Hair copyWith({
        String? color,
        String? type,
    }) => 
        Hair(
            color: color ?? this.color,
            type: type ?? this.type,
        );

    factory Hair.fromJson(String str) => Hair.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hair.fromMap(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "color": color,
        "type": type,
    };
}
