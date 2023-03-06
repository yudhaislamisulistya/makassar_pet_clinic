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
}

class BookingResponseModel {
  final List<BookingModel> bookings;

  BookingResponseModel({required this.bookings});

  factory BookingResponseModel.fromJson(List<dynamic> json, List<DoctorModel> doctors) {
    List<BookingModel> bookings = [];
    bookings = json.map((booking) => BookingModel.fromJson(booking)).toList();
    for (BookingModel booking in bookings) {
      DoctorModel expert = doctors.firstWhere((doc) => doc.id == booking.idExpert);
      booking.setExperts(expert);
    }
    return BookingResponseModel(bookings: bookings);
  }
}
