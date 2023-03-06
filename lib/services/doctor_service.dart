import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/doctor/doctor_request_model.dart';
import 'package:makassar_pet_clinic/models/doctor/doctor_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<DoctorResponseModel?> getDoctor() async {
    final response = await supabase.from('experts').select();

    if (response.isEmpty) {
      return null;
    } else {
      return DoctorResponseModel.fromJson(response);
    }
  }

  Future<bool> addDoctor(DoctorRequestModel model) async {
    try {
      if (model.avatar == "Avatar 1") {
        model.avatar = 'assets/images/doctor1.jpeg';
      } else if (model.avatar == "Avatar 2") {
        model.avatar = 'assets/images/doctor2.jpeg';
      } else if (model.avatar == "Avatar 3") {
        model.avatar = 'assets/images/doctor3.jpeg';
      }
      await supabase.from('experts').insert({
        'name': model.name,
        'email': model.email,
        'specialization': model.specialization,
        'experience_years': "${model.experienceYears!} Years",
        'about': model.about,
        'phone': model.phone,
        'avatar': model.avatar,
        'address': model.address,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteDoctor(DoctorRequestModel model) async {
    try {
      await supabase.from('experts').delete().match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateDoctor(DoctorRequestModel model) async {
    try {
      if (model.avatar == "Avatar 1") {
        model.avatar = 'assets/images/doctor1.jpeg';
      } else if (model.avatar == "Avatar 2") {
        model.avatar = 'assets/images/doctor2.jpeg';
      } else if (model.avatar == "Avatar 3") {
        model.avatar = 'assets/images/doctor3.jpeg';
      }

      await supabase.from('experts').update({
        'name': model.name,
        'email': model.email,
        'specialization': model.specialization,
        'experience_years': "${model.experienceYears!} Years",
        'about': model.about,
        'phone': model.phone,
        'avatar': model.avatar,
        'address': model.address,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<DoctorResponseModel?> getDoctorByIdExpert(int idExpert) async {
    final response = await supabase.from('experts').select().eq('id_expert', idExpert);

    if (response.isEmpty) {
      return null;
    } else {
      return DoctorResponseModel.fromJson(response);
    }
  }
}
