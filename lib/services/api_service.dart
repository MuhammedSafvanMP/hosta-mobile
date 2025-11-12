import 'package:dio/dio.dart';
// import 'package:hosta/data/specialty_data.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://hostaserver.onrender.com'));

//  https://hostaserver.onrender.com'
// http://10.0.2.2:3000
 // GET all carousel
 // ApiService.dart
// Future<Response> getAllCarousel() async {
//   return await _dio.get(
//     '/api/ads/nearby',
//   );
// }

Future<Response> getAllCarousel({
  double? latitude,
  double? longitude,
}) async {
  final Map<String, dynamic> queryParams = {};
  
  // Only add location parameters if they are provided
  if (latitude != null && longitude != null) {
    queryParams['lat'] = latitude.toString();
    queryParams['lng'] = longitude.toString();
  }

  return await _dio.get(
    '/api/ads/nearby',
    queryParameters: queryParams.isNotEmpty ? queryParams : null,
  );
}


  // GET all hospitals
  Future<Response> getAllHospitals() async {
    return await _dio.get('/api/hospitals');
  }

   // GET a hospitals
  Future<Response> getAHospitals(String id) async {
    return await _dio.get('/api/hospitals/$id');
  }


    Future<Response> getAllHospitalsSpeciality(String search) async {
    return await _dio.get('/api/hospital/filter/$search');
  }



  Future<Response> getAHospitalsReview(String id) async {
    return await _dio.get('/api/reviews/hospital/$id');
  }


  // Create a reviewf
  Future<Response> createAHospitalReview(Map<String, dynamic> reviewData) async {
    return await _dio.post(
      '/api/reviews',
      data: reviewData,
    );
  }

  // Update a review
  Future<Response> updateAHospitalReview(String id, Map<String, dynamic> reviewData) async {
    return await _dio.put(
      '/api/reviews/$id',
      data: reviewData,
    );
  }

      Future<Response> deleteAHospitalReview(String id) async {
    return await _dio.delete('/api/reviews/$id');
  }


  // GET all donors
  Future<Response> getAllDonors() async {
    return await _dio.get('/api/donors');
  }

  // GET single donor
  Future<Response> getADonor(String id) async {
    return await _dio.get('/api/donors/users/$id');
  }

  // CREATE donor
  Future<Response> createADonor(Map<String, dynamic> data) async {
    return await _dio.post('/api/donors', data: data);
  }

  // DELETE donor
  Future<Response> deleteDonor(String id) async {
    return await _dio.delete('/api/donors/$id');
  }

  // LOGIN
  Future<Response> loginUser(Map<String, dynamic> data) async {
    return await _dio.post('/api/users/login/phone', data: data);
  }

  // OTP
  Future<Response> otpUser(Map<String, dynamic> data) async {
    return await _dio.post('/api/users/otp', data: data);
  }

  // SIGNUP
  Future<Response> signupUser(Map<String, dynamic> data) async {
    return await _dio.post('/api/users/registeration', data: data);
  }

    Future<Response> getAUser(String id) async {
    return await _dio.get('/api/users/$id');
  }


  // Update user
  Future<Response> updateUser(String id, Map<String, dynamic> data) async {
    return await _dio.put('/api/users/$id', data: data);
  }


  // GET Ambulances
  Future<Response> getAllAmbulances() async {
    return await _dio.get('/api/ambulance');
  }

  // GET Notifications
  Future<Response> getAllNotificationRead(String id) async {
    return await _dio.get('/api/notifications/user/read/$id');
  }

  Future<Response> getAllNotificationUnRead(String id) async {
    return await _dio.get('/api/notifications/user/no-read/$id');
  }

  // PATCH read all notifications
  Future<Response> allReadNotifications(String id) async {
    return await _dio.patch('/api/notifications/user/read-all/$id');
  }

  // PATCH single notification
  Future<Response> aReadNotification(String id) async {
    return await _dio.patch('/api/notifications/user/$id');
  }

  // GET bookings
  Future<Response> getAllBookings(String id) async {
    return await _dio.get('/api/bookings/user/$id');
  }

  // UPDATE booking
  Future<Response> createBooking(String id, Map<String, dynamic> data) async {
    return await _dio.post('/api/bookings/$id', data: data);
  }


  // UPDATE booking
  Future<Response> updateBooking(String bookingId, String hospitalId, Map<String, dynamic> data) async {
    return await _dio.put('/api/bookings/$bookingId/hospital/$hospitalId', data: data);
  }



 Future<Response> getDoctors({required String id, required String specialty}) async {
  return await _dio.get(
    '/api/hospital/doctors',
    queryParameters: {
      'id': id,
      'speciality': specialty,
    },
  );
}


  // UPDATE booking
  Future<Response> getFilter(String filter) async {
    return await _dio.get('/api/hospital/filter/$filter');
  }
}
