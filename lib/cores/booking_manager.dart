import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/booking/booking_response_model.dart';

class BookingManager extends GetxController {
  final isBookingLoading = false.obs;
  final isBookingError = false.obs;
  final isBookingEmpty = false.obs;
  final isBookingSuccess = false.obs;
  final booking = [].obs;

  Future<void> saveBooking(BookingResponseModel? data) async {
    isBookingLoading.value = true;
    isBookingError.value = false;
    isBookingEmpty.value = false;
    isBookingSuccess.value = false;

    try {
      if (data == null) {
        isBookingEmpty.value = true;
      } else {
        booking.value = data.bookings;
        isBookingSuccess.value = true;
      }
    } catch (e) {
      isBookingError.value = true;
    } finally {
      isBookingLoading.value = false;
    }
  }
}
