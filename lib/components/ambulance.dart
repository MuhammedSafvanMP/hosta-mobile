// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Ambulance extends StatefulWidget {
//   const Ambulance({super.key});

//   @override
//   State<Ambulance> createState() => _AmbulanceState();
// }

// class _AmbulanceState extends State<Ambulance> {
//   String searchQuery = '';
//   bool sortByNearest = false;

//   // 🚑 Dummy Ambulance Data (with locations)
//   final List<Map<String, String>> ambulanceList = [
//     {
//       "name": "City Ambulance Service",
//       "address": "123 MG Road, Kochi",
//       "location": "Kochi",
//       "phone": "+919876543210",
//     },
//     {
//       "name": "LifeCare Ambulance",
//       "address": "12 Hospital Street, Calicut",
//       "location": "Calicut",
//       "phone": "+918888777666",
//     },
//     {
//       "name": "Quick Response Ambulance",
//       "address": "45 Main Road, Trivandrum",
//       "location": "Trivandrum",
//       "phone": "+917123456789",
//     },
//     {
//       "name": "Emergency 24x7",
//       "address": "Opp. Medical College, Thrissur",
//       "location": "Thrissur",
//       "phone": "+919500112233",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Filter + Sort Data
//     List<Map<String, String>> filteredList = ambulanceList
//         .where((a) =>
//             a["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
//             a["address"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
//             a["location"]!.toLowerCase().contains(searchQuery.toLowerCase()))
//         .toList();

//     if (sortByNearest) {
//       filteredList.sort((a, b) =>
//           a["location"]!.compareTo(b["location"]!)); // mock sorting
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ======= Top Bar =======
//             Container(
              
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//               child: Row(
//                 children: [
//                   // 🔙 Back Button
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.arrow_back, color: Colors.black),
//                   ),
//                   const Expanded(
//                     child: Center(
//                       child: Text(
//                         "Ambulance Services",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 48), // balance alignment
//                 ],
//               ),
//             ),

//             // ======= Search + Nearest =======
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               child: Row(
//                 children: [
//                   // 🔍 Search Bar
//                   Expanded(
//                     child: TextField(
//                       onChanged: (value) {
//                         setState(() {
//                           searchQuery = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Search ambulance service...",
//                         prefixIcon:
//                             const Icon(Icons.search, color: Colors.grey),
//                         filled: true,
//                         fillColor: Colors.grey[100],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),

//                   // 📍 Nearest Button
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         sortByNearest = !sortByNearest;
//                       });
//                     },
//                     icon: const Icon(Icons.my_location, size: 18),
//                     label: Text(
//                       sortByNearest ? "Clear" : "Nearest",
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 14),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ======= Ambulance List =======
//             Expanded(
//               child: filteredList.isEmpty
//                   ? const Center(
//                       child: Text(
//                         "No ambulance services found",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: filteredList.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       itemBuilder: (context, index) {
//                         final amb = filteredList[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           elevation: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // 🚑 Fixed Ambulance Icon
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.green.shade50,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   padding: const EdgeInsets.all(12),
//                                   child: const Icon(
//                                     Icons.local_hospital,
//                                     color: Colors.green,
//                                     size: 32,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),

