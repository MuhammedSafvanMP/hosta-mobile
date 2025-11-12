// import 'package:flutter/material.dart';
// import 'package:hosta/common/top_snackbar.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../services/api_service.dart';

// class Booking extends StatefulWidget {
//   const Booking({super.key});

//   @override
//   State<Booking> createState() => _BookingState();
// }

// class _BookingState extends State<Booking> {
//   String selectedFilter = "All";
//   String searchQuery = "";
//   DateTime? selectedDate;
//   bool isLoading = true;
//   String? userId;

//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, dynamic>> bookings = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadUserIdAndFetchBookings();
//   }

//   // Load user ID first, then fetch bookings
//   Future<void> _loadUserIdAndFetchBookings() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final storedUserId = prefs.getString('userId');
      
//       if (mounted) {
//         setState(() {
//           userId = storedUserId;
//         });
//       }
      
//       print("📱 Loaded user ID for bookings: $userId");
      
//       if (userId != null && userId!.isNotEmpty) {
//         await _fetchBookings();
//       } else {
//         if (mounted) {
//           setState(() => isLoading = false);
//         }
//         print("❌ No user ID found for bookings");
//       }
//     } catch (e) {
//       print("❌ Error loading user ID: $e");
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   Future<void> _fetchBookings() async {
//     if (userId == null || userId!.isEmpty) {
//       setState(() => isLoading = false);
//       return;
//     }

//     setState(() => isLoading = true);
//     try {
//       final response = await ApiService().getAllBookings(userId!);
//       print("📋 Bookings API Response: ${response.data}");
      
//       // Handle different response structures
//       dynamic bookingsData;
//       if (response.data is Map && response.data.containsKey('data')) {
//         bookingsData = response.data['data'];
//       } else if (response.data is List) {
//         bookingsData = response.data;
//       } else {
//         bookingsData = [];
//       }

//       if (bookingsData is List) {
//         bookings = List<Map<String, dynamic>>.from(bookingsData.map((b) {
//           return {
//             "id": b["bookingId"] ?? b["_id"] ?? "",
//             "hospital_id": b["hospitalId"] ?? "",
//             "hospital": b["hospitalName"] ?? "Unknown Hospital",
//             "type": b["hospitalType"] ?? "General",
//             "doctor": b["doctor_name"] ?? "Not specified",
//             "specialty": b["specialty"] ?? "General",
//             "date": _parseDate(b["booking_date"]),
//             "status": (b["status"] ?? "pending").toString().toLowerCase(),
//             "time": b["time"] ?? "N/A",
//           };
//         }));
//       } else {
//         bookings = [];
//       }
      
//       print("✅ Loaded ${bookings.length} bookings");
//     } catch (e) {
//       print("❌ Error fetching bookings: $e");
//       bookings = [];
//     } finally {
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   String _parseDate(dynamic date) {
//     try {
//       if (date == null) return "N/A";
//       return DateFormat('yyyy-MM-dd').format(DateTime.parse(date.toString()));
//     } catch (e) {
//       return "Invalid date";
//     }
//   }

//   List<Map<String, dynamic>> get filteredBookings {
//     return bookings.where((b) {
//       final matchesFilter =
//           selectedFilter == "All" || b["status"] == selectedFilter.toLowerCase();
//       final matchesSearch = b["hospital"]
//               .toString()
//               .toLowerCase()
//               .contains(searchQuery.toLowerCase()) ||
//           b["doctor"]
//               .toString()
//               .toLowerCase()
//               .contains(searchQuery.toLowerCase());
//       final matchesDate = selectedDate == null ||
//           b["date"] == DateFormat('yyyy-MM-dd').format(selectedDate!);
//       return matchesFilter && matchesSearch && matchesDate;
//     }).toList();
//   }

//   void _selectDate() async {
//     DateTime now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? now,
//       firstDate: DateTime(now.year - 1),
//       lastDate: DateTime(now.year + 1),
//     );
//     if (picked != null) setState(() => selectedDate = picked);
//   }

//   Future<void> _cancelBooking(Map<String, dynamic> booking) async {
//     final bookingId = booking["id"].toString();
//     final hospitalId = booking["hospital_id"].toString();
    
//     if (bookingId.isEmpty || hospitalId.isEmpty) {
//     showTopSnackBar(context, "Invalid booking data", isError: true);

//       return;
//     }

//     try {
//       await ApiService().updateBooking(bookingId, hospitalId, {"status": "cancel"});
//       setState(() {
//         booking["status"] = "cancel";
//       });
//             showTopSnackBar(context, "Booking cancelled successfully");

//     } catch (e) {
//       print("❌ Error cancelling booking: $e");
//       showTopSnackBar(context, "Failed to cancel booking", isError: true);

//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     // Show message if no user ID
//     if (userId == null || userId!.isEmpty) {
//       return Scaffold(
//         backgroundColor: const Color(0xFFECFDF5),
//         appBar: AppBar(
//            backgroundColor: Colors.green,
//           title: const Text("My Bookings",
//         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         )),
//         body: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.person_off, size: 60, color: Colors.grey),
//               SizedBox(height: 16),
//               Text(
//                 "Please login to view your bookings",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     final bookingsToShow = filteredBookings;

//     return Scaffold(
//       backgroundColor: const Color(0xFFECFDF5),
//       appBar: AppBar(
//            backgroundColor: Colors.green,
//         title: const Text("My Bookings",
//         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _fetchBookings,
//             tooltip: "Refresh bookings",
//           ),
//         ],
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: "Search by hospital or doctor",
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onChanged: (value) => setState(() => searchQuery = value),
//                   ),
//                   const SizedBox(height: 12),

//                   // Date Filter
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         selectedDate == null
//                             ? "Filter by date"
//                             : "Date: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
//                         style: const TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                       TextButton.icon(
//                         onPressed: _selectDate,
//                         icon: const Icon(Icons.calendar_today, size: 18),
//                         label: const Text("Select Date"),
//                       ),
//                     ],
//                   ),

//                   // Status Filter Chips
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: ["All", "Pending", "Accepted", "Declined", "Cancelled"]
//                           .map(
//                             (f) => Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 4),
//                               child: ChoiceChip(
//                                 label: Text(f),
//                                 selected: selectedFilter == f,
//                                 onSelected: (_) {
//                                   setState(() {
//                                     selectedFilter = f;
//                                     if (f == "All") {
//                                       selectedDate = null;
//                                       _searchController.clear();
//                                       searchQuery = "";
//                                     }
//                                   });
//                                 },
//                                 selectedColor: Colors.green,
//                                 labelStyle: TextStyle(
//                                   color: selectedFilter == f ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Booking List
//                   Expanded(
//                     child: bookingsToShow.isEmpty
//                         ? const Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.event_busy, size: 60, color: Colors.grey),
//                                 SizedBox(height: 16),
//                                 Text(
//                                   "No bookings found",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : ListView.builder(
//                             itemCount: bookingsToShow.length,
//                             itemBuilder: (context, index) {
//                               final b = bookingsToShow[index];
//                               return Card(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12)),
//                                 margin: const EdgeInsets.symmetric(vertical: 8),
//                                 elevation: 3,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.local_hospital,
//                                               color: Colors.green),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               b["hospital"],
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 16),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 6),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.person,
//                                               color: Colors.blueAccent),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               "Doctor: ${b["doctor"]}",
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.medical_services,
//                                               color: Colors.orange),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               "Type: ${b["type"]}",
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.health_and_safety,
//                                               color: Colors.purple),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               "Specialty: ${b["specialty"]}",
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.calendar_today,
//                                               color: Colors.teal),
//                                           const SizedBox(width: 8),
//                                           Text("Date: ${b["date"]}"),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.access_time,
//                                               color: Colors.redAccent),
//                                           const SizedBox(width: 8),
//                                           Text("Time: ${b["time"]}"),
//                                         ],
//                                       ),
//                                       const Divider(height: 20),
//                                       Align(
//                                         alignment: Alignment.centerRight,
//                                         child: b["status"] == "pending"
//                                             ? ElevatedButton(
//                                                 onPressed: () => _cancelBooking(b),
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor: Colors.red,
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius: BorderRadius.circular(8),
//                                                   ),
//                                                 ),
//                                                 child: const Text("Cancel Booking"),
//                                               )
//                                             : Container(
//                                                 padding: const EdgeInsets.symmetric(
//                                                     horizontal: 12, vertical: 6),
//                                                 decoration: BoxDecoration(
//                                                   color: b["status"] == "accepted"
//                                                       ? Colors.green
//                                                       : b["status"] == "declined"
//                                                           ? Colors.orange
//                                                           : b["status"] == "cancelled"
//                                                               ? Colors.red
//                                                               : Colors.grey,
//                                                   borderRadius: BorderRadius.circular(8),
//                                                 ),
//                                                 child: Text(
//                                                   b["status"].toString().toUpperCase(),
//                                                   style: const TextStyle(color: Colors.white),
//                                                 ),
//                                               ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hosta/common/top_snackbar.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../services/api_service.dart';

