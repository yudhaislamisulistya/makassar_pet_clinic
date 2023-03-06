import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/booking_manager.dart';
import 'package:makassar_pet_clinic/models/booking/booking_request_model.dart';
import 'package:makassar_pet_clinic/services/booking_service.dart';

class BookingController extends GetxController {
  late final BookingService bookingService;
  late final BookingManager bookingManager;

  @override
  void onInit() {
    bookingService = Get.put(BookingService());
    bookingManager = Get.put(BookingManager());
    super.onInit();
  }

  Future<void> getBookingRelatedToExpertByIdUser(int idUser, String? chat) async {
    final response = await bookingService.getBookingRelatedToExpertByIdUser(idUser, chat);
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Booking"));
      bookingManager.saveBooking(null);
    } else {
      bookingManager.saveBooking(response);
    }
  }

  Future<void> addBooking(int idUser, int idExpert, String status, String description, String dateBook) async {
    final response = await bookingService.addBooking(BookingRequestModel(idUser: idUser, idExpert: idExpert, status: status, description: description, dateBook: dateBook));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Terima kasih telah melakukan booking, Silahkan tunggu konfirmasi dari dokter dan cek pada riwayat booking"));
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal melakukan booking, silahkan coba lagi"));
    }
  }

  Future<void> updateBooking(int idUser, int id, String status, String description) async {
    final response = await bookingService.updateBooking(BookingRequestModel(id: id, status: status, description: description));
    if (response) {
      Get.back();
      getBookingRelatedToExpertByIdUser(idUser, null);
      Get.showSnackbar(snackBarSuccess("Berhasil mengubah status booking"));
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal mengubah status booking, silahkan coba lagi"));
    }
  }
}
