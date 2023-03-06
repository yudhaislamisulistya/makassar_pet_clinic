class CustomerModel {
  final int id;
  final int idUser;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String petType;
  final String petName;
  final String petAge;
  final String petGender;
  final String createdAt;

  CustomerModel({
    required this.id,
    required this.idUser,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.petType,
    required this.petName,
    required this.petAge,
    required this.petGender,
    required this.createdAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      idUser: json['id_user'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      petType: json['pet_type'],
      petName: json['pet_name'],
      petAge: json['pet_age'],
      petGender: json['pet_gender'],
      createdAt: json['created_at'],
    );
  }
}

class CustomerResponseModel {
  final List<CustomerModel> customers;

  CustomerResponseModel({required this.customers});

  factory CustomerResponseModel.fromJson(List<dynamic> json) {
    List<CustomerModel> customers = [];
    customers = json.map((customer) => CustomerModel.fromJson(customer)).toList();
    return CustomerResponseModel(customers: customers);
  }
}