// class Booking extends StatefulWidget {
//   const Booking({super.key});

//   @override
//   State<Booking> createState() => _BookingState();
// }

// class _BookingState extends State<Booking> {
//   String selectedFilter = "All";
//   String searchQuery = "";
//   DateTime? selectedDate;
//   bool isLoading = true;
//   String? userId;

//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, dynamic>> bookings = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadUserIdAndFetchBookings();
//   }

//   // Load user ID first, then fetch bookings
//   Future<void> _loadUserIdAndFetchBookings() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final storedUserId = prefs.getString('userId');
      
//       if (mounted) {
//         setState(() {
//           userId = storedUserId;
//         });
//       }
      
//       print("📱 Loaded user ID for bookings: $userId");
      
//       if (userId != null && userId!.isNotEmpty) {
//         await _fetchBookings();
//       } else {
//         if (mounted) {
//           setState(() => isLoading = false);
//         }
//         print("❌ No user ID found for bookings");
//       }
//     } catch (e) {
//       print("❌ Error loading user ID: $e");
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   Future<void> _fetchBookings() async {
//     if (userId == null || userId!.isEmpty) {
//       setState(() => isLoading = false);
//       return;
//     }

//     setState(() => isLoading = true);
//     try {
//       final response = await ApiService().getAllBookings(userId!);
//       print("📋 Bookings API Response: ${response.data}");
      
//       // Handle different response structures
//       dynamic bookingsData;
//       if (response.data is Map && response.data.containsKey('data')) {
//         bookingsData = response.data['data'];
//       } else if (response.data is List) {
//         bookingsData = response.data;
//       } else {
//         bookingsData = [];
//       }

//       if (bookingsData is List) {
//         bookings = List<Map<String, dynamic>>.from(bookingsData.map((b) {
//           return {
//             "id": b["bookingId"] ?? b["_id"] ?? "",
//             "hospital_id": b["hospitalId"] ?? "",
//             "hospital": b["hospitalName"] ?? "Unknown Hospital",
//             "type": b["hospitalType"] ?? "General",
//             "doctor": b["doctor_name"] ?? "Not specified",
//             "specialty": b["specialty"] ?? "General",
//             "date": _parseDate(b["booking_date"]),
//             "status": (b["status"] ?? "pending").toString().toLowerCase(),
//             "time": b["time"] ?? "N/A",
//           };
//         }));
//       } else {
//         bookings = [];
//       }
      
//       print("✅ Loaded ${bookings.length} bookings");
//     } catch (e) {
//       print("❌ Error fetching bookings: $e");
//       bookings = [];
//     } finally {
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   String _parseDate(dynamic date) {
//     try {
//       if (date == null) return "N/A";
//       return DateFormat('yyyy-MM-dd').format(DateTime.parse(date.toString()));
//     } catch (e) {
//       return "Invalid date";
//     }
//   }

//   List<Map<String, dynamic>> get filteredBookings {
//     return bookings.where((b) {
//       final matchesFilter =
//           selectedFilter == "All" || b["status"] == selectedFilter.toLowerCase();
//       final matchesSearch = b["hospital"]
//               .toString()
//               .toLowerCase()
//               .contains(searchQuery.toLowerCase()) ||
//           b["doctor"]
//               .toString()
//               .toLowerCase()
//               .contains(searchQuery.toLowerCase());
//       final matchesDate = selectedDate == null ||
//           b["date"] == DateFormat('yyyy-MM-dd').format(selectedDate!);
//       return matchesFilter && matchesSearch && matchesDate;
//     }).toList();
//   }

//   void _selectDate() async {
//     DateTime now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? now,
//       firstDate: DateTime(now.year - 1),
//       lastDate: DateTime(now.year + 1),
//     );
//     if (picked != null) setState(() => selectedDate = picked);
//   }

//   Future<void> _cancelBooking(Map<String, dynamic> booking) async {
//     final bookingId = booking["id"].toString();
//     final hospitalId = booking["hospital_id"].toString();
    
//     if (bookingId.isEmpty || hospitalId.isEmpty) {
//       showTopSnackBar(context, "Invalid booking data", isError: true);
//       return;
//     }

//     try {
//       await ApiService().updateBooking(bookingId, hospitalId, {"status": "cancel"});
//       setState(() {
//         booking["status"] = "cancel";
//       });
//       showTopSnackBar(context, "Booking cancelled successfully");
//     } catch (e) {
//       print("❌ Error cancelling booking: $e");
//       showTopSnackBar(context, "Failed to cancel booking", isError: true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show message if no user ID
//     if (userId == null || userId!.isEmpty) {
//       return Scaffold(
//         backgroundColor: const Color(0xFFECFDF5),
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           title: const Text(
//             "My Bookings",
//             style: TextStyle(
//               fontWeight: FontWeight.bold, 
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: true, // Added this line
//         ),
//         body: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.person_off, size: 60, color: Colors.grey),
//               SizedBox(height: 16),
//               Text(
//                 "Please login to view your bookings",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     final bookingsToShow = filteredBookings;

//     return Scaffold(
//       backgroundColor: const Color(0xFFECFDF5),
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text(
//           "My Bookings",
//           style: TextStyle(
//             fontWeight: FontWeight.bold, 
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true, // Added this line
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _fetchBookings,
//             tooltip: "Refresh bookings",
//           ),
//         ],
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: "Search by hospital or doctor",
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onChanged: (value) => setState(() => searchQuery = value),
//                   ),
//                   const SizedBox(height: 12),

//                   // Date Filter
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         selectedDate == null
//                             ? "Filter by date"
//                             : "Date: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
//                         style: const TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                       TextButton.icon(
//                         onPressed: _selectDate,
//                         icon: const Icon(Icons.calendar_today, size: 18),
//                         label: const Text("Select Date"),
//                       ),
//                     ],
//                   ),

//                   // Status Filter Chips
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: ["All", "Pending", "Accepted", "Declined", "Cancelled"]
//                           .map(
//                             (f) => Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 4),
//                               child: ChoiceChip(
//                                 label: Text(f),
//                                 selected: selectedFilter == f,
//                                 onSelected: (_) {
//                                   setState(() {
//                                     selectedFilter = f;
//                                     if (f == "All") {
//                                       selectedDate = null;
//                                       _searchController.clear();
//                                       searchQuery = "";
//                                     }
//                                   });
//                                 },
//                                 selectedColor: Colors.green,
//                                 labelStyle: TextStyle(
//                                   color: selectedFilter == f ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Booking List
//                   Expanded(
//                     child: bookingsToShow.isEmpty
//                         ? const Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.event_busy, size: 60, color: Colors.grey),
//                                 SizedBox(height: 16),
//                                 Text(
//                                   "No bookings found",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : ListView.builder(
//                             itemCount: bookingsToShow.length,
//                             itemBuilder: (context, index) {
//                               final b = bookingsToShow[index];
//                               return Card(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12)),
//                                 margin: const EdgeInsets.symmetric(vertical: 8),
//                                 elevation: 3,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.local_hospital,
//                                               color: Colors.green),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               b["hospital"],
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 16),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 6),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.person,
//                                               color: Colors.blueAccent),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               "Doctor: ${b["doctor"]}",
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.medical_services,
//                                               color: Colors.orange),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               "Type: ${b["type"]}",
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.health_and_safety,
//                                               color: Colors.purple),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: Text(
//                                               "Specialty: ${b["specialty"]}",
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.calendar_today,
//                                               color: Colors.teal),
//                                           const SizedBox(width: 8),
//                                           Text("Date: ${b["date"]}"),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.access_time,
//                                               color: Colors.redAccent),
//                                           const SizedBox(width: 8),
//                                           Text("Time: ${b["time"]}"),
//                                         ],
//                                       ),
//                                       const Divider(height: 20),
//                                       Align(
//                                         alignment: Alignment.centerRight,
//                                         child: b["status"] == "pending"
//                                             ? ElevatedButton(
//                                                 onPressed: () => _cancelBooking(b),
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor: Colors.red,
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius: BorderRadius.circular(8),
//                                                   ),
//                                                 ),
//                                                 child: const Text("Cancel Booking"),
//                                               )
//                                             : Container(
//                                                 padding: const EdgeInsets.symmetric(
//                                                     horizontal: 12, vertical: 6),
//                                                 decoration: BoxDecoration(
//                                                   color: b["status"] == "accepted"
//                                                       ? Colors.green
//                                                       : b["status"] == "declined"
//                                                           ? Colors.orange
//                                                           : b["status"] == "cancelled"
//                                                               ? Colors.red
//                                                               : Colors.grey,
//                                                   borderRadius: BorderRadius.circular(8),
//                                                 ),
//                                                 child: Text(
//                                                   b["status"].toString().toUpperCase(),
//                                                   style: const TextStyle(color: Colors.white),
//                                                 ),
//                                               ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hosta/common/top_snackbar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String selectedFilter = "All";
  String searchQuery = "";
  DateTime? selectedDate;
  bool isLoading = true;
  String? userId;

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    _loadUserIdAndFetchBookings();
  }

  // Load user ID first, then fetch bookings
  Future<void> _loadUserIdAndFetchBookings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      
      if (mounted) {
        setState(() {
          userId = storedUserId;
        });
      }
      
      print("📱 Loaded user ID for bookings: $userId");
      
      if (userId != null && userId!.isNotEmpty) {
        await _fetchBookings();
      } else {
        if (mounted) {
          setState(() => isLoading = false);
        }
        print("❌ No user ID found for bookings");
      }
    } catch (e) {
      print("❌ Error loading user ID: $e");
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _fetchBookings() async {
    if (userId == null || userId!.isEmpty) {
      setState(() => isLoading = false);
      return;
    }

    setState(() => isLoading = true);
    try {
      final response = await ApiService().getAllBookings(userId!);
      print("📋 Bookings API Response: ${response.data}");
      
      // Handle different response structures
      dynamic bookingsData;
      if (response.data is Map && response.data.containsKey('data')) {
        bookingsData = response.data['data'];
      } else if (response.data is List) {
        bookingsData = response.data;
      } else {
        bookingsData = [];
      }

      if (bookingsData is List) {
        bookings = List<Map<String, dynamic>>.from(bookingsData.map((b) {
          return {
            "id": b["bookingId"] ?? b["_id"] ?? "",
            "hospital_id": b["hospitalId"] ?? "",
            "hospital": b["hospitalName"] ?? "Unknown Hospital",
            "type": b["hospitalType"] ?? "General",
            "doctor": b["doctor_name"] ?? "Not specified",
            "specialty": b["specialty"] ?? "General",
            "date": _parseDate(b["booking_date"]),
            "status": (b["status"] ?? "pending").toString().toLowerCase(),
            "time": b["time"] ?? "N/A",
          };
        }));
      } else {
        bookings = [];
      }
      
      print("✅ Loaded ${bookings.length} bookings");
    } catch (e) {
      print("❌ Error fetching bookings: $e");
      bookings = [];
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  String _parseDate(dynamic date) {
    try {
      if (date == null) return "N/A";
      return DateFormat('yyyy-MM-dd').format(DateTime.parse(date.toString()));
    } catch (e) {
      return "Invalid date";
    }
  }

  List<Map<String, dynamic>> get filteredBookings {
    return bookings.where((b) {
      final matchesFilter =
          selectedFilter == "All" || b["status"] == selectedFilter.toLowerCase();
      final matchesSearch = b["hospital"]
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          b["doctor"]
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
      final matchesDate = selectedDate == null ||
          b["date"] == DateFormat('yyyy-MM-dd').format(selectedDate!);
      return matchesFilter && matchesSearch && matchesDate;
    }).toList();
  }

  void _selectDate() async {
    DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _cancelBooking(Map<String, dynamic> booking) async {
    final bookingId = booking["id"].toString();
    final hospitalId = booking["hospital_id"].toString();
    
    if (bookingId.isEmpty || hospitalId.isEmpty) {
      showTopSnackBar(context, "Invalid booking data", isError: true);
      return;
    }

    try {
      await ApiService().updateBooking(bookingId, hospitalId, {"status": "cancel"});
      setState(() {
        booking["status"] = "cancel";
      });
      showTopSnackBar(context, "Booking cancelled successfully");
    } catch (e) {
      print("❌ Error cancelling booking: $e");
      showTopSnackBar(context, "Failed to cancel booking", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show message if no user ID
    if (userId == null || userId!.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFFECFDF5),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "My Bookings",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white,
            ),
          ),
          centerTitle: true, // Added this line
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_off, size: 60, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                "Please login to view your bookings",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final bookingsToShow = filteredBookings;

    return Scaffold(
      backgroundColor: const Color(0xFFECFDF5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "My Bookings",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Added this line
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchBookings,
            tooltip: "Refresh bookings",
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search by hospital or doctor",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) => setState(() => searchQuery = value),
                  ),
                  const SizedBox(height: 12),

                  // Date Filter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? "Filter by date"
                            : "Date: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      TextButton.icon(
                        onPressed: _selectDate,
                        icon: const Icon(Icons.calendar_today, size: 18),
                        label: const Text("Select Date"),
                      ),
                    ],
                  ),

                  // Status Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ["All", "Pending", "Accepted", "Declined", "Cancelled"]
                          .map(
                            (f) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: ChoiceChip(
                                label: Text(f),
                                selected: selectedFilter == f,
                                onSelected: (_) {
                                  setState(() {
                                    selectedFilter = f;
                                    if (f == "All") {
                                      selectedDate = null;
                                      _searchController.clear();
                                      searchQuery = "";
                                    }
                                  });
                                },
                                selectedColor: Colors.green,
                                labelStyle: TextStyle(
                                  color: selectedFilter == f ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Booking List
                  Expanded(
                    child: bookingsToShow.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.event_busy, size: 60, color: Colors.grey),
                                SizedBox(height: 16),
                                Text(
                                  "No bookings found",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: bookingsToShow.length,
                            itemBuilder: (context, index) {
                              final b = bookingsToShow[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.local_hospital,
                                              color: Colors.green),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              b["hospital"],
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(Icons.person,
                                              color: Colors.blueAccent),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              "Doctor: ${b["doctor"]}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.medical_services,
                                              color: Colors.orange),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              "Type: ${b["type"]}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.health_and_safety,
                                              color: Colors.purple),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              "Specialty: ${b["specialty"]}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_today,
                                              color: Colors.teal),
                                          const SizedBox(width: 8),
                                          Text("Date: ${b["date"]}"),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.access_time,
                                              color: Colors.redAccent),
                                          const SizedBox(width: 8),
                                          Text("Time: ${b["time"]}"),
                                        ],
                                      ),
                                      const Divider(height: 20),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: b["status"] == "pending"
                                            ? ElevatedButton(
                                                onPressed: () => _cancelBooking(b),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  foregroundColor: Colors.white, // Added this line for white text
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Cancel Booking",
                                                  style: TextStyle(color: Colors.white), // Added this line
                                                ),
                                              )
                                            : Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 12, vertical: 6),
                                                decoration: BoxDecoration(
                                                  color: b["status"] == "accepted"
                                                      ? Colors.green
                                                      : b["status"] == "declined"
                                                          ? Colors.orange
                                                          : b["status"] == "cancelled"
                                                              ? Colors.red
                                                              : Colors.grey,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  b["status"].toString().toUpperCase(),
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                              ),
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
            ),
    );
  }
}