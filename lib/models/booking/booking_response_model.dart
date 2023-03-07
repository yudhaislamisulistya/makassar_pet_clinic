import 'package:makassar_pet_clinic/models/customer/customer_response_model.dart';
import 'package:makassar_pet_clinic/models/doctor/doctor_response_model.dart';

class BookingModel {
  final int id;
  final int idUser;
  final int idExpert;
  final String status;
  final String description;
  final String dateBook;
  final String createdAt;
  DoctorModel? experts;
  CustomerModel? customers;

  BookingModel({
    required this.id,
    required this.idUser,
    required this.idExpert,
    required this.status,
    required this.description,
    required this.dateBook,
    required this.createdAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as int,
      idUser: json['id_user'] as int,
      idExpert: json['id_expert'] as int,
      status: json['status'] as String,
      description: json['description'] as String,
      dateBook: json['date_book'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  void setExperts(DoctorModel? experts) {
    this.experts = experts;
  }

  void setCustomers(CustomerModel? customers) {
    this.customers = customers;
  }
}

class BookingResponseModel {
  final List<BookingModel> bookings;

  BookingResponseModel({required this.bookings});

  factory BookingResponseModel.fromJson(List<dynamic> json, List<DoctorModel> doctors, List<CustomerModel> customers) {
    List<BookingModel> bookings = [];
    bookings = json.map((booking) => BookingModel.fromJson(booking)).toList();
    for (BookingModel booking in bookings) {
      DoctorModel expert = doctors.firstWhere((doc) => doc.id == booking.idExpert);
      CustomerModel customer = customers.firstWhere((cus) => cus.id == booking.idUser);
      booking.setExperts(expert);
      booking.setCustomers(customer);
    }
    return BookingResponseModel(bookings: bookings);
  }
}