//                                 // ===== Details =====
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         amb["name"]!,
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         amb["address"]!,
//                                         style: const TextStyle(
//                                             color: Colors.grey, fontSize: 13),
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.location_on,
//                                               size: 16, color: Colors.green),
//                                           const SizedBox(width: 5),
//                                           Text(
//                                             amb["location"]!,
//                                             style: const TextStyle(
//                                                 color: Colors.black87,
//                                                 fontSize: 13),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 // 📞 Call Button
//                                 IconButton(
//                                   onPressed: () {
//                                     _callNumber(amb["phone"]!);
//                                   },
//                                   icon: const Icon(
//                                     Icons.call,
//                                     color: Colors.green,
//                                     size: 28,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 📞 Launch phone dialer
//   Future<void> _callNumber(String phone) async {
//     final Uri uri = Uri(scheme: 'tel', path: phone);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Could not launch dialer')),
//       );
//     }
//   }
// }


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import '../services/api_service.dart'; // ✅ Import your API service

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  final ApiService apiService = ApiService();
  List<dynamic> ambulanceList = [];
  bool isLoading = true;
  String searchQuery = '';
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    fetchAmbulances(); // ✅ Only get all data first, not location
  }

  // ✅ Fetch all ambulances (no sorting initially)
  Future<void> fetchAmbulances() async {
    try {
      final Response response = await apiService.getAllAmbulances();
      if (response.statusCode == 200 && response.data["status"] == "Success") {
        setState(() {
          ambulanceList = response.data["data"];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load ambulance data");
      }
    } catch (e) {
      print("❌ Error loading ambulances: $e");
      setState(() => isLoading = false);
    }
  }

  // ✅ When “Nearest” is clicked → get location and sort
  Future<void> sortByNearest() async {
    setState(() => isLoading = true);

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enable location services')),
        );
        setState(() => isLoading = false);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied')),
          );
          setState(() => isLoading = false);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Location permission permanently denied')),
        );
        setState(() => isLoading = false);
        return;
      }

      currentPosition = await Geolocator.getCurrentPosition();

      // Calculate distances
      for (var amb in ambulanceList) {
        if (amb["latitude"] != null && amb["longitude"] != null) {
          double lat = double.tryParse(amb["latitude"].toString()) ?? 0;
          double lon = double.tryParse(amb["longitude"].toString()) ?? 0;
          amb["distance"] = calculateDistance(
            currentPosition!.latitude,
            currentPosition!.longitude,
            lat,
            lon,
          );
        } else {
          amb["distance"] = double.infinity;
        }
      }

      // Sort by nearest
      ambulanceList.sort((a, b) => a["distance"].compareTo(b["distance"]));

      setState(() => isLoading = false);
    } catch (e) {
      print("❌ Error sorting by nearest: $e");
      setState(() => isLoading = false);
    }
  }

  // 📏 Haversine formula
  double calculateDistance(lat1, lon1, lat2, lon2) {
    const p = 0.017453292519943295; // pi / 180
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) *
            cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p)) /
            2;
    return 12742 * asin(sqrt(a)); // km
  }

  // 📞 Call Number
  Future<void> _callNumber(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch dialer')),
      );
    }
  }

  // 📍 Open in Google Maps
  Future<void> _openMap(double lat, double lon) async {
    final Uri uri =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lon");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open map')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredList = ambulanceList.where((a) {
      final name = a["serviceName"]?.toString().toLowerCase() ?? "";
      final address = a["address"]?.toString().toLowerCase() ?? "";
      return name.contains(searchQuery.toLowerCase()) ||
          address.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFECFDF5),

      appBar: AppBar(
        title: const Text(
          "Ambulances",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.green))
          : Column(
              children: [
                // 🔍 Search Bar + Nearest Button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() => searchQuery = value);
                          },
                          decoration: InputDecoration(
                            hintText: "Search ambulance service...",
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: sortByNearest,
                        icon: const Icon(Icons.my_location, size: 20),
                        label: const Text("Nearest"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),

                // 🚑 Ambulance List
                Expanded(
                  child: filteredList.isEmpty
                      ? const Center(
                          child: Text(
                            "No ambulances found",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredList.length,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemBuilder: (context, index) {
                            final amb = filteredList[index];
                            final distance = amb["distance"] != null
                                ? "${amb["distance"].toStringAsFixed(2)} km"
                                : "Unknown";

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade50,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: const Icon(
                                        Icons.local_hospital,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            amb["serviceName"] ?? "Unknown",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            amb["address"] ?? "No address",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Vehicle: ${amb["vehicleType"] ?? "N/A"}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Distance: $distance",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _callNumber(amb["phone"] ?? "");
                                          },
                                          icon: const Icon(
                                            Icons.call,
                                            color: Colors.green,
                                            size: 28,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            double lat = double.tryParse(
                                                    amb["latitude"]
                                                        .toString()) ??
                                                0;
                                            double lon = double.tryParse(
                                                    amb["longitude"]
                                                        .toString()) ??
                                                0;
                                            _openMap(lat, lon);
                                          },
                                          icon: const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                            size: 28,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
