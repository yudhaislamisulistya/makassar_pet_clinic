import 'package:get/get.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/models/booking/booking_request_model.dart';
import 'package:makassar_pet_clinic/models/booking/booking_response_model.dart';
import 'package:makassar_pet_clinic/models/customer/customer_response_model.dart';
import 'package:makassar_pet_clinic/models/doctor/doctor_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingService extends GetConnect {
  final supabase = Supabase.instance.client;
  late final LoginManager loginManager = Get.find<LoginManager>();

  Future<bool> addBooking(BookingRequestModel model) async {
    try {
      await supabase.from('bookings').insert({
        'id_user': model.idUser,
        'id_expert': model.idExpert,
        'status': model.status,
        'description': model.description,
        'date_book': model.dateBook,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateBooking(BookingRequestModel model) async {
    try {
      await supabase.from('bookings').update({
        'status': model.status,
        'description': model.description,
      }).eq('id', model.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<BookingResponseModel?> getBookingRelatedToExpertByIdUser(int idUser, String? chat) async {
    var response;
    if (chat == "Chat") {
      if (loginManager.role.value == "3") {
        response = await supabase.from('bookings').select('*, experts!inner(*), customers!inner(*)').eq('id_user', idUser).eq('status', '2').order('created_at', ascending: false);
      } else if (loginManager.role.value == "2") {
        response = await supabase.from('bookings').select('*, experts!inner(*), customers!inner(*)').eq('id_expert', idUser).eq('status', '2').order('created_at', ascending: false);
      }
    } else {
      if (loginManager.role.value == "3") {
        response = await supabase.from('bookings').select('*, experts!inner(*), customers!inner(*)').eq('id_user', idUser).order('created_at', ascending: false);
      } else if (loginManager.role.value == "2") {
        response = await supabase.from('bookings').select('*, experts!inner(*), customers!inner(*)').eq('id_expert', idUser).order('created_at', ascending: false);
      }
    }
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(response as List);

    List<dynamic> bookings = [];
    List<DoctorModel> experts = [];
    List<CustomerModel> customers = [];

    data.forEach((item) {
      bookings.add({'id': item['id'], 'id_user': item['id_user'], 'id_expert': item['id_expert'], 'status': item['status'], 'description': item['description'], 'date_book': item['date_book'], 'created_at': item['created_at']});
      experts.add(DoctorModel.fromJson(item['experts']));
      customers.add(CustomerModel.fromJson(item['customers']));
    });

    var responseBooking = bookings;
    var responseExpert = experts;
    var responseCustomer = customers;

    if (response.isEmpty) {
      return null;
    } else {
      return BookingResponseModel.fromJson(responseBooking, responseExpert, responseCustomer);
    }
  }
}
