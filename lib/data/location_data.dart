import 'package:flutter/material.dart';

class Location{

  String name = "";
  String adress = "";
  String locationinfo = "";
  Image image;

  Location(this.name, this.adress, this.image);
  
  String getadress(){
    return adress;
  }
}

void main(){
  var toro = Location("Torö", "Nynäshamn", Image.asset("assets/images/toro_map.png"));
  var vaddo = Location("Väddö", "Norrtälje",  Image.asset("assets/images/vaddo_map.png"));
  
}