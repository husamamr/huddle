class HomeScreenModel{
  String? name;
  String? placeId;
  bool? openingHours;
  double? rating;
  double? priceLevel;
  String? icon;

  HomeScreenModel({this.name , this.placeId, this.openingHours, this.rating, this.priceLevel, this.icon});

  HomeScreenModel.fromJson(Map<String,dynamic> json){
  name = json['Name'].toString();
  placeId = json['PlaceId'];



  if(json['OpeningHours']!= null) {
    openingHours = json['OpeningHours']['OpenNow'];
  // could change this to json['opening_hours']['open_now']
  } else{
    openingHours = false;
  }
  rating = json['Rating'];
  priceLevel = json['PriceLevel'];

  if(json['Photos'] !=  null) {
      String ref = json['Photos'][0]['PhotoReference'];
      icon = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference= $ref&key=AIzaSyDCZ1dUovZcLYLZvrGIQc7XBCG8ZKxxSK4";
    } else {
      icon = json['IconUrl'];
    }
  }




  Map<String , dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['name'] = this.name;
    data['opening_hours'] = this.openingHours;
    data['rating'] = this.rating;
    data['price_level'] = this.priceLevel;
    data['icon'] = this.icon;
    return data;
  }
}