/// getActiveCountries : [{"_id":"6043da73e5e71f0015b5c5cc","callingCode":"61","name":"Australia","currencyCode":"AUD","flag":"https://restcountries.eu/data/aus.svg","hasRate":true,"alpha2Code":"AU","alpha3Code":"AUS","region":"Oceania","currencyDetails":{"code":"AUD","name":"Australian dollar","symbol":"$"}}]

class CountryModel {
  List<GetActiveCountries> getActiveCountries;

  CountryModel({this.getActiveCountries});

  CountryModel.fromJson(dynamic json) {
    if (json["getActiveCountries"] != null) {
      getActiveCountries = [];
      json["getActiveCountries"].forEach((v) {
        getActiveCountries.add(GetActiveCountries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (getActiveCountries != null) {
      map["getActiveCountries"] =
          getActiveCountries.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "6043da73e5e71f0015b5c5cc"
/// callingCode : "61"
/// name : "Australia"
/// currencyCode : "AUD"
/// flag : "https://restcountries.eu/data/aus.svg"
/// hasRate : true
/// alpha2Code : "AU"
/// alpha3Code : "AUS"
/// region : "Oceania"
/// currencyDetails : {"code":"AUD","name":"Australian dollar","symbol":"$"}

class GetActiveCountries {
  String id;
  String callingCode;
  String name;
  String currencyCode;
  String flag;
  bool hasRate;
  String alpha2Code;
  String alpha3Code;
  String region;
  CurrencyDetails currencyDetails;

  GetActiveCountries(
      {this.id,
      this.callingCode,
      this.name,
      this.currencyCode,
      this.flag,
      this.hasRate,
      this.alpha2Code,
      this.alpha3Code,
      this.region,
      this.currencyDetails});

  GetActiveCountries.fromJson(dynamic json) {
    id = json["_id"];
    callingCode = json["callingCode"];
    name = json["name"];
    currencyCode = json["currencyCode"];
    flag = json["flag"];
    hasRate = json["hasRate"];
    alpha2Code = json["alpha2Code"];
    alpha3Code = json["alpha3Code"];
    region = json["region"];
    currencyDetails = json["currencyDetails"] != null
        ? CurrencyDetails.fromJson(json["currencyDetails"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["callingCode"] = callingCode;
    map["name"] = name;
    map["currencyCode"] = currencyCode;
    map["flag"] = flag;
    map["hasRate"] = hasRate;
    map["alpha2Code"] = alpha2Code;
    map["alpha3Code"] = alpha3Code;
    map["region"] = region;
    if (currencyDetails != null) {
      map["currencyDetails"] = currencyDetails.toJson();
    }
    return map;
  }
}

/// code : "AUD"
/// name : "Australian dollar"
/// symbol : "$"

class CurrencyDetails {
  String code;
  String name;
  String symbol;

  CurrencyDetails({this.code, this.name, this.symbol});

  CurrencyDetails.fromJson(dynamic json) {
    code = json["code"];
    name = json["name"];
    symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["name"] = name;
    map["symbol"] = symbol;
    return map;
  }
}
