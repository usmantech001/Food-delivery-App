class AddressModel{
  String? id;
  String? addressType;
  String? address;
  String? contactPersonName;
  String? contactPersonNumber;
  String? latitude;
  String? longitude;

  AddressModel({
    this.address,
    this.addressType,
    this.contactPersonName,
    this.contactPersonNumber,
    this.id,
    this.latitude,
    this.longitude,
  });

  AddressModel.fromJson(Map<String, dynamic> json){
    address=json['address'];
    id=json['id'];
    addressType=json['address_type'];
    contactPersonName=json['contact_person_name'];
    contactPersonNumber=json['contact_person_number'];
    latitude=json['latitude'];
    longitude=json['longitude'];
  }

   Map<String, dynamic> toJson(){
    return{
     'address':address,
     'address_type':addressType,
     'contact_person_name':contactPersonName,
     'contact_person_number':contactPersonNumber,
     'longitude': longitude,
     'latitude':latitude,
     'id':id
    };
  }
}