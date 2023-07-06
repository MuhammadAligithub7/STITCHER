class Tailor {
  late String id, name, contact, email, city, country, lat, lang, image, status;

  Tailor(String id, String name, String contact,String email,String city, String country,
      String lat, String lang, String image, String status)
  {
     this.id = id;
     this.name = name;
     this.contact = contact;
     this.city = city;
     this.country = country;
     this.lat = lat;
     this.lang = lang;
     this.image = image;
     this.status = status;
     this.email = email;
  }
}