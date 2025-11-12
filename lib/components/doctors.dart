// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import '../data/doctors_data.dart';

// // // // // // // class Doctors extends StatefulWidget {
// // // // // // //   const Doctors({super.key});

// // // // // // //   @override
// // // // // // //   State<Doctors> createState() => _DoctorsState();
// // // // // // // }

// // // // // // // class _DoctorsState extends State<Doctors> {
// // // // // // //   String searchQuery = '';

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final width = MediaQuery.of(context).size.width;

// // // // // // //     final filteredDoctors = doctorsData
// // // // // // //         .where((doc) =>
// // // // // // //             doc["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
// // // // // // //             doc["department"]!
// // // // // // //                 .toLowerCase()
// // // // // // //                 .contains(searchQuery.toLowerCase()))
// // // // // // //         .toList();

// // // // // // //     return Scaffold(
// // // // // // //       backgroundColor: Colors.white,
// // // // // // //       body: SafeArea(
// // // // // // //         child: Column(
// // // // // // //           children: [
// // // // // // //             // ===== Top Bar =====
// // // // // // //             Container(
// // // // // // //               color: Colors.white,
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
// // // // // // //               child: Stack(
// // // // // // //                 alignment: Alignment.center,
// // // // // // //                 children: [
// // // // // // //                   Align(
// // // // // // //                     alignment: Alignment.centerLeft,
// // // // // // //                     child: IconButton(
// // // // // // //                       icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // // // // //                       onPressed: () => Navigator.pop(context),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   const Center(
// // // // // // //                     child: Text(
// // // // // // //                       "Our Expert Doctors",
// // // // // // //                       style: TextStyle(
// // // // // // //                         fontSize: 20,
// // // // // // //                         fontWeight: FontWeight.bold,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // ===== Search Bar =====
// // // // // // //             Padding(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
// // // // // // //               child: TextField(
// // // // // // //                 onChanged: (value) {
// // // // // // //                   setState(() {
// // // // // // //                     searchQuery = value;
// // // // // // //                   });
// // // // // // //                 },
// // // // // // //                 decoration: InputDecoration(
// // // // // // //                   hintText: 'Search doctor or department...',
// // // // // // //                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
// // // // // // //                   filled: true,
// // // // // // //                   fillColor: Colors.grey[100],
// // // // // // //                   border: OutlineInputBorder(
// // // // // // //                     borderRadius: BorderRadius.circular(12),
// // // // // // //                     borderSide: BorderSide.none,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             // ===== Scrollable Grid =====
// // // // // // //             Expanded(
// // // // // // //               child: SingleChildScrollView(
// // // // // // //                 child: Padding(
// // // // // // //                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // // // //                   child: GridView.builder(
// // // // // // //                     shrinkWrap: true,
// // // // // // //                     physics: const NeverScrollableScrollPhysics(),
// // // // // // //                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // //                       crossAxisCount: 2,
// // // // // // //                       mainAxisSpacing: 12,
// // // // // // //                       crossAxisSpacing: 12,
// // // // // // //                       childAspectRatio: 0.8,
// // // // // // //                     ),
// // // // // // //                     itemCount: filteredDoctors.length,
// // // // // // //                     itemBuilder: (context, index) {
// // // // // // //                       final doctor = filteredDoctors[index];
// // // // // // //                       return _buildDoctorCard(
// // // // // // //                         doctor["name"]!,
// // // // // // //                         doctor["department"]!,
// // // // // // //                         doctor["image"]!,
// // // // // // //                         width,
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildDoctorCard(String name, String department, String imageUrl, double width) {
// // // // // // //     return Container(
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(14),
// // // // // // //         boxShadow: const [
// // // // // // //           BoxShadow(
// // // // // // //             color: Colors.black12,
// // // // // // //             blurRadius: 3,
// // // // // // //             spreadRadius: 1,
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // //         children: [
// // // // // // //           // Doctor image
// // // // // // //           CircleAvatar(
// // // // // // //             radius: width * 0.12,
// // // // // // //             backgroundImage: NetworkImage(imageUrl),
// // // // // // //           ),
// // // // // // //           // Doctor name
// // // // // // //           Text(
// // // // // // //             name,
// // // // // // //             textAlign: TextAlign.center,
// // // // // // //             style: const TextStyle(
// // // // // // //               fontSize: 15,
// // // // // // //               fontWeight: FontWeight.bold,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           // Department
// // // // // // //           Text(
// // // // // // //             department,
// // // // // // //             style: const TextStyle(
// // // // // // //               fontSize: 13,
// // // // // // //               color: Colors.grey,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           // Button
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.only(top: 4),
// // // // // // //             child: ElevatedButton(
// // // // // // //               onPressed: () {
// // // // // // //                 // TODO: Implement booking action
// // // // // // //               },
// // // // // // //               style: ElevatedButton.styleFrom(
// // // // // // //                 backgroundColor: const Color(0xFF28a745),
// // // // // // //                 shape: RoundedRectangleBorder(
// // // // // // //                   borderRadius: BorderRadius.circular(10),
// // // // // // //                 ),
// // // // // // //                 padding:
// // // // // // //                     const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
// // // // // // //               ),
// // // // // // //               child: const Text(
// // // // // // //                 "View & Book",
// // // // // // //                 style: TextStyle(color: Colors.white, fontSize: 13),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }


// // // // // import 'package:flutter/material.dart';
// // // // // import '../data/doctors_data.dart';

// // // // // class Doctors extends StatefulWidget {
// // // // //   const Doctors({super.key});

// // // // //   @override
// // // // //   State<Doctors> createState() => _DoctorsState();
// // // // // }

// // // // // class _DoctorsState extends State<Doctors> {
// // // // //   String searchQuery = '';

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final width = MediaQuery.of(context).size.width;

// // // // //     // ✅ Safe filtering to avoid null errors
// // // // //     final filteredDoctors = doctorsData
// // // // //         .where((doc) {
// // // // //           final name = (doc["name"] ?? "").toString();
// // // // //           final dept = (doc["department"] ?? "").toString();
// // // // //           return name.toLowerCase().contains(searchQuery.toLowerCase()) ||
// // // // //               dept.toLowerCase().contains(searchQuery.toLowerCase());
// // // // //         })
// // // // //         .toList();

// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.white,
// // // // //       body: SafeArea(
// // // // //         child: Column(
// // // // //           children: [
// // // // //             // ===== Top Bar =====
// // // // //             Container(
// // // // //               color: Colors.white,
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
// // // // //               child: Stack(
// // // // //                 alignment: Alignment.center,
// // // // //                 children: [
// // // // //                   Align(
// // // // //                     alignment: Alignment.centerLeft,
// // // // //                     child: IconButton(
// // // // //                       icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // // //                       onPressed: () => Navigator.pop(context),
// // // // //                     ),
// // // // //                   ),
// // // // //                   const Center(
// // // // //                     child: Text(
// // // // //                       "Our Expert Doctors",
// // // // //                       style: TextStyle(
// // // // //                         fontSize: 20,
// // // // //                         fontWeight: FontWeight.bold,
// // // // //                       ),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),

// // // // //             // ===== Search Bar =====
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
// // // // //               child: TextField(
// // // // //                 onChanged: (value) {
// // // // //                   setState(() {
// // // // //                     searchQuery = value;
// // // // //                   });
// // // // //                 },
// // // // //                 decoration: InputDecoration(
// // // // //                   hintText: 'Search doctor or department...',
// // // // //                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
// // // // //                   filled: true,
// // // // //                   fillColor: Colors.grey[100],
// // // // //                   border: OutlineInputBorder(
// // // // //                     borderRadius: BorderRadius.circular(12),
// // // // //                     borderSide: BorderSide.none,
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ),

// // // // //             // ===== Scrollable Grid =====
// // // // //             Expanded(
// // // // //               child: SingleChildScrollView(
// // // // //                 child: Padding(
// // // // //                   padding:
// // // // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // //                   child: GridView.builder(
// // // // //                     shrinkWrap: true,
// // // // //                     physics: const NeverScrollableScrollPhysics(),
// // // // //                     gridDelegate:
// // // // //                         const SliverGridDelegateWithFixedCrossAxisCount(
// // // // //                       crossAxisCount: 2,
// // // // //                       mainAxisSpacing: 12,
// // // // //                       crossAxisSpacing: 12,
// // // // //                       childAspectRatio: 0.8,
// // // // //                     ),
// // // // //                     itemCount: filteredDoctors.length,
// // // // //                     itemBuilder: (context, index) {
// // // // //                       final doctor = filteredDoctors[index];
// // // // //                       return _buildDoctorCard(
// // // // //                         context,
// // // // //                         doctor["name"] ?? "Unknown Doctor",
// // // // //                         doctor["department"] ?? "N/A",
// // // // //                         doctor["image"] ?? "",
// // // // //                         doctor["hospital"] ?? "Unknown Hospital",
// // // // //                         doctor["location"] ?? "Not specified",
// // // // //                         doctor["phone"] ?? "N/A",
// // // // //                         width,
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildDoctorCard(
// // // // //     BuildContext context,
// // // // //     String name,
// // // // //     String department,
// // // // //     String imageUrl,
// // // // //     String hospital,
// // // // //     String location,
// // // // //     String phone,
// // // // //     double width,
// // // // //   ) {
// // // // //     return Container(
// // // // //       decoration: BoxDecoration(
// // // // //         color: Colors.white,
// // // // //         borderRadius: BorderRadius.circular(14),
// // // // //         boxShadow: const [
// // // // //           BoxShadow(
// // // // //             color: Colors.black12,
// // // // //             blurRadius: 3,
// // // // //             spreadRadius: 1,
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       child: Column(
// // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //         children: [
// // // // //           CircleAvatar(
// // // // //             radius: width * 0.12,
// // // // //             backgroundImage:
// // // // //                 imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
// // // // //             child: imageUrl.isEmpty
// // // // //                 ? Text(name[0].toUpperCase(),
// // // // //                     style: const TextStyle(fontSize: 22))
// // // // //                 : null,
// // // // //           ),
// // // // //           Text(
// // // // //             name,
// // // // //             textAlign: TextAlign.center,
// // // // //             style: const TextStyle(
// // // // //               fontSize: 15,
// // // // //               fontWeight: FontWeight.bold,
// // // // //             ),
// // // // //           ),
// // // // //           Text(
// // // // //             department,
// // // // //             style: const TextStyle(
// // // // //               fontSize: 13,
// // // // //               color: Colors.grey,
// // // // //             ),
// // // // //           ),
// // // // //           ElevatedButton(
// // // // //             onPressed: () {
// // // // //               _showBookingSheet(context, name, department, hospital, location, phone);
// // // // //             },
// // // // //             style: ElevatedButton.styleFrom(
// // // // //               backgroundColor: Colors.green,
// // // // //               shape: RoundedRectangleBorder(
// // // // //                 borderRadius: BorderRadius.circular(10),
// // // // //               ),
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
// // // // //             ),
// // // // //             child: const Text(
// // // // //               "View & Book",
// // // // //               style: TextStyle(color: Colors.white, fontSize: 13),
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ================= POPUP BOTTOM SHEET =================
// // // // //   void _showBookingSheet(BuildContext context, String name, String department,
// // // // //       String hospital, String location, String phone) {
// // // // //     final patientNameController = TextEditingController();
// // // // //     final phoneController = TextEditingController();
// // // // //     final placeController = TextEditingController();
// // // // //     DateTime? dob;
// // // // //     DateTime? appointmentDate;
// // // // //     TimeOfDay? appointmentTime;

// // // // //     showModalBottomSheet(
// // // // //       isScrollControlled: true,
// // // // //       context: context,
// // // // //       backgroundColor: Colors.white,
// // // // //       shape: const RoundedRectangleBorder(
// // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // // //       ),
// // // // //       builder: (context) {
// // // // //         return StatefulBuilder(builder: (context, setModalState) {
// // // // //           return Padding(
// // // // //             padding: EdgeInsets.only(
// // // // //               left: 16,
// // // // //               right: 16,
// // // // //               top: 12,
// // // // //               bottom: MediaQuery.of(context).viewInsets.bottom + 16,
// // // // //             ),
// // // // //             child: SingleChildScrollView(
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                 children: [
// // // // //                   // Close Button
// // // // //                   Row(
// // // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                     children: [
// // // // //                       Text(
// // // // //                         "Book Appointment",
// // // // //                         style: const TextStyle(
// // // // //                             fontSize: 18, fontWeight: FontWeight.bold),
// // // // //                       ),
// // // // //                       IconButton(
// // // // //                         icon: const Icon(Icons.close),
// // // // //                         onPressed: () => Navigator.pop(context),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                   const Divider(),

// // // // //                   // Doctor Details
// // // // //                   Text(name,
// // // // //                       style: const TextStyle(
// // // // //                           fontSize: 16, fontWeight: FontWeight.bold)),
// // // // //                   Text(department,
// // // // //                       style:
// // // // //                           const TextStyle(fontSize: 14, color: Colors.grey)),
// // // // //                   const SizedBox(height: 8),

// // // // //                   // Hospital Details
// // // // //                   Card(
// // // // //                     color: Colors.blue.shade50,
// // // // //                     child: ListTile(
// // // // //                       title: Text(hospital,
// // // // //                           style: const TextStyle(fontWeight: FontWeight.bold)),
// // // // //                       subtitle: Text(location),
// // // // //                       trailing: const Icon(Icons.local_hospital,
// // // // //                           color: Colors.blue),
// // // // //                     ),
// // // // //                   ),

// // // // //                   const SizedBox(height: 12),

// // // // //                   // Timings Table
// // // // //                   const Text("Available Days & Time",
// // // // //                       style:
// // // // //                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // //                   const SizedBox(height: 8),
// // // // //                   Table(
// // // // //                     border: TableBorder.all(color: Colors.grey.shade300),
// // // // //                     children: const [
// // // // //                       TableRow(children: [
// // // // //                         Padding(
// // // // //                           padding: EdgeInsets.all(8.0),
// // // // //                           child: Text("Monday",
// // // // //                               style: TextStyle(fontWeight: FontWeight.w500)),
// // // // //                         ),
// // // // //                         Padding(
// // // // //                           padding: EdgeInsets.all(8.0),
// // // // //                           child: Text("9:00 AM - 1:00 PM"),
// // // // //                         ),
// // // // //                       ]),
// // // // //                       TableRow(children: [
// // // // //                         Padding(
// // // // //                           padding: EdgeInsets.all(8.0),
// // // // //                           child: Text("Wednesday",
// // // // //                               style: TextStyle(fontWeight: FontWeight.w500)),
// // // // //                         ),
// // // // //                         Padding(
// // // // //                           padding: EdgeInsets.all(8.0),
// // // // //                           child: Text("4:00 PM - 7:00 PM"),
// // // // //                         ),
// // // // //                       ]),
// // // // //                     ],
// // // // //                   ),

// // // // //                   const SizedBox(height: 16),

// // // // //                   // Booking Form
// // // // //                   const Text("Patient Details",
// // // // //                       style:
// // // // //                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // //                   const SizedBox(height: 8),

// // // // //                   _buildInput("Patient Name", patientNameController),
// // // // //                   _buildInput("Phone Number", phoneController,
// // // // //                       keyboardType: TextInputType.phone),
// // // // //                   _buildDatePicker(context, "Date of Birth", dob, (picked) {
// // // // //                     setModalState(() => dob = picked);
// // // // //                   }),
// // // // //                   _buildInput("Place", placeController),
// // // // //                   _buildDatePicker(context, "Appointment Date", appointmentDate,
// // // // //                       (picked) {
// // // // //                     setModalState(() => appointmentDate = picked);
// // // // //                   }),
// // // // //                   _buildTimePicker(context, "Appointment Time",
// // // // //                       appointmentTime, (picked) {
// // // // //                     setModalState(() => appointmentTime = picked);
// // // // //                   }),

// // // // //                   const SizedBox(height: 20),

// // // // //                   // Book Button
// // // // //                   Center(
// // // // //                     child: ElevatedButton(
// // // // //                       onPressed: () {
// // // // //                         Navigator.pop(context);
// // // // //                         ScaffoldMessenger.of(context).showSnackBar(
// // // // //                           const SnackBar(
// // // // //                               content: Text("Appointment booked successfully!")),
// // // // //                         );
// // // // //                       },
// // // // //                       style: ElevatedButton.styleFrom(
// // // // //                         backgroundColor: Colors.green,
// // // // //                         padding: const EdgeInsets.symmetric(
// // // // //                             horizontal: 40, vertical: 12),
// // // // //                       ),
// // // // //                       child: const Text("Book Appointment",
// // // // //                           style: TextStyle(color: Colors.white, fontSize: 16)),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           );
// // // // //         });
// // // // //       },
// // // // //     );
// // // // //   }

// // // // //   Widget _buildInput(String label, TextEditingController controller,
// // // // //       {TextInputType keyboardType = TextInputType.text}) {
// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.only(bottom: 10),
// // // // //       child: TextField(
// // // // //         controller: controller,
// // // // //         keyboardType: keyboardType,
// // // // //         decoration: InputDecoration(
// // // // //           labelText: label,
// // // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildDatePicker(BuildContext context, String label, DateTime? date,
// // // // //       Function(DateTime) onPicked) {
// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.only(bottom: 10),
// // // // //       child: InkWell(
// // // // //         onTap: () async {
// // // // //           final picked = await showDatePicker(
// // // // //             context: context,
// // // // //             initialDate: date ?? DateTime.now(),
// // // // //             firstDate: DateTime(1950),
// // // // //             lastDate: DateTime(2100),
// // // // //           );
// // // // //           if (picked != null) onPicked(picked);
// // // // //         },
// // // // //         child: InputDecorator(
// // // // //           decoration: InputDecoration(
// // // // //             labelText: label,
// // // // //             border:
// // // // //                 OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // // // //           ),
// // // // //           child: Row(
// // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //             children: [
// // // // //               Text(date == null
// // // // //                   ? "Select Date"
// // // // //                   : "${date.day}/${date.month}/${date.year}"),
// // // // //               const Icon(Icons.calendar_today, color: Colors.grey),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildTimePicker(BuildContext context, String label, TimeOfDay? time,
// // // // //       Function(TimeOfDay) onPicked) {
// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.only(bottom: 10),
// // // // //       child: InkWell(
// // // // //         onTap: () async {
// // // // //           final picked =
// // // // //               await showTimePicker(context: context, initialTime: TimeOfDay.now());
// // // // //           if (picked != null) onPicked(picked);
// // // // //         },
// // // // //         child: InputDecorator(
// // // // //           decoration: InputDecoration(
// // // // //             labelText: label,
// // // // //             border:
// // // // //                 OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // // // //           ),
// // // // //           child: Row(
// // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //             children: [
// // // // //               Text(time == null
// // // // //                   ? "Select Time"
// // // // //                   : "${time.format(context)}"),
// // // // //               const Icon(Icons.access_time, color: Colors.grey),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }



// // // // import 'package:flutter/material.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // import '../services/api_service.dart';
// // // // import '../models/doctor_model.dart';

// // // // class Doctors extends StatefulWidget {
// // // //   final String hospitalId;
// // // //   final String specialty;
  
// // // //   const Doctors({super.key, required this.hospitalId, required this.specialty});

// // // //   @override
// // // //   State<Doctors> createState() => _DoctorsState();
// // // // }

// // // // class _DoctorsState extends State<Doctors> {
// // // //   String searchQuery = '';
// // // //   List<Hospital> hospitals = [];
// // // //   bool isLoading = true;
// // // //   String? errorMessage;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _fetchDoctors();
// // // //   }

// // // //   Future<void> _fetchDoctors() async {
// // // //     try {
// // // //       final response = await ApiService().getDoctors(
// // // //         id: widget.hospitalId,
// // // //         specialty: widget.specialty,
// // // //       );

     
      
// // // //       if (response.data['success'] == true) {
// // // //         setState(() {
// // // //           hospitals = (response.data['hospitals'] as List)
// // // //               .map((hospitalJson) => Hospital.fromJson(hospitalJson))
// // // //               .toList();
// // // //           isLoading = false;
// // // //         });
// // // //       } else {
// // // //         setState(() {
// // // //           errorMessage = response.data['message'] ?? 'Failed to load doctors';
// // // //           isLoading = false;
// // // //         });
// // // //       }
// // // //     } catch (e) {
// // // //       setState(() {
// // // //         errorMessage = 'Error loading doctors: $e';
// // // //         isLoading = false;
// // // //       });
// // // //     }
// // // //   }

// // // //   List<Doctor> get allDoctors {
// // // //     List<Doctor> doctors = [];
// // // //     for (var hospital in hospitals) {
// // // //       doctors.addAll(hospital.doctors.map((doctor) => doctor.copyWith(
// // // //         hospitalName: hospital.name,
// // // //         hospitalAddress: hospital.address,
// // // //         hospitalPhone: hospital.phone,
// // // //         hospitalId: hospital.id,
// // // //       )));
// // // //     }
// // // //     return doctors;
// // // //   }

// // // //   List<Doctor> get filteredDoctors {
// // // //     if (searchQuery.isEmpty) return allDoctors;
    
// // // //     return allDoctors.where((doctor) {
// // // //       final name = doctor.name.toLowerCase();
// // // //       final specialty = doctor.specialty.toLowerCase();
// // // //       final hospitalName = doctor.hospitalName?.toLowerCase() ?? '';
      
// // // //       return name.contains(searchQuery.toLowerCase()) ||
// // // //           specialty.contains(searchQuery.toLowerCase()) ||
// // // //           hospitalName.contains(searchQuery.toLowerCase());
// // // //     }).toList();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.grey[50],
// // // //       body: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             // Header
// // // //             _buildHeader(),
// // // //             // Search
// // // //             _buildSearchBar(),
// // // //             // Content
// // // //             Expanded(child: _buildContent()),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildHeader() {
// // // //     return Container(
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: Colors.black12,
// // // //             blurRadius: 4,
// // // //             offset: Offset(0, 2),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// // // //       child: Row(
// // // //         children: [
// // // //           GestureDetector(
// // // //             onTap: () => Navigator.pop(context),
// // // //             child: Container(
// // // //               padding: EdgeInsets.all(8),
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.grey[100],
// // // //                 borderRadius: BorderRadius.circular(10),
// // // //               ),
// // // //               child: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.grey[700]),
// // // //             ),
// // // //           ),
// // // //           SizedBox(width: 16),
// // // //           Expanded(
// // // //             child: Center(
// // // //               child: Text(
// // // //                 "Find Your Doctor",
// // // //                 style: TextStyle(
// // // //                   fontSize: 22,
// // // //                   fontWeight: FontWeight.bold,
// // // //                   color: Colors.grey[800],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildSearchBar() {
// // // //     return Container(
// // // //       color: Colors.white,
// // // //       padding: EdgeInsets.all(20),
// // // //       child: Container(
// // // //         height: 50,
// // // //         decoration: BoxDecoration(
// // // //           color: Colors.grey[50],
// // // //           borderRadius: BorderRadius.circular(15),
// // // //           border: Border.all(color: Colors.grey[200]!),
// // // //         ),
// // // //         child: Row(
// // // //           children: [
// // // //             SizedBox(width: 16),
// // // //             Icon(Icons.search_rounded, color: Colors.grey[500], size: 20),
// // // //             SizedBox(width: 12),
// // // //             Expanded(
// // // //               child: TextField(
// // // //                 onChanged: (value) => setState(() => searchQuery = value),
// // // //                 decoration: InputDecoration(
// // // //                   hintText: 'Search doctors, specialties...',
// // // //                   hintStyle: TextStyle(color: Colors.grey[500]),
// // // //                   border: InputBorder.none,
// // // //                   contentPadding: EdgeInsets.zero,
// // // //                 ),
// // // //                 style: TextStyle(fontSize: 14),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildContent() {
// // // //     if (isLoading) {
// // // //       return Center(child: CircularProgressIndicator(color: Colors.blue));
// // // //     }

// // // //     if (errorMessage != null) {
// // // //       return Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Icon(Icons.error_outline, size: 60, color: Colors.grey[400]),
// // // //             SizedBox(height: 16),
// // // //             Text(
// // // //               errorMessage!,
// // // //               style: TextStyle(color: Colors.grey[600]),
// // // //               textAlign: TextAlign.center,
// // // //             ),
// // // //             SizedBox(height: 20),
// // // //             ElevatedButton(
// // // //               onPressed: _fetchDoctors,
// // // //               style: ElevatedButton.styleFrom(
// // // //                 backgroundColor: Colors.blue,
// // // //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // //                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
// // // //               ),
// // // //               child: Text('Try Again', style: TextStyle(color: Colors.white)),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       );
// // // //     }

// // // //     return Column(
// // // //       children: [
// // // //         // Results Count
// // // //         Container(
// // // //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// // // //           color: Colors.white,
// // // //           child: Row(
// // // //             children: [
// // // //               Text(
// // // //                 '${filteredDoctors.length} Doctors Found',
// // // //                 style: TextStyle(
// // // //                   fontSize: 14,
// // // //                   color: Colors.grey[600],
// // // //                   fontWeight: FontWeight.w500,
// // // //                 ),
// // // //               ),
// // // //               Spacer(),
            
// // // //             ],
// // // //           ),
// // // //         ),
// // // //         SizedBox(height: 8),
// // // //         // Doctors Grid
// // // //         Expanded(
// // // //           child: filteredDoctors.isEmpty
// // // //               ? _buildEmptyState()
// // // //               : _buildDoctorsGrid(),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildEmptyState() {
// // // //     return Center(
// // // //       child: Column(
// // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // //         children: [
// // // //           Icon(Icons.search_off_rounded, size: 80, color: Colors.grey[300]),
// // // //           SizedBox(height: 20),
// // // //           Text(
// // // //             'No doctors found',
// // // //             style: TextStyle(
// // // //               fontSize: 18,
// // // //               color: Colors.grey[600],
// // // //               fontWeight: FontWeight.w500,
// // // //             ),
// // // //           ),
// // // //           SizedBox(height: 8),
// // // //           Text(
// // // //             'Try adjusting your search',
// // // //             style: TextStyle(
// // // //               fontSize: 14,
// // // //               color: Colors.grey[500],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildDoctorsGrid() {
// // // //     return Padding(
// // // //       padding: EdgeInsets.symmetric(horizontal: 16),
// // // //       child: GridView.builder(
// // // //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // //           crossAxisCount: 2,
// // // //           mainAxisSpacing: 16,
// // // //           crossAxisSpacing: 16,
// // // //           childAspectRatio: 0.85,
// // // //         ),
// // // //         itemCount: filteredDoctors.length,
// // // //         itemBuilder: (context, index) {
// // // //           final doctor = filteredDoctors[index];
// // // //           return _buildDoctorCard(doctor);
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildDoctorCard(Doctor doctor) {
// // // //     // Get first letter or default to 'D'
// // // //     String firstLetter = 'D';
// // // //     if (doctor.name.isNotEmpty) {
// // // //       firstLetter = doctor.name[0].toUpperCase();
// // // //     }
    
// // // //     return GestureDetector(
// // // //       onTap: () => _showDoctorDetails(context, doctor),
// // // //       child: Container(
// // // //         decoration: BoxDecoration(
// // // //           color: Colors.white,
// // // //           borderRadius: BorderRadius.circular(16),
// // // //           boxShadow: [
// // // //             BoxShadow(
// // // //               color: Colors.black12,
// // // //               blurRadius: 8,
// // // //               offset: Offset(0, 4),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             // Doctor Header with Avatar
// // // //             Container(
// // // //               padding: EdgeInsets.all(16),
// // // //               child: Row(
// // // //                 children: [
// // // //                   // Avatar with consistent blue color
// // // //                   Container(
// // // //                     width: 50,
// // // //                     height: 50,
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.blue[500],
// // // //                       shape: BoxShape.circle,
// // // //                     ),
// // // //                     child: Center(
// // // //                       child: Text(
// // // //                         firstLetter,
// // // //                         style: TextStyle(
// // // //                           fontSize: 18,
// // // //                           fontWeight: FontWeight.bold,
// // // //                           color: Colors.white,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                   SizedBox(width: 12),
// // // //                   Expanded(
// // // //                     child: Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // //                       children: [
// // // //                         Text(
// // // //                           doctor.name.isNotEmpty ? doctor.name : 'Unknown Doctor',
// // // //                           style: TextStyle(
// // // //                             fontSize: 15,
// // // //                             fontWeight: FontWeight.bold,
// // // //                             color: Colors.grey[800],
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                         SizedBox(height: 4),
// // // //                         Text(
// // // //                           doctor.specialty,
// // // //                           style: TextStyle(
// // // //                             fontSize: 12,
// // // //                             color: Colors.blue[600],
// // // //                             fontWeight: FontWeight.w500,
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
            
// // // //             // Doctor Details
// // // //             Padding(
// // // //               padding: EdgeInsets.symmetric(horizontal: 16),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   if (doctor.qualification != null && doctor.qualification!.isNotEmpty)
// // // //                     Text(
// // // //                       doctor.qualification!,
// // // //                       style: TextStyle(
// // // //                         fontSize: 11,
// // // //                         color: Colors.grey[600],
// // // //                         height: 1.3,
// // // //                       ),
// // // //                       maxLines: 2,
// // // //                       overflow: TextOverflow.ellipsis,
// // // //                     ),
// // // //                   SizedBox(height: 8),
// // // //                   Row(
// // // //                     children: [
// // // //                       Icon(Icons.local_hospital_rounded, size: 12, color: Colors.grey[500]),
// // // //                       SizedBox(width: 4),
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           doctor.hospitalName ?? 'Hospital',
// // // //                           style: TextStyle(
// // // //                             fontSize: 11,
// // // //                             color: Colors.grey[600],
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
            
// // // //             Spacer(),
            
// // // //             // Book Button - Full width at bottom
// // // //             Container(
// // // //               width: double.infinity,
// // // //               margin: EdgeInsets.all(16),
// // // //               child: ElevatedButton(
// // // //                 onPressed: () => _showBookingSheet(context, doctor),
// // // //                 style: ElevatedButton.styleFrom(
// // // //                   backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey[400],
// // // //                   foregroundColor: Colors.white,
// // // //                   padding: EdgeInsets.symmetric(vertical: 10),
// // // //                   shape: RoundedRectangleBorder(
// // // //                     borderRadius: BorderRadius.circular(10),
// // // //                   ),
// // // //                   elevation: 0,
// // // //                 ),
// // // //                 child: Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: [
// // // //                     Icon(Icons.calendar_today_rounded, size: 14),
// // // //                     SizedBox(width: 6),
// // // //                     Text(
// // // //                       doctor.bookingOpen ? 'BOOK APPOINTMENT' : 'BOOKING CLOSED',
// // // //                       style: TextStyle(
// // // //                         fontSize: 11,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   void _showDoctorDetails(BuildContext context, Doctor doctor) {
// // // //     showModalBottomSheet(
// // // //       context: context,
// // // //       isScrollControlled: true,
// // // //       backgroundColor: Colors.transparent,
// // // //       builder: (context) {
// // // //         return DoctorDetailsSheet(doctor: doctor, onBook: _showBookingSheet);
// // // //       },
// // // //     );
// // // //   }

// // // //   void _showBookingSheet(BuildContext context, Doctor doctor) {
// // // //     if (!doctor.bookingOpen) {
// // // //       _showTopNotification(context, 'Booking is currently closed for Dr. ${doctor.name}', Colors.orange);
// // // //       return;
// // // //     }

// // // //     showModalBottomSheet(
// // // //       context: context,
// // // //       isScrollControlled: true,
// // // //       backgroundColor: Colors.transparent,
// // // //       builder: (context) {
// // // //         return BookingForm(doctor: doctor, onBooking: _handleBooking);
// // // //       },
// // // //     );
// // // //   }

// // // //   Future<void> _handleBooking(
// // // //     BuildContext context,
// // // //     Doctor doctor,
// // // //     String patientName,
// // // //     String patientPhone,
// // // //     String patientPlace,
// // // //     DateTime? patientDob,
// // // //     DateTime? appointmentDate,
// // // //   ) async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     final storedUserId = prefs.getString('userId');

// // // //     if (storedUserId == null) {
// // // //       _showLoginDialog(context);
// // // //       return;
// // // //     }

// // // //     if (patientName.isEmpty || patientPhone.isEmpty || patientPlace.isEmpty || 
// // // //         patientDob == null || appointmentDate == null) {
// // // //       _showTopNotification(context, 'Please fill all required fields', Colors.red);
// // // //       return;
// // // //     }

// // // //     // Check if appointment date is in the past
// // // //     final now = DateTime.now();
// // // //     final selectedDate = DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day);
// // // //     final currentDate = DateTime(now.year, now.month, now.day);
    
// // // //     if (selectedDate.isBefore(currentDate)) {
// // // //       _showTopNotification(context, 'Please select a future date for appointment', Colors.red);
// // // //       return;
// // // //     }

// // // //     final bookingData = {
// // // //       'userId': storedUserId,
// // // //       'specialty': doctor.specialty,
// // // //       'doctor_name': doctor.name,
// // // //       'booking_date': appointmentDate.toIso8601String(),
// // // //       'patient_name': patientName,
// // // //       'patient_phone': patientPhone,
// // // //       'patient_place': patientPlace,
// // // //       'patient_dob': patientDob.toIso8601String(),
// // // //     };

// // // //     try {
// // // //       final response = await ApiService().createBooking(
// // // //         doctor.hospitalId!,
// // // //         bookingData,
// // // //       );

// // // //       if (response.data['success'] == true) {
// // // //         Navigator.pop(context); // Close booking form
// // // //         _showTopNotification(context, 'Appointment booked successfully with Dr. ${doctor.name}!', Colors.green);
// // // //       } else {
// // // //         _showTopNotification(context, 'Booking failed: ${response.data['message']}', Colors.red);
// // // //       }
// // // //     } catch (e) {
// // // //       _showTopNotification(context, 'Error booking appointment: $e', Colors.red);
// // // //     }
// // // //   }

// // // //   void _showTopNotification(BuildContext context, String message, Color backgroundColor) {
// // // //     // Show a snackbar at the top
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       SnackBar(
// // // //         content: Text(message),
// // // //         backgroundColor: backgroundColor,
// // // //         behavior: SnackBarBehavior.floating,
// // // //         margin: EdgeInsets.only(
// // // //           bottom: MediaQuery.of(context).size.height - 100,
// // // //           right: 20,
// // // //           left: 20,
// // // //         ),
// // // //         shape: RoundedRectangleBorder(
// // // //           borderRadius: BorderRadius.circular(10),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   void _showLoginDialog(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (context) => AlertDialog(
// // // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // // //         title: Text('Sign In Required', style: TextStyle(fontWeight: FontWeight.bold)),
// // // //         content: Text('Please sign in to book appointments and access all features.'),
// // // //         actions: [
// // // //           TextButton(
// // // //             onPressed: () => Navigator.pop(context),
// // // //             child: Text('Cancel', style: TextStyle(color: Colors.grey)),
// // // //           ),
// // // //           ElevatedButton(
// // // //             onPressed: () {
// // // //               Navigator.pop(context);
// // // //               Navigator.pushNamed(context, '/login');
// // // //             },
// // // //             style: ElevatedButton.styleFrom(
// // // //               backgroundColor: Colors.blue,
// // // //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // //             ),
// // // //             child: Text('Sign In', style: TextStyle(color: Colors.white)),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // Modern Doctor Details Sheet
// // // // class DoctorDetailsSheet extends StatelessWidget {
// // // //   final Doctor doctor;
// // // //   final Function(BuildContext, Doctor) onBook;

// // // //   const DoctorDetailsSheet({super.key, required this.doctor, required this.onBook});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // Get first letter or default to 'D'
// // // //     String firstLetter = 'D';
// // // //     if (doctor.name.isNotEmpty) {
// // // //       firstLetter = doctor.name[0].toUpperCase();
// // // //     }
    
// // // //     return Container(
// // // //       height: MediaQuery.of(context).size.height * 0.85,
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.only(
// // // //           topLeft: Radius.circular(30),
// // // //           topRight: Radius.circular(30),
// // // //         ),
// // // //       ),
// // // //       child: Column(
// // // //         children: [
// // // //           // Header
// // // //           Container(
// // // //             padding: EdgeInsets.all(20),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.blue[50],
// // // //               borderRadius: BorderRadius.only(
// // // //                 topLeft: Radius.circular(30),
// // // //                 topRight: Radius.circular(30),
// // // //               ),
// // // //             ),
// // // //             child: Row(
// // // //               children: [
// // // //                 Container(
// // // //                   width: 70,
// // // //                   height: 70,
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.blue[500],
// // // //                     shape: BoxShape.circle,
// // // //                   ),
// // // //                   child: Center(
// // // //                     child: Text(
// // // //                       firstLetter,
// // // //                       style: TextStyle(
// // // //                         fontSize: 24,
// // // //                         fontWeight: FontWeight.bold,
// // // //                         color: Colors.white,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(width: 16),
// // // //                 Expanded(
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       Text(
// // // //                         doctor.name,
// // // //                         style: TextStyle(
// // // //                           fontSize: 20,
// // // //                           fontWeight: FontWeight.bold,
// // // //                           color: Colors.grey[800],
// // // //                         ),
// // // //                       ),
// // // //                       SizedBox(height: 4),
// // // //                       Text(
// // // //                         doctor.specialty,
// // // //                         style: TextStyle(
// // // //                           fontSize: 16,
// // // //                           color: Colors.blue[600],
// // // //                           fontWeight: FontWeight.w500,
// // // //                         ),
// // // //                       ),
// // // //                       if (doctor.qualification != null)
// // // //                         Text(
// // // //                           doctor.qualification!,
// // // //                           style: TextStyle(
// // // //                             fontSize: 14,
// // // //                             color: Colors.grey[600],
// // // //                           ),
// // // //                         ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //                 IconButton(
// // // //                   onPressed: () => Navigator.pop(context),
// // // //                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
          
// // // //           Expanded(
// // // //             child: SingleChildScrollView(
// // // //               padding: EdgeInsets.all(20),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   // Hospital Info
// // // //                   _buildInfoCard(
// // // //                     icon: Icons.local_hospital_rounded,
// // // //                     title: doctor.hospitalName ?? 'Hospital',
// // // //                     subtitle: doctor.hospitalAddress ?? 'Address not available',
// // // //                     color: Colors.blue,
// // // //                   ),
                  
// // // //                   SizedBox(height: 20),
                  
// // // //                   // Available Timings
// // // //                   Text(
// // // //                     'Available Days & Timings',
// // // //                     style: TextStyle(
// // // //                       fontSize: 18,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: Colors.grey[800],
// // // //                     ),
// // // //                   ),
// // // //                   SizedBox(height: 12),
                  
// // // //                   if (doctor.consulting.isNotEmpty)
// // // //                     _buildTimingsList(doctor.consulting)
// // // //                   else
// // // //                     _buildNoTimings(),
                  
// // // //                   SizedBox(height: 20),
                  
// // // //                   // About Doctor
// // // //                   Text(
// // // //                     'About Doctor',
// // // //                     style: TextStyle(
// // // //                       fontSize: 18,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: Colors.grey[800],
// // // //                     ),
// // // //                   ),
// // // //                   SizedBox(height: 8),
// // // //                   Text(
// // // //                     'Dr. ${doctor.name} is a specialized ${doctor.specialty.toLowerCase()} with extensive experience in patient care. '
// // // //                     'Available for consultations as per the schedule above.',
// // // //                     style: TextStyle(
// // // //                       fontSize: 14,
// // // //                       color: Colors.grey[600],
// // // //                       height: 1.5,
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
          
// // // //           // Action Buttons
// // // //           Container(
// // // //             padding: EdgeInsets.all(20),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               boxShadow: [
// // // //                 BoxShadow(
// // // //                   color: Colors.black12,
// // // //                   blurRadius: 10,
// // // //                   offset: Offset(0, -2),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             child: Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: OutlinedButton(
// // // //                     onPressed: () => Navigator.pop(context),
// // // //                     style: OutlinedButton.styleFrom(
// // // //                       padding: EdgeInsets.symmetric(vertical: 15),
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(15),
// // // //                       ),
// // // //                       side: BorderSide(color: Colors.grey[300]!),
// // // //                     ),
// // // //                     child: Text(
// // // //                       'Close',
// // // //                       style: TextStyle(
// // // //                         color: Colors.grey[700],
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: ElevatedButton(
// // // //                     onPressed: () {
// // // //                       Navigator.pop(context);
// // // //                       onBook(context, doctor);
// // // //                     },
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey,
// // // //                       padding: EdgeInsets.symmetric(vertical: 15),
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(15),
// // // //                       ),
// // // //                     ),
// // // //                     child: Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // //                       children: [
// // // //                         Icon(Icons.calendar_today_rounded, size: 18, color: Colors.white),
// // // //                         SizedBox(width: 8),
// // // //                         Text(
// // // //                           doctor.bookingOpen ? 'Book Now' : 'Closed',
// // // //                           style: TextStyle(
// // // //                             color: Colors.white,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, required Color color}) {
// // // //     return Container(
// // // //       width: double.infinity,
// // // //       padding: EdgeInsets.all(16),
// // // //       decoration: BoxDecoration(
// // // //         color: color.withOpacity(0.1),
// // // //         borderRadius: BorderRadius.circular(15),
// // // //         border: Border.all(color: color.withOpacity(0.2)),
// // // //       ),
// // // //       child: Row(
// // // //         children: [
// // // //           Icon(icon, color: color, size: 24),
// // // //           SizedBox(width: 12),
// // // //           Expanded(
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Text(
// // // //                   title,
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.w600,
// // // //                     color: Colors.grey[800],
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(height: 4),
// // // //                 Text(
// // // //                   subtitle,
// // // //                   style: TextStyle(
// // // //                     fontSize: 14,
// // // //                     color: Colors.grey[600],
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildTimingsList(List<ConsultingDay> consultingDays) {
// // // //     return Column(
// // // //       children: consultingDays.map((day) {
// // // //         return Container(
// // // //           margin: EdgeInsets.only(bottom: 8),
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.grey[50],
// // // //             borderRadius: BorderRadius.circular(12),
// // // //             border: Border.all(color: Colors.grey[200]!),
// // // //           ),
// // // //           child: ListTile(
// // // //             leading: Container(
// // // //               width: 40,
// // // //               height: 40,
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.blue[100],
// // // //                 shape: BoxShape.circle,
// // // //               ),
// // // //               child: Icon(Icons.calendar_today, color: Colors.blue, size: 20),
// // // //             ),
// // // //             title: Text(
// // // //               day.day,
// // // //               style: TextStyle(
// // // //                 fontWeight: FontWeight.w500,
// // // //                 color: Colors.grey[800],
// // // //               ),
// // // //             ),
// // // //             subtitle: day.sessions.isNotEmpty
// // // //                 ? Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: day.sessions.map((session) {
// // // //                       return Text(
// // // //                         '${session.startTime} - ${session.endTime}',
// // // //                         style: TextStyle(
// // // //                           color: Colors.green[600],
// // // //                           fontWeight: FontWeight.w500,
// // // //                         ),
// // // //                       );
// // // //                     }).toList(),
// // // //                   )
// // // //                 : Text(
// // // //                     'Not Available',
// // // //                     style: TextStyle(
// // // //                       color: Colors.grey[500],
// // // //                     ),
// // // //                   ),
// // // //           ),
// // // //         );
// // // //       }).toList(),
// // // //     );
// // // //   }

// // // //   Widget _buildNoTimings() {
// // // //     return Container(
// // // //       padding: EdgeInsets.all(20),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.grey[50],
// // // //         borderRadius: BorderRadius.circular(15),
// // // //       ),
// // // //       child: Column(
// // // //         children: [
// // // //           Icon(Icons.schedule_rounded, size: 40, color: Colors.grey[400]),
// // // //           SizedBox(height: 8),
// // // //           Text(
// // // //             'No schedule available',
// // // //             style: TextStyle(
// // // //               color: Colors.grey[600],
// // // //               fontWeight: FontWeight.w500,
// // // //             ),
// // // //           ),
// // // //           Text(
// // // //             'Please contact the hospital for schedule',
// // // //             style: TextStyle(
// // // //               color: Colors.grey[500],
// // // //               fontSize: 12,
// // // //             ),
// // // //             textAlign: TextAlign.center,
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // Modern Booking Form
// // // // class BookingForm extends StatefulWidget {
// // // //   final Doctor doctor;
// // // //   final Function(
// // // //     BuildContext context,
// // // //     Doctor doctor,
// // // //     String patientName,
// // // //     String patientPhone,
// // // //     String patientPlace,
// // // //     DateTime? patientDob,
// // // //     DateTime? appointmentDate,
// // // //   ) onBooking;

// // // //   const BookingForm({super.key, required this.doctor, required this.onBooking});

// // // //   @override
// // // //   State<BookingForm> createState() => _BookingFormState();
// // // // }

// // // // class _BookingFormState extends State<BookingForm> {
// // // //   final TextEditingController patientNameController = TextEditingController();
// // // //   final TextEditingController phoneController = TextEditingController();
// // // //   final TextEditingController placeController = TextEditingController();
// // // //   DateTime? dob;
// // // //   DateTime? appointmentDate;

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // Get first letter or default to 'D'
// // // //     String firstLetter = 'D';
// // // //     if (widget.doctor.name.isNotEmpty) {
// // // //       firstLetter = widget.doctor.name[0].toUpperCase();
// // // //     }
    
// // // //     return Container(
// // // //       height: MediaQuery.of(context).size.height * 0.85,
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.only(
// // // //           topLeft: Radius.circular(30),
// // // //           topRight: Radius.circular(30),
// // // //         ),
// // // //       ),
// // // //       child: Column(
// // // //         children: [
// // // //           // Header
// // // //           Container(
// // // //             padding: EdgeInsets.all(20),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.blue[50],
// // // //               borderRadius: BorderRadius.only(
// // // //                 topLeft: Radius.circular(30),
// // // //                 topRight: Radius.circular(30),
// // // //               ),
// // // //             ),
// // // //             child: Row(
// // // //               children: [
// // // //                 Container(
// // // //                   width: 50,
// // // //                   height: 50,
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.blue[500],
// // // //                     shape: BoxShape.circle,
// // // //                   ),
// // // //                   child: Center(
// // // //                     child: Text(
// // // //                       firstLetter,
// // // //                       style: TextStyle(
// // // //                         fontSize: 18,
// // // //                         fontWeight: FontWeight.bold,
// // // //                         color: Colors.white,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       Text(
// // // //                         'Book Appointment',
// // // //                         style: TextStyle(
// // // //                           fontSize: 18,
// // // //                           fontWeight: FontWeight.bold,
// // // //                           color: Colors.grey[800],
// // // //                         ),
// // // //                       ),
// // // //                       Text(
// // // //                         'Dr. ${widget.doctor.name}',
// // // //                         style: TextStyle(
// // // //                           fontSize: 14,
// // // //                           color: Colors.grey[600],
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //                 IconButton(
// // // //                   onPressed: () => Navigator.pop(context),
// // // //                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
          
// // // //           Expanded(
// // // //             child: SingleChildScrollView(
// // // //               padding: EdgeInsets.all(20),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   // Available Days & Timings Preview
// // // //                   _buildTimingsPreview(),
                  
// // // //                   SizedBox(height: 24),
                  
// // // //                   // Patient Details Form
// // // //                   Text(
// // // //                     'Patient Information',
// // // //                     style: TextStyle(
// // // //                       fontSize: 18,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: Colors.grey[800],
// // // //                     ),
// // // //                   ),
// // // //                   SizedBox(height: 16),
                  
// // // //                   _buildInputField('Full Name', patientNameController, Icons.person_outline),
// // // //                   SizedBox(height: 16),
// // // //                   _buildInputField('Phone Number', phoneController, Icons.phone_android_outlined, keyboardType: TextInputType.phone),
// // // //                   SizedBox(height: 16),
// // // //                   _buildDateField('Date of Birth', dob, Icons.cake_outlined, (picked) => setState(() => dob = picked), isPastOnly: true),
// // // //                   SizedBox(height: 16),
// // // //                   _buildInputField('Place', placeController, Icons.location_on_outlined),
// // // //                   SizedBox(height: 16),
// // // //                   _buildDateField('Appointment Date', appointmentDate, Icons.calendar_today_outlined, (picked) => setState(() => appointmentDate = picked), isPastOnly: false),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
          
// // // //           // Book Button
// // // //           Container(
// // // //             padding: EdgeInsets.all(20),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               boxShadow: [
// // // //                 BoxShadow(
// // // //                   color: Colors.black12,
// // // //                   blurRadius: 10,
// // // //                   offset: Offset(0, -2),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             child: SizedBox(
// // // //               width: double.infinity,
// // // //               child: ElevatedButton(
// // // //                 onPressed: () => widget.onBooking(
// // // //                   context,
// // // //                   widget.doctor,
// // // //                   patientNameController.text,
// // // //                   phoneController.text,
// // // //                   placeController.text,
// // // //                   dob,
// // // //                   appointmentDate,
// // // //                 ),
// // // //                 style: ElevatedButton.styleFrom(
// // // //                   backgroundColor: Colors.green,
// // // //                   padding: EdgeInsets.symmetric(vertical: 16),
// // // //                   shape: RoundedRectangleBorder(
// // // //                     borderRadius: BorderRadius.circular(15),
// // // //                   ),
// // // //                 ),
// // // //                 child: Text(
// // // //                   'CONFIRM BOOKING',
// // // //                   style: TextStyle(
// // // //                     color: Colors.white,
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.bold,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildTimingsPreview() {
// // // //     final availableDays = widget.doctor.consulting.where((day) => day.sessions.isNotEmpty).toList();
    
// // // //     return Container(
// // // //       padding: EdgeInsets.all(16),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.grey[50],
// // // //         borderRadius: BorderRadius.circular(15),
// // // //         border: Border.all(color: Colors.grey[200]!),
// // // //       ),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Row(
// // // //             children: [
// // // //               Icon(Icons.schedule_rounded, color: Colors.blue, size: 20),
// // // //               SizedBox(width: 8),
// // // //               Text(
// // // //                 'Available Days & Timings',
// // // //                 style: TextStyle(
// // // //                   fontSize: 16,
// // // //                   fontWeight: FontWeight.bold,
// // // //                   color: Colors.grey[800],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           SizedBox(height: 12),
// // // //           if (availableDays.isNotEmpty)
// // // //             Column(
// // // //               children: availableDays.take(3).map((day) {
// // // //                 return Container(
// // // //                   margin: EdgeInsets.only(bottom: 8),
// // // //                   padding: EdgeInsets.all(12),
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.white,
// // // //                     borderRadius: BorderRadius.circular(10),
// // // //                     border: Border.all(color: Colors.grey[200]!),
// // // //                   ),
// // // //                   child: Row(
// // // //                     children: [
// // // //                       Container(
// // // //                         width: 40,
// // // //                         height: 40,
// // // //                         decoration: BoxDecoration(
// // // //                           color: Colors.blue[100],
// // // //                           shape: BoxShape.circle,
// // // //                         ),
// // // //                         child: Icon(Icons.calendar_today, color: Colors.blue, size: 18),
// // // //                       ),
// // // //                       SizedBox(width: 12),
// // // //                       Expanded(
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Text(
// // // //                               day.day,
// // // //                               style: TextStyle(
// // // //                                 fontWeight: FontWeight.w500,
// // // //                                 color: Colors.grey[800],
// // // //                               ),
// // // //                             ),
// // // //                             if (day.sessions.isNotEmpty)
// // // //                               ...day.sessions.map((session) {
// // // //                                 return Text(
// // // //                                   '${session.startTime} - ${session.endTime}',
// // // //                                   style: TextStyle(
// // // //                                     fontSize: 12,
// // // //                                     color: Colors.green[600],
// // // //                                     fontWeight: FontWeight.w500,
// // // //                                   ),
// // // //                                 );
// // // //                               }).toList(),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 );
// // // //               }).toList(),
// // // //             )
// // // //           else
// // // //             Text(
// // // //               'No available timings',
// // // //               style: TextStyle(
// // // //                 color: Colors.grey[500],
// // // //                 fontStyle: FontStyle.italic,
// // // //               ),
// // // //             ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildInputField(String label, TextEditingController controller, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
// // // //     return TextField(
// // // //       controller: controller,
// // // //       keyboardType: keyboardType,
// // // //       decoration: InputDecoration(
// // // //         labelText: label,
// // // //         prefixIcon: Icon(icon, color: Colors.grey[500]),
// // // //         border: OutlineInputBorder(
// // // //           borderRadius: BorderRadius.circular(12),
// // // //           borderSide: BorderSide(color: Colors.grey[300]!),
// // // //         ),
// // // //         enabledBorder: OutlineInputBorder(
// // // //           borderRadius: BorderRadius.circular(12),
// // // //           borderSide: BorderSide(color: Colors.grey[300]!),
// // // //         ),
// // // //         focusedBorder: OutlineInputBorder(
// // // //           borderRadius: BorderRadius.circular(12),
// // // //           borderSide: BorderSide(color: Colors.blue),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildDateField(String label, DateTime? date, IconData icon, Function(DateTime) onPicked, {required bool isPastOnly}) {
// // // //     return InkWell(
// // // //       onTap: () async {
// // // //         final now = DateTime.now();
// // // //         final firstDate = isPastOnly ? DateTime(1900) : now;
// // // //         final lastDate = isPastOnly ? now : DateTime(now.year + 1);
        
// // // //         final picked = await showDatePicker(
// // // //           context: context,
// // // //           initialDate: date ?? now,
// // // //           firstDate: firstDate,
// // // //           lastDate: lastDate,
// // // //         );
// // // //         if (picked != null) onPicked(picked);
// // // //       },
// // // //       child: InputDecorator(
// // // //         decoration: InputDecoration(
// // // //           labelText: label,
// // // //           prefixIcon: Icon(icon, color: Colors.grey[500]),
// // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
// // // //           enabledBorder: OutlineInputBorder(
// // // //             borderRadius: BorderRadius.circular(12),
// // // //             borderSide: BorderSide(color: Colors.grey[300]!),
// // // //           ),
// // // //           focusedBorder: OutlineInputBorder(
// // // //             borderRadius: BorderRadius.circular(12),
// // // //             borderSide: BorderSide(color: Colors.blue),
// // // //           ),
// // // //         ),
// // // //         child: Row(
// // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //           children: [
// // // //             Text(
// // // //               date == null ? "Select Date" : "${date.day}/${date.month}/${date.year}",
// // // //               style: TextStyle(fontSize: 14, color: date == null ? Colors.grey[400] : Colors.grey[800]),
// // // //             ),
// // // //             Icon(Icons.arrow_drop_down_rounded, color: Colors.grey[500]),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }


// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import '../services/api_service.dart';
// // // import '../models/doctor_model.dart';

// // // class Doctors extends StatefulWidget {
// // //   final String hospitalId;
// // //   final String specialty;
  
// // //   const Doctors({super.key, required this.hospitalId, required this.specialty});

// // //   @override
// // //   State<Doctors> createState() => _DoctorsState();
// // // }

// // // class _DoctorsState extends State<Doctors> {
// // //   String searchQuery = '';
// // //   List<Hospital> hospitals = [];
// // //   bool isLoading = true;
// // //   String? errorMessage;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _fetchDoctors();
// // //   }

// // //   Future<void> _fetchDoctors() async {
// // //     try {
// // //       final response = await ApiService().getDoctors(
// // //         id: widget.hospitalId,
// // //         specialty: widget.specialty,
// // //       );

// // //       print(response.data);
      
// // //       if (response.data['success'] == true) {
// // //         setState(() {
// // //           hospitals = (response.data['hospitals'] as List)
// // //               .map((hospitalJson) => Hospital.fromJson(hospitalJson))
// // //               .toList();
// // //           isLoading = false;
// // //         });
// // //       } else {
// // //         setState(() {
// // //           errorMessage = response.data['message'] ?? 'Failed to load doctors';
// // //           isLoading = false;
// // //         });
// // //       }
// // //     } catch (e) {
// // //       setState(() {
// // //         errorMessage = 'Error loading doctors: $e';
// // //         isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   List<Doctor> get allDoctors {
// // //     List<Doctor> doctors = [];
// // //     for (var hospital in hospitals) {
// // //       doctors.addAll(hospital.doctors.map((doctor) => doctor.copyWith(
// // //         hospitalName: hospital.name,
// // //         hospitalAddress: hospital.address,
// // //         hospitalPhone: hospital.phone,
// // //         hospitalId: hospital.id,
// // //       )));
// // //     }
// // //     return doctors;
// // //   }

// // //   List<Doctor> get filteredDoctors {
// // //     if (searchQuery.isEmpty) return allDoctors;
    
// // //     return allDoctors.where((doctor) {
// // //       final name = doctor.name.toLowerCase();
// // //       final specialty = doctor.specialty.toLowerCase();
// // //       final hospitalName = doctor.hospitalName?.toLowerCase() ?? '';
      
// // //       return name.contains(searchQuery.toLowerCase()) ||
// // //           specialty.contains(searchQuery.toLowerCase()) ||
// // //           hospitalName.contains(searchQuery.toLowerCase());
// // //     }).toList();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //             backgroundColor: const Color(0xFFECFDF5),

// // //       body: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             // Header
// // //             _buildHeader(),
// // //             // Search
// // //             _buildSearchBar(),
// // //             // Content
// // //             Expanded(child: _buildContent()),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildHeader() {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black12,
// // //             blurRadius: 4,
// // //             offset: Offset(0, 2),
// // //           ),
// // //         ],
// // //       ),
// // //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// // //       child: Row(
// // //         children: [
// // //           GestureDetector(
// // //             onTap: () => Navigator.pop(context),
// // //             child: Container(
// // //               padding: EdgeInsets.all(8),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.grey[100],
// // //                 borderRadius: BorderRadius.circular(10),
// // //               ),
// // //               child: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.grey[700]),
// // //             ),
// // //           ),
// // //           SizedBox(width: 16),
// // //           Expanded(
// // //             child: Center(
// // //               child: Text(
// // //                 "Find Your Doctor",
// // //                 style: TextStyle(
// // //                   fontSize: 22,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.grey[800],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildSearchBar() {
// // //     return Container(
// // //       color: Colors.white,
// // //       padding: EdgeInsets.all(20),
// // //       child: Container(
// // //         height: 50,
// // //         decoration: BoxDecoration(
// // //           color: Colors.grey[50],
// // //           borderRadius: BorderRadius.circular(15),
// // //           border: Border.all(color: Colors.grey[200]!),
// // //         ),
// // //         child: Row(
// // //           children: [
// // //             SizedBox(width: 16),
// // //             Icon(Icons.search_rounded, color: Colors.grey[500], size: 20),
// // //             SizedBox(width: 12),
// // //             Expanded(
// // //               child: TextField(
// // //                 onChanged: (value) => setState(() => searchQuery = value),
// // //                 decoration: InputDecoration(
// // //                   hintText: 'Search doctors, specialties...',
// // //                   hintStyle: TextStyle(color: Colors.grey[500]),
// // //                   border: InputBorder.none,
// // //                   contentPadding: EdgeInsets.zero,
// // //                 ),
// // //                 style: TextStyle(fontSize: 14),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildContent() {
// // //     if (isLoading) {
// // //       return Center(child: CircularProgressIndicator(color: Colors.blue));
// // //     }

// // //     if (errorMessage != null) {
// // //       return Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Icon(Icons.error_outline, size: 60, color: Colors.grey[400]),
// // //             SizedBox(height: 16),
// // //             Text(
// // //               errorMessage!,
// // //               style: TextStyle(color: Colors.grey[600]),
// // //               textAlign: TextAlign.center,
// // //             ),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: _fetchDoctors,
// // //               style: ElevatedButton.styleFrom(
// // //                 backgroundColor: Colors.blue,
// // //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
// // //               ),
// // //               child: Text('Try Again', style: TextStyle(color: Colors.white)),
// // //             ),
// // //           ],
// // //         ),
// // //       );
// // //     }

// // //     return Column(
// // //       children: [
// // //         // Results Count
// // //         Container(
// // //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// // //           color: Colors.white,
// // //           child: Row(
// // //             children: [
// // //               Text(
// // //                 '${filteredDoctors.length} Doctors Found',
// // //                 style: TextStyle(
// // //                   fontSize: 14,
// // //                   color: Colors.grey[600],
// // //                   fontWeight: FontWeight.w500,
// // //                 ),
// // //               ),
// // //               Spacer(),
            
// // //             ],
// // //           ),
// // //         ),
// // //         SizedBox(height: 8),
// // //         // Doctors Grid
// // //         Expanded(
// // //           child: filteredDoctors.isEmpty
// // //               ? _buildEmptyState()
// // //               : _buildDoctorsGrid(),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildEmptyState() {
// // //     return Center(
// // //       child: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           Icon(Icons.search_off_rounded, size: 80, color: Colors.grey[300]),
// // //           SizedBox(height: 20),
// // //           Text(
// // //             'No doctors found',
// // //             style: TextStyle(
// // //               fontSize: 18,
// // //               color: Colors.grey[600],
// // //               fontWeight: FontWeight.w500,
// // //             ),
// // //           ),
// // //           SizedBox(height: 8),
// // //           Text(
// // //             'Try adjusting your search',
// // //             style: TextStyle(
// // //               fontSize: 14,
// // //               color: Colors.grey[500],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDoctorsGrid() {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16),
// // //       child: GridView.builder(
// // //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //           crossAxisCount: 2,
// // //           mainAxisSpacing: 16,
// // //           crossAxisSpacing: 16,
// // //           childAspectRatio: 0.85,
// // //         ),
// // //         itemCount: filteredDoctors.length,
// // //         itemBuilder: (context, index) {
// // //           final doctor = filteredDoctors[index];
// // //           return _buildDoctorCard(doctor);
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDoctorCard(Doctor doctor) {
// // //     // Get first letter or default to 'D' - Fixed to handle empty names
// // //     String firstLetter = 'D';
// // //     if (doctor.name.trim().isNotEmpty) {
// // //       firstLetter = doctor.name.trim()[0].toUpperCase();
// // //     }
    
// // //     return GestureDetector(
// // //       onTap: () => _showDoctorDetails(context, doctor),
// // //       child: Container(
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(16),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black12,
// // //               blurRadius: 8,
// // //               offset: Offset(0, 4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // Doctor Header with Avatar
// // //             Container(
// // //               padding: EdgeInsets.all(16),
// // //               child: Row(
// // //                 children: [
// // //                   // Avatar with consistent blue color
// // //                   Container(
// // //                     width: 50,
// // //                     height: 50,
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.blue[500],
// // //                       shape: BoxShape.circle,
// // //                     ),
// // //                     child: Center(
// // //                       child: Text(
// // //                         firstLetter,
// // //                         style: TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                           color: Colors.white,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   SizedBox(width: 12),
// // //                   Expanded(
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Text(
// // //                           doctor.name.isNotEmpty ? doctor.name : 'Unknown Doctor',
// // //                           style: TextStyle(
// // //                             fontSize: 15,
// // //                             fontWeight: FontWeight.bold,
// // //                             color: Colors.grey[800],
// // //                           ),
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                         ),
// // //                         SizedBox(height: 4),
// // //                         Text(
// // //                           doctor.specialty,
// // //                           style: TextStyle(
// // //                             fontSize: 12,
// // //                             color: Colors.blue[600],
// // //                             fontWeight: FontWeight.w500,
// // //                           ),
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
            
// // //             // Doctor Details
// // //             Padding(
// // //               padding: EdgeInsets.symmetric(horizontal: 16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   if (doctor.qualification != null && doctor.qualification!.isNotEmpty)
// // //                     Text(
// // //                       doctor.qualification!,
// // //                       style: TextStyle(
// // //                         fontSize: 11,
// // //                         color: Colors.grey[600],
// // //                         height: 1.3,
// // //                       ),
// // //                       maxLines: 2,
// // //                       overflow: TextOverflow.ellipsis,
// // //                     ),
// // //                   SizedBox(height: 8),
// // //                   Row(
// // //                     children: [
// // //                       Icon(Icons.local_hospital_rounded, size: 12, color: Colors.grey[500]),
// // //                       SizedBox(width: 4),
// // //                       Expanded(
// // //                         child: Text(
// // //                           doctor.hospitalName ?? 'Hospital',
// // //                           style: TextStyle(
// // //                             fontSize: 11,
// // //                             color: Colors.grey[600],
// // //                           ),
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
            
// // //             Spacer(),
            
// // //             // Book Button - Full width at bottom
// // //             Container(
// // //               width: double.infinity,
// // //               margin: EdgeInsets.all(16),
// // //               child: ElevatedButton(
// // //                 onPressed: () => _showBookingSheet(context, doctor),
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey[400],
// // //                   foregroundColor: Colors.white,
// // //                   padding: EdgeInsets.symmetric(vertical: 10),
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(10),
// // //                   ),
// // //                   elevation: 0,
// // //                 ),
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     Icon(Icons.calendar_today_rounded, size: 14),
// // //                     SizedBox(width: 6),
// // //                     Text(
// // //                       doctor.bookingOpen ? 'BOOK APPOINTMENT' : 'BOOKING CLOSED',
// // //                       style: TextStyle(
// // //                         fontSize: 11,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   void _showDoctorDetails(BuildContext context, Doctor doctor) {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       isScrollControlled: true,
// // //       backgroundColor: Colors.transparent,
// // //       builder: (context) {
// // //         return DoctorDetailsSheet(doctor: doctor, onBook: _showBookingSheet);
// // //       },
// // //     );
// // //   }

// // //   void _showBookingSheet(BuildContext context, Doctor doctor) {
// // //     if (!doctor.bookingOpen) {
// // //       _showNotification(context, 'Booking is currently closed for Dr. ${doctor.name}', Colors.orange);
// // //       return;
// // //     }

// // //     showModalBottomSheet(
// // //       context: context,
// // //       isScrollControlled: true,
// // //       backgroundColor: Colors.transparent,
// // //       builder: (context) {
// // //         return BookingForm(doctor: doctor, onBooking: _handleBooking);
// // //       },
// // //     );
// // //   }

// // //   Future<void> _handleBooking(
// // //     BuildContext context,
// // //     Doctor doctor,
// // //     String patientName,
// // //     String patientPhone,
// // //     String patientPlace,
// // //     DateTime? patientDob,
// // //     DateTime? appointmentDate,
// // //   ) async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     final storedUserId = prefs.getString('userId');

// // //     if (storedUserId == null) {
// // //       _showLoginDialog(context);
// // //       return;
// // //     }

// // //     if (patientName.isEmpty || patientPhone.isEmpty || patientPlace.isEmpty || 
// // //         patientDob == null || appointmentDate == null) {
// // //       _showNotification(context, 'Please fill all required fields', Colors.red);
// // //       return;
// // //     }

// // //     // Check if appointment date is in the past
// // //     final now = DateTime.now();
// // //     final selectedDate = DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day);
// // //     final currentDate = DateTime(now.year, now.month, now.day);
    
// // //     if (selectedDate.isBefore(currentDate)) {
// // //       _showNotification(context, 'Please select a future date for appointment', Colors.red);
// // //       return;
// // //     }

// // //     // Check if selected appointment day is available for the doctor
// // //     final selectedDay = _getDayName(appointmentDate.weekday);
// // //     final isDayAvailable = doctor.consulting.any((day) => 
// // //         day.day.toLowerCase() == selectedDay.toLowerCase() && day.sessions.isNotEmpty);

// // //     if (!isDayAvailable) {
// // //       _showNotification(context, 'Dr. ${doctor.name} is not available on $selectedDay. Please select an available day.', Colors.orange);
// // //       return;
// // //     }

// // //     final bookingData = {
// // //       'userId': storedUserId,
// // //       'specialty': doctor.specialty,
// // //       'doctor_name': doctor.name,
// // //       'booking_date': appointmentDate.toIso8601String(),
// // //       'patient_name': patientName,
// // //       'patient_phone': patientPhone,
// // //       'patient_place': patientPlace,
// // //       'patient_dob': patientDob.toIso8601String(),
// // //     };

// // //     try {
// // //       final response = await ApiService().createBooking(
// // //         doctor.hospitalId!,
// // //         bookingData,
// // //       );

// // //       if (response.data['success'] == 201) {
// // //             ScaffoldMessenger.of(context).showSnackBar(
// // //        const SnackBar(content: Text("Booking successful!")),
// // //   );
// // //         Navigator.pop(context); // Close booking form
// // //         _showSuccessNotification(context, 'Appointment booked successfully with Dr. ${doctor.name}!');
// // //       } else {
// // //         _showNotification(context, 'Booking failed: ${response.data['message']}', Colors.red);
// // //       }
// // //     } catch (e) {
// // //       _showNotification(context, 'Error booking appointment: $e', Colors.red);
// // //     }
// // //   }

// // //   String _getDayName(int weekday) {
// // //     switch (weekday) {
// // //       case 1: return 'Monday';
// // //       case 2: return 'Tuesday';
// // //       case 3: return 'Wednesday';
// // //       case 4: return 'Thursday';
// // //       case 5: return 'Friday';
// // //       case 6: return 'Saturday';
// // //       case 7: return 'Sunday';
// // //       default: return 'Unknown';
// // //     }
// // //   }

// // //   void _showNotification(BuildContext context, String message, Color backgroundColor) {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text(message),
// // //         backgroundColor: backgroundColor,
// // //         behavior: SnackBarBehavior.floating,
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(10),
// // //         ),
// // //         duration: Duration(seconds: 3),
// // //       ),
// // //     );
// // //   }

// // //   void _showSuccessNotification(BuildContext context, String message) {
// // //     // Show a more prominent success notification
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Row(
// // //           children: [
// // //             Icon(Icons.check_circle, color: Colors.white),
// // //             SizedBox(width: 12),
// // //             Expanded(
// // //               child: Text(
// // //                 message,
// // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         backgroundColor: Colors.green,
// // //         behavior: SnackBarBehavior.floating,
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(10),
// // //         ),
// // //         duration: Duration(seconds: 4),
// // //         elevation: 6,
// // //         margin: EdgeInsets.all(20),
// // //       ),
// // //     );
// // //   }

// // //   void _showLoginDialog(BuildContext context) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) => AlertDialog(
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //         title: Text('Sign In Required', style: TextStyle(fontWeight: FontWeight.bold)),
// // //         content: Text('Please sign in to book appointments and access all features.'),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.pop(context),
// // //             child: Text('Cancel', style: TextStyle(color: Colors.grey)),
// // //           ),
// // //           ElevatedButton(
// // //             onPressed: () {
// // //               Navigator.pop(context);
// // //               Navigator.pushNamed(context, '/login');
// // //             },
// // //             style: ElevatedButton.styleFrom(
// // //               backgroundColor: Colors.blue,
// // //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //             ),
// // //             child: Text('Sign In', style: TextStyle(color: Colors.white)),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // Modern Doctor Details Sheet
// // // class DoctorDetailsSheet extends StatelessWidget {
// // //   final Doctor doctor;
// // //   final Function(BuildContext, Doctor) onBook;

// // //   const DoctorDetailsSheet({super.key, required this.doctor, required this.onBook});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Get first letter or default to 'D' - Fixed to handle empty names
// // //     String firstLetter = 'D';
// // //     if (doctor.name.trim().isNotEmpty) {
// // //       firstLetter = doctor.name.trim()[0].toUpperCase();
// // //     }
    
// // //     return Container(
// // //       height: MediaQuery.of(context).size.height * 0.85,
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.only(
// // //           topLeft: Radius.circular(30),
// // //           topRight: Radius.circular(30),
// // //         ),
// // //       ),
// // //       child: Column(
// // //         children: [
// // //           // Header
// // //           Container(
// // //             padding: EdgeInsets.all(20),
// // //             decoration: BoxDecoration(
// // //               color: Colors.blue[50],
// // //               borderRadius: BorderRadius.only(
// // //                 topLeft: Radius.circular(30),
// // //                 topRight: Radius.circular(30),
// // //               ),
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Container(
// // //                   width: 70,
// // //                   height: 70,
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.blue[500],
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   child: Center(
// // //                     child: Text(
// // //                       firstLetter,
// // //                       style: TextStyle(
// // //                         fontSize: 24,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 16),
// // //                 Expanded(
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Text(
// // //                         doctor.name,
// // //                         style: TextStyle(
// // //                           fontSize: 20,
// // //                           fontWeight: FontWeight.bold,
// // //                           color: Colors.grey[800],
// // //                         ),
// // //                       ),
// // //                       SizedBox(height: 4),
// // //                       Text(
// // //                         doctor.specialty,
// // //                         style: TextStyle(
// // //                           fontSize: 16,
// // //                           color: Colors.blue[600],
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                       if (doctor.qualification != null)
// // //                         Text(
// // //                           doctor.qualification!,
// // //                           style: TextStyle(
// // //                             fontSize: 14,
// // //                             color: Colors.grey[600],
// // //                           ),
// // //                         ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 IconButton(
// // //                   onPressed: () => Navigator.pop(context),
// // //                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
          
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               padding: EdgeInsets.all(20),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   // Hospital Info
// // //                   _buildInfoCard(
// // //                     icon: Icons.local_hospital_rounded,
// // //                     title: doctor.hospitalName ?? 'Hospital',
// // //                     subtitle: doctor.hospitalAddress ?? 'Address not available',
// // //                     color: Colors.blue,
// // //                   ),
                  
// // //                   SizedBox(height: 20),
                  
// // //                   // Available Timings
// // //                   Text(
// // //                     'Available Days & Timings',
// // //                     style: TextStyle(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.grey[800],
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 12),
                  
// // //                   if (doctor.consulting.isNotEmpty)
// // //                     _buildTimingsList(doctor.consulting)
// // //                   else
// // //                     _buildNoTimings(),
                  
// // //                   SizedBox(height: 20),
                  
// // //                   // About Doctor
// // //                   Text(
// // //                     'About Doctor',
// // //                     style: TextStyle(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.grey[800],
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 8),
// // //                   Text(
// // //                     'Dr. ${doctor.name} is a specialized ${doctor.specialty.toLowerCase()} with extensive experience in patient care. '
// // //                     'Available for consultations as per the schedule above.',
// // //                     style: TextStyle(
// // //                       fontSize: 14,
// // //                       color: Colors.grey[600],
// // //                       height: 1.5,
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
          
// // //           // Action Buttons
// // //           Container(
// // //             padding: EdgeInsets.all(20),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               boxShadow: [
// // //                 BoxShadow(
// // //                   color: Colors.black12,
// // //                   blurRadius: 10,
// // //                   offset: Offset(0, -2),
// // //                 ),
// // //               ],
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: OutlinedButton(
// // //                     onPressed: () => Navigator.pop(context),
// // //                     style: OutlinedButton.styleFrom(
// // //                       padding: EdgeInsets.symmetric(vertical: 15),
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(15),
// // //                       ),
// // //                       side: BorderSide(color: Colors.grey[300]!),
// // //                     ),
// // //                     child: Text(
// // //                       'Close',
// // //                       style: TextStyle(
// // //                         color: Colors.grey[700],
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 12),
// // //                 Expanded(
// // //                   child: ElevatedButton(
// // //                     onPressed: () {
// // //                       Navigator.pop(context);
// // //                       onBook(context, doctor);
// // //                     },
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey,
// // //                       padding: EdgeInsets.symmetric(vertical: 15),
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(15),
// // //                       ),
// // //                     ),
// // //                     child: Row(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         Icon(Icons.calendar_today_rounded, size: 18, color: Colors.white),
// // //                         SizedBox(width: 8),
// // //                         Text(
// // //                           doctor.bookingOpen ? 'Book Now' : 'Closed',
// // //                           style: TextStyle(
// // //                             color: Colors.white,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, required Color color}) {
// // //     return Container(
// // //       width: double.infinity,
// // //       padding: EdgeInsets.all(16),
// // //       decoration: BoxDecoration(
// // //         color: color.withOpacity(0.1),
// // //         borderRadius: BorderRadius.circular(15),
// // //         border: Border.all(color: color.withOpacity(0.2)),
// // //       ),
// // //       child: Row(
// // //         children: [
// // //           Icon(icon, color: color, size: 24),
// // //           SizedBox(width: 12),
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   title,
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w600,
// // //                     color: Colors.grey[800],
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 4),
// // //                 Text(
// // //                   subtitle,
// // //                   style: TextStyle(
// // //                     fontSize: 14,
// // //                     color: Colors.grey[600],
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTimingsList(List<ConsultingDay> consultingDays) {
// // //     return Column(
// // //       children: consultingDays.map((day) {
// // //         return Container(
// // //           margin: EdgeInsets.only(bottom: 8),
// // //           decoration: BoxDecoration(
// // //             color: Colors.grey[50],
// // //             borderRadius: BorderRadius.circular(12),
// // //             border: Border.all(color: Colors.grey[200]!),
// // //           ),
// // //           child: ListTile(
// // //             leading: Container(
// // //               width: 40,
// // //               height: 40,
// // //               decoration: BoxDecoration(
// // //                 color: Colors.blue[100],
// // //                 shape: BoxShape.circle,
// // //               ),
// // //               child: Icon(Icons.calendar_today, color: Colors.blue, size: 20),
// // //             ),
// // //             title: Text(
// // //               day.day,
// // //               style: TextStyle(
// // //                 fontWeight: FontWeight.w500,
// // //                 color: Colors.grey[800],
// // //               ),
// // //             ),
// // //             subtitle: day.sessions.isNotEmpty
// // //                 ? Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: day.sessions.map((session) {
// // //                       return Text(
// // //                         '${session.startTime} - ${session.endTime}',
// // //                         style: TextStyle(
// // //                           color: Colors.green[600],
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       );
// // //                     }).toList(),
// // //                   )
// // //                 : Text(
// // //                     'Not Available',
// // //                     style: TextStyle(
// // //                       color: Colors.grey[500],
// // //                     ),
// // //                   ),
// // //           ),
// // //         );
// // //       }).toList(),
// // //     );
// // //   }

// // //   Widget _buildNoTimings() {
// // //     return Container(
// // //       padding: EdgeInsets.all(20),
// // //       decoration: BoxDecoration(
// // //         color: Colors.grey[50],
// // //         borderRadius: BorderRadius.circular(15),
// // //       ),
// // //       child: Column(
// // //         children: [
// // //           Icon(Icons.schedule_rounded, size: 40, color: Colors.grey[400]),
// // //           SizedBox(height: 8),
// // //           Text(
// // //             'No schedule available',
// // //             style: TextStyle(
// // //               color: Colors.grey[600],
// // //               fontWeight: FontWeight.w500,
// // //             ),
// // //           ),
// // //           Text(
// // //             'Please contact the hospital for schedule',
// // //             style: TextStyle(
// // //               color: Colors.grey[500],
// // //               fontSize: 12,
// // //             ),
// // //             textAlign: TextAlign.center,
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // Modern Booking Form
// // // class BookingForm extends StatefulWidget {
// // //   final Doctor doctor;
// // //   final Function(
// // //     BuildContext context,
// // //     Doctor doctor,
// // //     String patientName,
// // //     String patientPhone,
// // //     String patientPlace,
// // //     DateTime? patientDob,
// // //     DateTime? appointmentDate,
// // //   ) onBooking;

// // //   const BookingForm({super.key, required this.doctor, required this.onBooking});

// // //   @override
// // //   State<BookingForm> createState() => _BookingFormState();
// // // }

// // // class _BookingFormState extends State<BookingForm> {
// // //   final TextEditingController patientNameController = TextEditingController();
// // //   final TextEditingController phoneController = TextEditingController();
// // //   final TextEditingController placeController = TextEditingController();
// // //   DateTime? dob;
// // //   DateTime? appointmentDate;

// // //   // Get available days for the doctor
// // //   List<String> get availableDays {
// // //     return widget.doctor.consulting
// // //         .where((day) => day.sessions.isNotEmpty)
// // //         .map((day) => day.day)
// // //         .toList();
// // //   }

// // //   // Convert day name to weekday number
// // //   int _getWeekdayNumber(String dayName) {
// // //     switch (dayName.toLowerCase()) {
// // //       case 'monday': return 1;
// // //       case 'tuesday': return 2;
// // //       case 'wednesday': return 3;
// // //       case 'thursday': return 4;
// // //       case 'friday': return 5;
// // //       case 'saturday': return 6;
// // //       case 'sunday': return 7;
// // //       default: return 0;
// // //     }
// // //   }

// // //   // Check if a date should be enabled based on doctor's availability
// // //   bool _isDateEnabled(DateTime date) {
// // //     final dayName = _getDayName(date.weekday);
// // //     return availableDays.any((availableDay) => 
// // //         availableDay.toLowerCase() == dayName.toLowerCase());
// // //   }

// // //   String _getDayName(int weekday) {
// // //     switch (weekday) {
// // //       case 1: return 'Monday';
// // //       case 2: return 'Tuesday';
// // //       case 3: return 'Wednesday';
// // //       case 4: return 'Thursday';
// // //       case 5: return 'Friday';
// // //       case 6: return 'Saturday';
// // //       case 7: return 'Sunday';
// // //       default: return 'Unknown';
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Get first letter or default to 'D' - Fixed to handle empty names
// // //     String firstLetter = 'D';
// // //     if (widget.doctor.name.trim().isNotEmpty) {
// // //       firstLetter = widget.doctor.name.trim()[0].toUpperCase();
// // //     }
    
// // //     return Container(
// // //       height: MediaQuery.of(context).size.height * 0.85,
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.only(
// // //           topLeft: Radius.circular(30),
// // //           topRight: Radius.circular(30),
// // //         ),
// // //       ),
// // //       child: Column(
// // //         children: [
// // //           // Header
// // //           Container(
// // //             padding: EdgeInsets.all(20),
// // //             decoration: BoxDecoration(
// // //               color: Colors.blue[50],
// // //               borderRadius: BorderRadius.only(
// // //                 topLeft: Radius.circular(30),
// // //                 topRight: Radius.circular(30),
// // //               ),
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Container(
// // //                   width: 50,
// // //                   height: 50,
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.blue[500],
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   child: Center(
// // //                     child: Text(
// // //                       firstLetter,
// // //                       style: TextStyle(
// // //                         fontSize: 18,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 12),
// // //                 Expanded(
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Text(
// // //                         'Book Appointment',
// // //                         style: TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                           color: Colors.grey[800],
// // //                         ),
// // //                       ),
// // //                       Text(
// // //                         'Dr. ${widget.doctor.name}',
// // //                         style: TextStyle(
// // //                           fontSize: 14,
// // //                           color: Colors.grey[600],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 IconButton(
// // //                   onPressed: () => Navigator.pop(context),
// // //                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
          
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               padding: EdgeInsets.all(20),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   // Available Days & Timings Preview
// // //                   _buildTimingsPreview(),
                  
// // //                   SizedBox(height: 24),
                  
// // //                   // Patient Details Form
// // //                   Text(
// // //                     'Patient Information',
// // //                     style: TextStyle(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.grey[800],
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 16),
                  
// // //                   _buildInputField('Full Name', patientNameController, Icons.person_outline),
// // //                   SizedBox(height: 16),
// // //                   _buildInputField('Phone Number', phoneController, Icons.phone_android_outlined, keyboardType: TextInputType.phone),
// // //                   SizedBox(height: 16),
// // //                   _buildDateField('Date of Birth', dob, Icons.cake_outlined, (picked) => setState(() => dob = picked), isPastOnly: true),
// // //                   SizedBox(height: 16),
// // //                   _buildInputField('Place', placeController, Icons.location_on_outlined),
// // //                   SizedBox(height: 16),
// // //                   _buildDateField('Appointment Date', appointmentDate, Icons.calendar_today_outlined, (picked) => setState(() => appointmentDate = picked), isPastOnly: false),
                  
// // //                   // Available Days Info
// // //                   if (availableDays.isNotEmpty) ...[
// // //                     SizedBox(height: 16),
// // //                     Container(
// // //                       padding: EdgeInsets.all(12),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.blue[50],
// // //                         borderRadius: BorderRadius.circular(10),
// // //                         border: Border.all(color: Colors.blue[100]!),
// // //                       ),
// // //                       child: Row(
// // //                         children: [
// // //                           Icon(Icons.info_outline, color: Colors.blue[600], size: 16),
// // //                           SizedBox(width: 8),
// // //                           Expanded(
// // //                             child: Text(
// // //                               'Doctor is available on: ${availableDays.join(', ')}',
// // //                               style: TextStyle(
// // //                                 fontSize: 12,
// // //                                 color: Colors.blue[800],
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
          
// // //           // Book Button
// // //           Container(
// // //             padding: EdgeInsets.all(20),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               boxShadow: [
// // //                 BoxShadow(
// // //                   color: Colors.black12,
// // //                   blurRadius: 10,
// // //                   offset: Offset(0, -2),
// // //                 ),
// // //               ],
// // //             ),
// // //             child: SizedBox(
// // //               width: double.infinity,
// // //               child: ElevatedButton(
// // //                 onPressed: () => widget.onBooking(
// // //                   context,
// // //                   widget.doctor,
// // //                   patientNameController.text,
// // //                   phoneController.text,
// // //                   placeController.text,
// // //                   dob,
// // //                   appointmentDate,
// // //                 ),
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: Colors.green,
// // //                   padding: EdgeInsets.symmetric(vertical: 16),
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(15),
// // //                   ),
// // //                 ),
// // //                 child: Text(
// // //                   'CONFIRM BOOKING',
// // //                   style: TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTimingsPreview() {
// // //     final availableDays = widget.doctor.consulting.where((day) => day.sessions.isNotEmpty).toList();
    
// // //     return Container(
// // //       padding: EdgeInsets.all(16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.grey[50],
// // //         borderRadius: BorderRadius.circular(15),
// // //         border: Border.all(color: Colors.grey[200]!),
// // //       ),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Row(
// // //             children: [
// // //               Icon(Icons.schedule_rounded, color: Colors.blue, size: 20),
// // //               SizedBox(width: 8),
// // //               Text(
// // //                 'Available Days & Timings',
// // //                 style: TextStyle(
// // //                   fontSize: 16,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.grey[800],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           SizedBox(height: 12),
// // //           if (availableDays.isNotEmpty)
// // //             Column(
// // //               children: availableDays.take(3).map((day) {
// // //                 return Container(
// // //                   margin: EdgeInsets.only(bottom: 8),
// // //                   padding: EdgeInsets.all(12),
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     borderRadius: BorderRadius.circular(10),
// // //                     border: Border.all(color: Colors.grey[200]!),
// // //                   ),
// // //                   child: Row(
// // //                     children: [
// // //                       Container(
// // //                         width: 40,
// // //                         height: 40,
// // //                         decoration: BoxDecoration(
// // //                           color: Colors.blue[100],
// // //                           shape: BoxShape.circle,
// // //                         ),
// // //                         child: Icon(Icons.calendar_today, color: Colors.blue, size: 18),
// // //                       ),
// // //                       SizedBox(width: 12),
// // //                       Expanded(
// // //                         child: Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Text(
// // //                               day.day,
// // //                               style: TextStyle(
// // //                                 fontWeight: FontWeight.w500,
// // //                                 color: Colors.grey[800],
// // //                               ),
// // //                             ),
// // //                             if (day.sessions.isNotEmpty)
// // //                               ...day.sessions.map((session) {
// // //                                 return Text(
// // //                                   '${session.startTime} - ${session.endTime}',
// // //                                   style: TextStyle(
// // //                                     fontSize: 12,
// // //                                     color: Colors.green[600],
// // //                                     fontWeight: FontWeight.w500,
// // //                                   ),
// // //                                 );
// // //                               }).toList(),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 );
// // //               }).toList(),
// // //             )
// // //           else
// // //             Text(
// // //               'No available timings',
// // //               style: TextStyle(
// // //                 color: Colors.grey[500],
// // //                 fontStyle: FontStyle.italic,
// // //               ),
// // //             ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInputField(String label, TextEditingController controller, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
// // //     return TextField(
// // //       controller: controller,
// // //       keyboardType: keyboardType,
// // //       decoration: InputDecoration(
// // //         labelText: label,
// // //         prefixIcon: Icon(icon, color: Colors.grey[500]),
// // //         border: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(12),
// // //           borderSide: BorderSide(color: Colors.grey[300]!),
// // //         ),
// // //         enabledBorder: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(12),
// // //           borderSide: BorderSide(color: Colors.grey[300]!),
// // //         ),
// // //         focusedBorder: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(12),
// // //           borderSide: BorderSide(color: Colors.blue),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDateField(String label, DateTime? date, IconData icon, Function(DateTime) onPicked, {required bool isPastOnly}) {
// // //     return InkWell(
// // //       onTap: () async {
// // //         final now = DateTime.now();
// // //         final firstDate = isPastOnly ? DateTime(1900) : now;
// // //         final lastDate = isPastOnly ? now : DateTime(now.year + 1);
        
// // //         final picked = await showDatePicker(
// // //           context: context,
// // //           initialDate: date ?? now,
// // //           firstDate: firstDate,
// // //           lastDate: lastDate,
// // //           selectableDayPredicate: isPastOnly ? null : _isDateEnabled,
// // //         );
// // //         if (picked != null) onPicked(picked);
// // //       },
// // //       child: InputDecorator(
// // //         decoration: InputDecoration(
// // //           labelText: label,
// // //           prefixIcon: Icon(icon, color: Colors.grey[500]),
// // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
// // //           enabledBorder: OutlineInputBorder(
// // //             borderRadius: BorderRadius.circular(12),
// // //             borderSide: BorderSide(color: Colors.grey[300]!),
// // //           ),
// // //           focusedBorder: OutlineInputBorder(
// // //             borderRadius: BorderRadius.circular(12),
// // //             borderSide: BorderSide(color: Colors.blue),
// // //           ),
// // //         ),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             Text(
// // //               date == null ? "Select Date" : "${date.day}/${date.month}/${date.year}",
// // //               style: TextStyle(fontSize: 14, color: date == null ? Colors.grey[400] : Colors.grey[800]),
// // //             ),
// // //             Icon(Icons.arrow_drop_down_rounded, color: Colors.grey[500]),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'package:flutter/material.dart';
// // import 'package:hosta/common/top_snackbar.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../services/api_service.dart';
// // import '../models/doctor_model.dart';

// // class Doctors extends StatefulWidget {
// //   final String hospitalId;
// //   final String specialty;
  
// //   const Doctors({super.key, required this.hospitalId, required this.specialty});

// //   @override
// //   State<Doctors> createState() => _DoctorsState();
// // }

// // class _DoctorsState extends State<Doctors> {
// //   String searchQuery = '';
// //   List<Hospital> hospitals = [];
// //   bool isLoading = true;
// //   String? errorMessage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchDoctors();
// //   }

// //   Future<void> _fetchDoctors() async {
// //     try {
// //       final response = await ApiService().getDoctors(
// //         id: widget.hospitalId,
// //         specialty: widget.specialty,
// //       );

// //       print(response.data);
      
// //       if (response.data['success'] == true) {
// //         setState(() {
// //           hospitals = (response.data['hospitals'] as List)
// //               .map((hospitalJson) => Hospital.fromJson(hospitalJson))
// //               .toList();
// //           isLoading = false;
// //         });
// //       } else {
// //         setState(() {
// //           errorMessage = response.data['message'] ?? 'Failed to load doctors';
// //           isLoading = false;
// //         });
// //       }
// //     } catch (e) {
// //       setState(() {
// //         errorMessage = 'Error loading doctors: $e';
// //         isLoading = false;
// //       });
// //     }
// //   }

// //   List<Doctor> get allDoctors {
// //     List<Doctor> doctors = [];
// //     for (var hospital in hospitals) {
// //       doctors.addAll(hospital.doctors.map((doctor) => doctor.copyWith(
// //         hospitalName: hospital.name,
// //         hospitalAddress: hospital.address,
// //         hospitalPhone: hospital.phone,
// //         hospitalId: hospital.id,
// //       )));
// //     }
// //     return doctors;
// //   }

// //   List<Doctor> get filteredDoctors {
// //     if (searchQuery.isEmpty) return allDoctors;
    
// //     return allDoctors.where((doctor) {
// //       final name = doctor.name.toLowerCase();
// //       final specialty = doctor.specialty.toLowerCase();
// //       final hospitalName = doctor.hospitalName?.toLowerCase() ?? '';
      
// //       return name.contains(searchQuery.toLowerCase()) ||
// //           specialty.contains(searchQuery.toLowerCase()) ||
// //           hospitalName.contains(searchQuery.toLowerCase());
// //     }).toList();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFECFDF5),
// //       appBar: AppBar(
// //         backgroundColor: Colors.green,
// //         title: Text(
// //           "Doctors",
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //             fontSize: 20,
// //           ),
// //         ),
// //         centerTitle: true,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         elevation: 0,
// //       ),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             // Search
// //             _buildSearchBar(),
// //             // Content
// //             Expanded(child: _buildContent()),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSearchBar() {
// //     return Container(
// //       color: Colors.white,
// //       padding: EdgeInsets.all(20),
// //       child: Container(
// //         height: 50,
// //         decoration: BoxDecoration(
// //           color: Colors.grey[50],
// //           borderRadius: BorderRadius.circular(15),
// //           border: Border.all(color: Colors.grey[200]!),
// //         ),
// //         child: Row(
// //           children: [
// //             SizedBox(width: 16),
// //             Icon(Icons.search_rounded, color: Colors.grey[500], size: 20),
// //             SizedBox(width: 12),
// //             Expanded(
// //               child: TextField(
// //                 onChanged: (value) => setState(() => searchQuery = value),
// //                 decoration: InputDecoration(
// //                   hintText: 'Search doctors, specialties...',
// //                   hintStyle: TextStyle(color: Colors.grey[500]),
// //                   border: InputBorder.none,
// //                   contentPadding: EdgeInsets.zero,
// //                 ),
// //                 style: TextStyle(fontSize: 14),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildContent() {
// //     if (isLoading) {
// //       return Center(child: CircularProgressIndicator(color: Colors.blue));
// //     }

// //     if (errorMessage != null) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(Icons.error_outline, size: 60, color: Colors.grey[400]),
// //             SizedBox(height: 16),
// //             Text(
// //               errorMessage!,
// //               style: TextStyle(color: Colors.grey[600]),
// //               textAlign: TextAlign.center,
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _fetchDoctors,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.blue,
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
// //               ),
// //               child: Text('Try Again', style: TextStyle(color: Colors.white)),
// //             ),
// //           ],
// //         ),
// //       );
// //     }

// //     return Column(
// //       children: [
// //         // Results Count
// //         Container(
// //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// //           color: Colors.white,
// //           child: Row(
// //             children: [
// //               Text(
// //                 '${filteredDoctors.length} Doctors',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   color: Colors.grey[600],
// //                   fontWeight: FontWeight.w500,
// //                 ),
// //               ),
// //               Spacer(),
// //             ],
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         // Doctors Grid
// //         Expanded(
// //           child: filteredDoctors.isEmpty
// //               ? _buildEmptyState()
// //               : _buildDoctorsGrid(),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildEmptyState() {
// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(Icons.search_off_rounded, size: 80, color: Colors.grey[300]),
// //           SizedBox(height: 20),
// //           Text(
// //             'No doctors found',
// //             style: TextStyle(
// //               fontSize: 18,
// //               color: Colors.grey[600],
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //           SizedBox(height: 8),
// //           Text(
// //             'Try adjusting your search',
// //             style: TextStyle(
// //               fontSize: 14,
// //               color: Colors.grey[500],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorsGrid() {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(horizontal: 16),
// //       child: GridView.builder(
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           mainAxisSpacing: 16,
// //           crossAxisSpacing: 16,
// //           childAspectRatio: 0.85,
// //         ),
// //         itemCount: filteredDoctors.length,
// //         itemBuilder: (context, index) {
// //           final doctor = filteredDoctors[index];
// //           return _buildDoctorCard(doctor);
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorCard(Doctor doctor) {
// //     // Get first letter or default to 'D' - Fixed to handle empty names
// //     String firstLetter = 'D';
// //     if (doctor.name.trim().isNotEmpty) {
// //       firstLetter = doctor.name.trim()[0].toUpperCase();
// //     }
    
// //     return GestureDetector(
// //       onTap: () => _showDoctorDetails(context, doctor),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(16),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black12,
// //               blurRadius: 8,
// //               offset: Offset(0, 4),
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Doctor Header with Avatar
// //             Container(
// //               padding: EdgeInsets.all(16),
// //               child: Row(
// //                 children: [
// //                   // Avatar with consistent blue color
// //                   Container(
// //                     width: 50,
// //                     height: 50,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue[500],
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         firstLetter,
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 12),
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           doctor.name.isNotEmpty ? doctor.name : 'Unknown Doctor',
// //                           style: TextStyle(
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.grey[800],
// //                           ),
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                         SizedBox(height: 4),
// //                         Text(
// //                           doctor.specialty,
// //                           style: TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.blue[600],
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
            
// //             // Doctor Details
// //             Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   if (doctor.qualification != null && doctor.qualification!.isNotEmpty)
// //                     Text(
// //                       doctor.qualification!,
// //                       style: TextStyle(
// //                         fontSize: 11,
// //                         color: Colors.grey[600],
// //                         height: 1.3,
// //                       ),
// //                       maxLines: 2,
// //                       overflow: TextOverflow.ellipsis,
// //                     ),
// //                   SizedBox(height: 8),
// //                   Row(
// //                     children: [
// //                       Icon(Icons.local_hospital_rounded, size: 12, color: Colors.grey[500]),
// //                       SizedBox(width: 4),
// //                       Expanded(
// //                         child: Text(
// //                           doctor.hospitalName ?? 'Hospital',
// //                           style: TextStyle(
// //                             fontSize: 11,
// //                             color: Colors.grey[600],
// //                           ),
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
            
// //             Spacer(),
            
// //             // Book Button - Full width at bottom
// //             Container(
// //               width: double.infinity,
// //               margin: EdgeInsets.all(16),
// //               child: ElevatedButton(
// //                 onPressed: () => _showBookingSheet(context, doctor),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey[400],
// //                   foregroundColor: Colors.white,
// //                   padding: EdgeInsets.symmetric(vertical: 10),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   elevation: 0,
// //                 ),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Icon(Icons.calendar_today_rounded, size: 14),
// //                     SizedBox(width: 6),
// //                     Text(
// //                       doctor.bookingOpen ? 'BOOK APPOINTMENT' : 'BOOKING CLOSED',
// //                       style: TextStyle(
// //                         fontSize: 11,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _showDoctorDetails(BuildContext context, Doctor doctor) {
// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       builder: (context) {
// //         return DoctorDetailsSheet(doctor: doctor, onBook: _showBookingSheet);
// //       },
// //     );
// //   }

// //   void _showBookingSheet(BuildContext context, Doctor doctor) {
// //     if (!doctor.bookingOpen) {
// //       _showNotification(context, 'Booking is currently closed for Dr. ${doctor.name}', Colors.orange);
// //       return;
// //     }

// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       builder: (context) {
// //         return BookingForm(doctor: doctor, onBooking: _handleBooking);
// //       },
// //     );
// //   }

// //   Future<void> _handleBooking(
// //     BuildContext context,
// //     Doctor doctor,
// //     String patientName,
// //     String patientPhone,
// //     String patientPlace,
// //     DateTime? patientDob,
// //     DateTime? appointmentDate,
// //   ) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final storedUserId = prefs.getString('userId');

// //     if (storedUserId == null) {
// //       _showLoginDialog(context);
// //       return;
// //     }

// //     if (patientName.isEmpty || patientPhone.isEmpty || patientPlace.isEmpty || 
// //         patientDob == null || appointmentDate == null) {
// //       _showNotification(context, 'Please fill all required fields', Colors.red);
// //       return;
// //     }

// //     // Check if appointment date is in the past
// //     final now = DateTime.now();
// //     final selectedDate = DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day);
// //     final currentDate = DateTime(now.year, now.month, now.day);
    
// //     if (selectedDate.isBefore(currentDate)) {
// //       _showNotification(context, 'Please select a future date for appointment', Colors.red);
// //       return;
// //     }

// //     // Check if selected appointment day is available for the doctor
// //     final selectedDay = _getDayName(appointmentDate.weekday);
// //     final isDayAvailable = doctor.consulting.any((day) => 
// //         day.day.toLowerCase() == selectedDay.toLowerCase() && day.sessions.isNotEmpty);

// //     if (!isDayAvailable) {
// //       _showNotification(context, 'Dr. ${doctor.name} is not available on $selectedDay. Please select an available day.', Colors.orange);
// //       return;
// //     }

// //     final bookingData = {
// //       'userId': storedUserId,
// //       'specialty': doctor.specialty,
// //       'doctor_name': doctor.name,
// //       'booking_date': appointmentDate.toIso8601String(),
// //       'patient_name': patientName,
// //       'patient_phone': patientPhone,
// //       'patient_place': patientPlace,
// //       'patient_dob': patientDob.toIso8601String(),
// //     };

// //     try {
// //       final response = await ApiService().createBooking(
// //         doctor.hospitalId!,
// //         bookingData,
// //       );
// //   if (response.statusCode == 201 || response.data['status'] == 201) {
// //       // Show success notification at the top
    
// //        showTopSnackBar(context,  'Appointment booked successfully with Dr. ${doctor.name}!');
      
// //       // Close booking form
// //       Navigator.pop(context);
// //   }
// //        else {
// //         _showNotification(context, 'Booking failed: ${response.data['message']}', Colors.red);
// //       }
// //     } catch (e) {
// //       _showNotification(context, 'Error booking appointment: $e', Colors.red);
// //     }
// //   }

// //   String _getDayName(int weekday) {
// //     switch (weekday) {
// //       case 1: return 'Monday';
// //       case 2: return 'Tuesday';
// //       case 3: return 'Wednesday';
// //       case 4: return 'Thursday';
// //       case 5: return 'Friday';
// //       case 6: return 'Saturday';
// //       case 7: return 'Sunday';
// //       default: return 'Unknown';
// //     }
// //   }

// //   void _showNotification(BuildContext context, String message, Color backgroundColor) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(message),
// //         backgroundColor: backgroundColor,
// //         behavior: SnackBarBehavior.floating,
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         duration: Duration(seconds: 3),
// //       ),
// //     );
// //   }

// //   void _showSuccessNotification(BuildContext context, String message) {
// //     // Show a more prominent success notification
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Row(
// //           children: [
// //             Icon(Icons.check_circle, color: Colors.white),
// //             SizedBox(width: 12),
// //             Expanded(
// //               child: Text(
// //                 message,
// //                 style: TextStyle(fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //           ],
// //         ),
// //         backgroundColor: Colors.green,
// //         behavior: SnackBarBehavior.floating,
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         duration: Duration(seconds: 4),
// //         elevation: 6,
// //         margin: EdgeInsets.all(20),
// //       ),
// //     );
// //   }

// //   void _showLoginDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //         title: Text('Sign In Required', style: TextStyle(fontWeight: FontWeight.bold)),
// //         content: Text('Please sign in to book appointments and access all features.'),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: Text('Cancel', style: TextStyle(color: Colors.grey)),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //               Navigator.pushNamed(context, '/login');
// //             },
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.blue,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //             ),
// //             child: Text('Sign In', style: TextStyle(color: Colors.white)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // Modern Doctor Details Sheet
// // class DoctorDetailsSheet extends StatelessWidget {
// //   final Doctor doctor;
// //   final Function(BuildContext, Doctor) onBook;

// //   const DoctorDetailsSheet({super.key, required this.doctor, required this.onBook});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Get first letter or default to 'D' - Fixed to handle empty names
// //     String firstLetter = 'D';
// //     if (doctor.name.trim().isNotEmpty) {
// //       firstLetter = doctor.name.trim()[0].toUpperCase();
// //     }
    
// //     return Container(
// //       height: MediaQuery.of(context).size.height * 0.85,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.only(
// //           topLeft: Radius.circular(30),
// //           topRight: Radius.circular(30),
// //         ),
// //       ),
// //       child: Column(
// //         children: [
// //           // Header
// //           Container(
// //             padding: EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: Colors.blue[50],
// //               borderRadius: BorderRadius.only(
// //                 topLeft: Radius.circular(30),
// //                 topRight: Radius.circular(30),
// //               ),
// //             ),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   width: 70,
// //                   height: 70,
// //                   decoration: BoxDecoration(
// //                     color: Colors.blue[500],
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: Center(
// //                     child: Text(
// //                       firstLetter,
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 16),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         doctor.name,
// //                         style: TextStyle(
// //                           fontSize: 20,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.grey[800],
// //                         ),
// //                       ),
// //                       SizedBox(height: 4),
// //                       Text(
// //                         doctor.specialty,
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           color: Colors.blue[600],
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                       if (doctor.qualification != null)
// //                         Text(
// //                           doctor.qualification!,
// //                           style: TextStyle(
// //                             fontSize: 14,
// //                             color: Colors.grey[600],
// //                           ),
// //                         ),
// //                     ],
// //                   ),
// //                 ),
// //                 IconButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
// //                 ),
// //               ],
// //             ),
// //           ),
          
// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: EdgeInsets.all(20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Hospital Info
// //                   _buildInfoCard(
// //                     icon: Icons.local_hospital_rounded,
// //                     title: doctor.hospitalName ?? 'Hospital',
// //                     subtitle: doctor.hospitalAddress ?? 'Address not available',
// //                     color: Colors.blue,
// //                   ),
                  
// //                   SizedBox(height: 20),
                  
// //                   // Available Timings
// //                   Text(
// //                     'Available Days & Timings',
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.grey[800],
// //                     ),
// //                   ),
// //                   SizedBox(height: 12),
                  
// //                   if (doctor.consulting.isNotEmpty)
// //                     _buildTimingsList(doctor.consulting)
// //                   else
// //                     _buildNoTimings(),
                  
// //                   SizedBox(height: 20),
                  
// //                   // About Doctor
// //                   Text(
// //                     'About Doctor',
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.grey[800],
// //                     ),
// //                   ),
// //                   SizedBox(height: 8),
// //                   Text(
// //                     'Dr. ${doctor.name} is a specialized ${doctor.specialty.toLowerCase()} with extensive experience in patient care. '
// //                     'Available for consultations as per the schedule above.',
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.grey[600],
// //                       height: 1.5,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
          
// //           // Action Buttons
// //           Container(
// //             padding: EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black12,
// //                   blurRadius: 10,
// //                   offset: Offset(0, -2),
// //                 ),
// //               ],
// //             ),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: OutlinedButton(
// //                     onPressed: () => Navigator.pop(context),
// //                     style: OutlinedButton.styleFrom(
// //                       padding: EdgeInsets.symmetric(vertical: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                       side: BorderSide(color: Colors.grey[300]!),
// //                     ),
// //                     child: Text(
// //                       'Close',
// //                       style: TextStyle(
// //                         color: Colors.grey[700],
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 12),
// //                 Expanded(
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                       onBook(context, doctor);
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey,
// //                       padding: EdgeInsets.symmetric(vertical: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Icon(Icons.calendar_today_rounded, size: 18, color: Colors.white),
// //                         SizedBox(width: 8),
// //                         Text(
// //                           doctor.bookingOpen ? 'Book Now' : 'Closed',
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, required Color color}) {
// //     return Container(
// //       width: double.infinity,
// //       padding: EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(15),
// //         border: Border.all(color: color.withOpacity(0.2)),
// //       ),
// //       child: Row(
// //         children: [
// //           Icon(icon, color: color, size: 24),
// //           SizedBox(width: 12),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   title,
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.grey[800],
// //                   ),
// //                 ),
// //                 SizedBox(height: 4),
// //                 Text(
// //                   subtitle,
// //                   style: TextStyle(
// //                     fontSize: 14,
// //                     color: Colors.grey[600],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTimingsList(List<ConsultingDay> consultingDays) {
// //     return Column(
// //       children: consultingDays.map((day) {
// //         return Container(
// //           margin: EdgeInsets.only(bottom: 8),
// //           decoration: BoxDecoration(
// //             color: Colors.grey[50],
// //             borderRadius: BorderRadius.circular(12),
// //             border: Border.all(color: Colors.grey[200]!),
// //           ),
// //           child: ListTile(
// //             leading: Container(
// //               width: 40,
// //               height: 40,
// //               decoration: BoxDecoration(
// //                 color: Colors.blue[100],
// //                 shape: BoxShape.circle,
// //               ),
// //               child: Icon(Icons.calendar_today, color: Colors.blue, size: 20),
// //             ),
// //             title: Text(
// //               day.day,
// //               style: TextStyle(
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.grey[800],
// //               ),
// //             ),
// //             subtitle: day.sessions.isNotEmpty
// //                 ? Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: day.sessions.map((session) {
// //                       return Text(
// //                         '${session.startTime} - ${session.endTime}',
// //                         style: TextStyle(
// //                           color: Colors.green[600],
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       );
// //                     }).toList(),
// //                   )
// //                 : Text(
// //                     'Not Available',
// //                     style: TextStyle(
// //                       color: Colors.grey[500],
// //                     ),
// //                   ),
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }

// //   Widget _buildNoTimings() {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       decoration: BoxDecoration(
// //         color: Colors.grey[50],
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Column(
// //         children: [
// //           Icon(Icons.schedule_rounded, size: 40, color: Colors.grey[400]),
// //           SizedBox(height: 8),
// //           Text(
// //             'No schedule available',
// //             style: TextStyle(
// //               color: Colors.grey[600],
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //           Text(
// //             'Please contact the hospital for schedule',
// //             style: TextStyle(
// //               color: Colors.grey[500],
// //               fontSize: 12,
// //             ),
// //             textAlign: TextAlign.center,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // Modern Booking Form
// // class BookingForm extends StatefulWidget {
// //   final Doctor doctor;
// //   final Function(
// //     BuildContext context,
// //     Doctor doctor,
// //     String patientName,
// //     String patientPhone,
// //     String patientPlace,
// //     DateTime? patientDob,
// //     DateTime? appointmentDate,
// //   ) onBooking;

// //   const BookingForm({super.key, required this.doctor, required this.onBooking});

// //   @override
// //   State<BookingForm> createState() => _BookingFormState();
// // }

// // class _BookingFormState extends State<BookingForm> {
// //   final TextEditingController patientNameController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController placeController = TextEditingController();
// //   DateTime? dob;
// //   DateTime? appointmentDate;

// //   // Get available days for the doctor
// //   List<String> get availableDays {
// //     return widget.doctor.consulting
// //         .where((day) => day.sessions.isNotEmpty)
// //         .map((day) => day.day)
// //         .toList();
// //   }

// //   // Convert day name to weekday number
// //   int _getWeekdayNumber(String dayName) {
// //     switch (dayName.toLowerCase()) {
// //       case 'monday': return 1;
// //       case 'tuesday': return 2;
// //       case 'wednesday': return 3;
// //       case 'thursday': return 4;
// //       case 'friday': return 5;
// //       case 'saturday': return 6;
// //       case 'sunday': return 7;
// //       default: return 0;
// //     }
// //   }

// //   // Check if a date should be enabled based on doctor's availability
// //   bool _isDateEnabled(DateTime date) {
// //     final dayName = _getDayName(date.weekday);
// //     return availableDays.any((availableDay) => 
// //         availableDay.toLowerCase() == dayName.toLowerCase());
// //   }

// //   String _getDayName(int weekday) {
// //     switch (weekday) {
// //       case 1: return 'Monday';
// //       case 2: return 'Tuesday';
// //       case 3: return 'Wednesday';
// //       case 4: return 'Thursday';
// //       case 5: return 'Friday';
// //       case 6: return 'Saturday';
// //       case 7: return 'Sunday';
// //       default: return 'Unknown';
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // Get first letter or default to 'D' - Fixed to handle empty names
// //     String firstLetter = 'D';
// //     if (widget.doctor.name.trim().isNotEmpty) {
// //       firstLetter = widget.doctor.name.trim()[0].toUpperCase();
// //     }
    
// //     return Container(
// //       height: MediaQuery.of(context).size.height * 0.85,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.only(
// //           topLeft: Radius.circular(30),
// //           topRight: Radius.circular(30),
// //         ),
// //       ),
// //       child: Column(
// //         children: [
// //           // Header
// //           Container(
// //             padding: EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: Colors.blue[50],
// //               borderRadius: BorderRadius.only(
// //                 topLeft: Radius.circular(30),
// //                 topRight: Radius.circular(30),
// //               ),
// //             ),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   width: 50,
// //                   height: 50,
// //                   decoration: BoxDecoration(
// //                     color: Colors.blue[500],
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: Center(
// //                     child: Text(
// //                       firstLetter,
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 12),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Book Appointment',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.grey[800],
// //                         ),
// //                       ),
// //                       Text(
// //                         'Dr. ${widget.doctor.name}',
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 IconButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
// //                 ),
// //               ],
// //             ),
// //           ),
          
// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: EdgeInsets.all(20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Available Days & Timings Preview
// //                   _buildTimingsPreview(),
                  
// //                   SizedBox(height: 24),
                  
// //                   // Patient Details Form
// //                   Text(
// //                     'Patient Information',
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.grey[800],
// //                     ),
// //                   ),
// //                   SizedBox(height: 16),
                  
// //                   _buildInputField('Full Name', patientNameController, Icons.person_outline),
// //                   SizedBox(height: 16),
// //                   _buildInputField('Phone Number', phoneController, Icons.phone_android_outlined, keyboardType: TextInputType.phone),
// //                   SizedBox(height: 16),
// //                   _buildDateField('Date of Birth', dob, Icons.cake_outlined, (picked) => setState(() => dob = picked), isPastOnly: true),
// //                   SizedBox(height: 16),
// //                   _buildInputField('Place', placeController, Icons.location_on_outlined),
// //                   SizedBox(height: 16),
// //                   _buildDateField('Appointment Date', appointmentDate, Icons.calendar_today_outlined, (picked) => setState(() => appointmentDate = picked), isPastOnly: false),
                  
// //                   // Available Days Info
// //                   if (availableDays.isNotEmpty) ...[
// //                     SizedBox(height: 16),
// //                     Container(
// //                       padding: EdgeInsets.all(12),
// //                       decoration: BoxDecoration(
// //                         color: Colors.blue[50],
// //                         borderRadius: BorderRadius.circular(10),
// //                         border: Border.all(color: Colors.blue[100]!),
// //                       ),
// //                       child: Row(
// //                         children: [
// //                           Icon(Icons.info_outline, color: Colors.blue[600], size: 16),
// //                           SizedBox(width: 8),
// //                           Expanded(
// //                             child: Text(
// //                               'Doctor is available on: ${availableDays.join(', ')}',
// //                               style: TextStyle(
// //                                 fontSize: 12,
// //                                 color: Colors.blue[800],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ],
// //               ),
// //             ),
// //           ),
          
// //           // Book Button
// //           Container(
// //             padding: EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black12,
// //                   blurRadius: 10,
// //                   offset: Offset(0, -2),
// //                 ),
// //               ],
// //             ),
// //             child: SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 onPressed: () => widget.onBooking(
// //                   context,
// //                   widget.doctor,
// //                   patientNameController.text,
// //                   phoneController.text,
// //                   placeController.text,
// //                   dob,
// //                   appointmentDate,
// //                 ),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.green,
// //                   padding: EdgeInsets.symmetric(vertical: 16),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(15),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   'CONFIRM BOOKING',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTimingsPreview() {
// //     final availableDays = widget.doctor.consulting.where((day) => day.sessions.isNotEmpty).toList();
    
// //     return Container(
// //       padding: EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.grey[50],
// //         borderRadius: BorderRadius.circular(15),
// //         border: Border.all(color: Colors.grey[200]!),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Icon(Icons.schedule_rounded, color: Colors.blue, size: 20),
// //               SizedBox(width: 8),
// //               Text(
// //                 'Available Days & Timings',
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.grey[800],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           SizedBox(height: 12),
// //           if (availableDays.isNotEmpty)
// //             Column(
// //               children: availableDays.take(3).map((day) {
// //                 return Container(
// //                   margin: EdgeInsets.only(bottom: 8),
// //                   padding: EdgeInsets.all(12),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(10),
// //                     border: Border.all(color: Colors.grey[200]!),
// //                   ),
// //                   child: Row(
// //                     children: [
// //                       Container(
// //                         width: 40,
// //                         height: 40,
// //                         decoration: BoxDecoration(
// //                           color: Colors.blue[100],
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: Icon(Icons.calendar_today, color: Colors.blue, size: 18),
// //                       ),
// //                       SizedBox(width: 12),
// //                       Expanded(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               day.day,
// //                               style: TextStyle(
// //                                 fontWeight: FontWeight.w500,
// //                                 color: Colors.grey[800],
// //                               ),
// //                             ),
// //                             if (day.sessions.isNotEmpty)
// //                               ...day.sessions.map((session) {
// //                                 return Text(
// //                                   '${session.startTime} - ${session.endTime}',
// //                                   style: TextStyle(
// //                                     fontSize: 12,
// //                                     color: Colors.green[600],
// //                                     fontWeight: FontWeight.w500,
// //                                   ),
// //                                 );
// //                               }).toList(),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               }).toList(),
// //             )
// //           else
// //             Text(
// //               'No available timings',
// //               style: TextStyle(
// //                 color: Colors.grey[500],
// //                 fontStyle: FontStyle.italic,
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildInputField(String label, TextEditingController controller, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
// //     return TextField(
// //       controller: controller,
// //       keyboardType: keyboardType,
// //       decoration: InputDecoration(
// //         labelText: label,
// //         prefixIcon: Icon(icon, color: Colors.grey[500]),
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(12),
// //           borderSide: BorderSide(color: Colors.grey[300]!),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(12),
// //           borderSide: BorderSide(color: Colors.grey[300]!),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(12),
// //           borderSide: BorderSide(color: Colors.blue),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDateField(String label, DateTime? date, IconData icon, Function(DateTime) onPicked, {required bool isPastOnly}) {
// //     return InkWell(
// //       onTap: () async {
// //         final now = DateTime.now();
// //         final firstDate = isPastOnly ? DateTime(1900) : now;
// //         final lastDate = isPastOnly ? now : DateTime(now.year + 1);
        
// //         final picked = await showDatePicker(
// //           context: context,
// //           initialDate: date ?? now,
// //           firstDate: firstDate,
// //           lastDate: lastDate,
// //           selectableDayPredicate: isPastOnly ? null : _isDateEnabled,
// //         );
// //         if (picked != null) onPicked(picked);
// //       },
// //       child: InputDecorator(
// //         decoration: InputDecoration(
// //           labelText: label,
// //           prefixIcon: Icon(icon, color: Colors.grey[500]),
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
// //           enabledBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(12),
// //             borderSide: BorderSide(color: Colors.grey[300]!),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(12),
// //             borderSide: BorderSide(color: Colors.blue),
// //           ),
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(
// //               date == null ? "Select Date" : "${date.day}/${date.month}/${date.year}",
// //               style: TextStyle(fontSize: 14, color: date == null ? Colors.grey[400] : Colors.grey[800]),
// //             ),
// //             Icon(Icons.arrow_drop_down_rounded, color: Colors.grey[500]),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:hosta/common/top_snackbar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../services/api_service.dart';
// import '../models/doctor_model.dart';

// class Doctors extends StatefulWidget {
//   final String hospitalId;
//   final String specialty;
  
//   const Doctors({super.key, required this.hospitalId, required this.specialty});

//   @override
//   State<Doctors> createState() => _DoctorsState();
// }

// class _DoctorsState extends State<Doctors> {
//   String searchQuery = '';
//   List<Hospital> hospitals = [];
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _fetchDoctors();
//   }

//   Future<void> _fetchDoctors() async {
//     try {
//       final response = await ApiService().getDoctors(
//         id: widget.hospitalId,
//         specialty: widget.specialty,
//       );

//       print(response.data);
      
//       if (response.data['success'] == true) {
//         setState(() {
//           hospitals = (response.data['hospitals'] as List)
//               .map((hospitalJson) => Hospital.fromJson(hospitalJson))
//               .toList();
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = response.data['message'] ?? 'Failed to load doctors';
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Error loading doctors: $e';
//         isLoading = false;
//       });
//     }
//   }

//   List<Doctor> get allDoctors {
//     List<Doctor> doctors = [];
//     for (var hospital in hospitals) {
//       doctors.addAll(hospital.doctors.map((doctor) => doctor.copyWith(
//         hospitalName: hospital.name,
//         hospitalAddress: hospital.address,
//         hospitalPhone: hospital.phone,
//         hospitalId: hospital.id,
//       )));
//     }
//     return doctors;
//   }

//   List<Doctor> get filteredDoctors {
//     if (searchQuery.isEmpty) return allDoctors;
    
//     return allDoctors.where((doctor) {
//       final name = doctor.name.toLowerCase();
//       final specialty = doctor.specialty.toLowerCase();
//       final hospitalName = doctor.hospitalName?.toLowerCase() ?? '';
      
//       return name.contains(searchQuery.toLowerCase()) ||
//           specialty.contains(searchQuery.toLowerCase()) ||
//           hospitalName.contains(searchQuery.toLowerCase());
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFECFDF5),
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text(
//           "Doctors",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Search
//             _buildSearchBar(),
//             // Content
//             Expanded(child: _buildContent()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(20),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.grey[50],
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.grey[200]!),
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: 16),
//             Icon(Icons.search_rounded, color: Colors.grey[500], size: 20),
//             SizedBox(width: 12),
//             Expanded(
//               child: TextField(
//                 onChanged: (value) => setState(() => searchQuery = value),
//                 decoration: InputDecoration(
//                   hintText: 'Search doctors, specialties...',
//                   hintStyle: TextStyle(color: Colors.grey[500]),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     if (isLoading) {
//       return Center(child: CircularProgressIndicator(color: Colors.blue));
//     }

//     if (errorMessage != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.error_outline, size: 60, color: Colors.grey[400]),
//             SizedBox(height: 16),
//             Text(
//               errorMessage!,
//               style: TextStyle(color: Colors.grey[600]),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _fetchDoctors,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//               ),
//               child: Text('Try Again', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       );
//     }

//     return Column(
//       children: [
//         // Results Count
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           color: Colors.white,
//           child: Row(
//             children: [
//               Text(
//                 '${filteredDoctors.length} Doctors',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[600],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//         SizedBox(height: 8),
//         // Doctors Grid
//         Expanded(
//           child: filteredDoctors.isEmpty
//               ? _buildEmptyState()
//               : _buildDoctorsGrid(),
//         ),
//       ],
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.search_off_rounded, size: 80, color: Colors.grey[300]),
//           SizedBox(height: 20),
//           Text(
//             'No doctors found',
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.grey[600],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Try adjusting your search',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDoctorsGrid() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 16,
//           crossAxisSpacing: 16,
//           childAspectRatio: 0.82, // Reduced from 0.85 to prevent overflow
//         ),
//         itemCount: filteredDoctors.length,
//         itemBuilder: (context, index) {
//           final doctor = filteredDoctors[index];
//           return _buildDoctorCard(doctor);
//         },
//       ),
//     );
//   }

//   Widget _buildDoctorCard(Doctor doctor) {
//     // Get first letter or default to 'D' - Fixed to handle empty names
//     String firstLetter = 'D';
//     if (doctor.name.trim().isNotEmpty) {
//       firstLetter = doctor.name.trim()[0].toUpperCase();
//     }
    
//     return GestureDetector(
//       onTap: () => _showDoctorDetails(context, doctor),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 8,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Doctor Header with Avatar
//             Container(
//               padding: EdgeInsets.all(12), // Reduced padding
//               child: Row(
//                 children: [
//                   // Avatar with consistent blue color
//                   Container(
//                     width: 45, // Slightly smaller
//                     height: 45,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[500],
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: Text(
//                         firstLetter,
//                         style: TextStyle(
//                           fontSize: 16, // Smaller font
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10), // Reduced spacing
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           doctor.name.isNotEmpty ? doctor.name : 'Unknown Doctor',
//                           style: TextStyle(
//                             fontSize: 14, // Smaller font
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[800],
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         SizedBox(height: 3), // Reduced spacing
//                         Text(
//                           doctor.specialty,
//                           style: TextStyle(
//                             fontSize: 11, // Smaller font
//                             color: Colors.blue[600],
//                             fontWeight: FontWeight.w500,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             // Doctor Details
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12), // Reduced padding
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (doctor.qualification != null && doctor.qualification!.isNotEmpty)
//                     Text(
//                       doctor.qualification!,
//                       style: TextStyle(
//                         fontSize: 10, // Smaller font
//                         color: Colors.grey[600],
//                         height: 1.2, // Reduced line height
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   SizedBox(height: 6), // Reduced spacing
//                   Row(
//                     children: [
//                       Icon(Icons.local_hospital_rounded, size: 11, color: Colors.grey[500]), // Smaller icon
//                       SizedBox(width: 3), // Reduced spacing
//                       Expanded(
//                         child: Text(
//                           doctor.hospitalName ?? 'Hospital',
//                           style: TextStyle(
//                             fontSize: 10, // Smaller font
//                             color: Colors.grey[600],
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
//             Spacer(),
            
//             // Book Button - Full width at bottom
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.all(12), // Reduced margin
//               child: ElevatedButton(
//                 onPressed: () => _showBookingSheet(context, doctor),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey[400],
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(vertical: 8), // Reduced padding
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.calendar_today_rounded, size: 12), // Smaller icon
//                     SizedBox(width: 4), // Reduced spacing
//                     Text(
//                       doctor.bookingOpen ? 'BOOK' : 'CLOSED', // Shorter text
//                       style: TextStyle(
//                         fontSize: 10, // Smaller font
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showDoctorDetails(BuildContext context, Doctor doctor) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return DoctorDetailsSheet(doctor: doctor, onBook: _showBookingSheet);
//       },
//     );
//   }

//   void _showBookingSheet(BuildContext context, Doctor doctor) {
//     if (!doctor.bookingOpen) {
//       _showNotification(context, 'Booking is currently closed for Dr. ${doctor.name}', Colors.orange);
//       return;
//     }

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return BookingForm(doctor: doctor, onBooking: _handleBooking);
//       },
//     );
//   }

//   Future<void> _handleBooking(
//     BuildContext context,
//     Doctor doctor,
//     String patientName,
//     String patientPhone,
//     String patientPlace,
//     DateTime? patientDob,
//     DateTime? appointmentDate,
//   ) async {
//     final prefs = await SharedPreferences.getInstance();
//     final storedUserId = prefs.getString('userId');

//     if (storedUserId == null) {
//       _showLoginDialog(context);
//       return;
//     }

//     if (patientName.isEmpty || patientPhone.isEmpty || patientPlace.isEmpty || 
//         patientDob == null || appointmentDate == null) {
//       _showNotification(context, 'Please fill all required fields', Colors.red);
//       return;
//     }

//     // Check if appointment date is in the past
//     final now = DateTime.now();
//     final selectedDate = DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day);
//     final currentDate = DateTime(now.year, now.month, now.day);
    
//     if (selectedDate.isBefore(currentDate)) {
//       _showNotification(context, 'Please select a future date for appointment', Colors.red);
//       return;
//     }

//     // Check if selected appointment day is available for the doctor
//     final selectedDay = _getDayName(appointmentDate.weekday);
//     final isDayAvailable = doctor.consulting.any((day) => 
//         day.day.toLowerCase() == selectedDay.toLowerCase() && day.sessions.isNotEmpty);

//     if (!isDayAvailable) {
//       _showNotification(context, 'Dr. ${doctor.name} is not available on $selectedDay. Please select an available day.', Colors.orange);
//       return;
//     }

//     final bookingData = {
//       'userId': storedUserId,
//       'specialty': doctor.specialty,
//       'doctor_name': doctor.name,
//       'booking_date': appointmentDate.toIso8601String(),
//       'patient_name': patientName,
//       'patient_phone': patientPhone,
//       'patient_place': patientPlace,
//       'patient_dob': patientDob.toIso8601String(),
//     };

//     try {
//       final response = await ApiService().createBooking(
//         doctor.hospitalId!,
//         bookingData,
//       );
//       if (response.statusCode == 201 || response.data['status'] == 201) {
//         // Show success notification at the top
//         showTopSnackBar(context, 'Appointment booked successfully with Dr. ${doctor.name}!');
        
//         // Close booking form
//         Navigator.pop(context);
//       } else {
//         _showNotification(context, 'Booking failed: ${response.data['message']}', Colors.red);
//       }
//     } catch (e) {
//       _showNotification(context, 'Error booking appointment: $e', Colors.red);
//     }
//   }

//   String _getDayName(int weekday) {
//     switch (weekday) {
//       case 1: return 'Monday';
//       case 2: return 'Tuesday';
//       case 3: return 'Wednesday';
//       case 4: return 'Thursday';
//       case 5: return 'Friday';
//       case 6: return 'Saturday';
//       case 7: return 'Sunday';
//       default: return 'Unknown';
//     }
//   }

//   void _showNotification(BuildContext context, String message, Color backgroundColor) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: backgroundColor,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }

//   void _showSuccessNotification(BuildContext context, String message) {
//     // Show a more prominent success notification
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             Icon(Icons.check_circle, color: Colors.white),
//             SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 message,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.green,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         duration: Duration(seconds: 4),
//         elevation: 6,
//         margin: EdgeInsets.all(20),
//       ),
//     );
//   }

//   void _showLoginDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: Text('Sign In Required', style: TextStyle(fontWeight: FontWeight.bold)),
//         content: Text('Please sign in to book appointments and access all features.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel', style: TextStyle(color: Colors.grey)),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pushNamed(context, '/login');
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             child: Text('Sign In', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Modern Doctor Details Sheet
// class DoctorDetailsSheet extends StatelessWidget {
//   final Doctor doctor;
//   final Function(BuildContext, Doctor) onBook;

//   const DoctorDetailsSheet({super.key, required this.doctor, required this.onBook});

//   @override
//   Widget build(BuildContext context) {
//     // Get first letter or default to 'D' - Fixed to handle empty names
//     String firstLetter = 'D';
//     if (doctor.name.trim().isNotEmpty) {
//       firstLetter = doctor.name.trim()[0].toUpperCase();
//     }
    
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.85,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       child: Column(
//         children: [
//           // Header
//           Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 70,
//                   height: 70,
//                   decoration: BoxDecoration(
//                     color: Colors.blue[500],
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       firstLetter,
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         doctor.name,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         doctor.specialty,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.blue[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       if (doctor.qualification != null)
//                         Text(
//                           doctor.qualification!,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//           ),
          
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Hospital Info
//                   _buildInfoCard(
//                     icon: Icons.local_hospital_rounded,
//                     title: doctor.hospitalName ?? 'Hospital',
//                     subtitle: doctor.hospitalAddress ?? 'Address not available',
//                     color: Colors.blue,
//                   ),
                  
//                   SizedBox(height: 20),
                  
//                   // Available Timings
//                   Text(
//                     'Available Days & Timings',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                   SizedBox(height: 12),
                  
//                   if (doctor.consulting.isNotEmpty)
//                     _buildTimingsList(doctor.consulting)
//                   else
//                     _buildNoTimings(),
                  
//                   SizedBox(height: 20),
                  
//                   // About Doctor
//                   Text(
//                     'About Doctor',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Dr. ${doctor.name} is a specialized ${doctor.specialty.toLowerCase()} with extensive experience in patient care. '
//                     'Available for consultations as per the schedule above.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                       height: 1.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Action Buttons
//           Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 10,
//                   offset: Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: OutlinedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       side: BorderSide(color: Colors.grey[300]!),
//                     ),
//                     child: Text(
//                       'Close',
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       onBook(context, doctor);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey,
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.calendar_today_rounded, size: 18, color: Colors.white),
//                         SizedBox(width: 8),
//                         Text(
//                           doctor.bookingOpen ? 'Book Now' : 'Closed',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, required Color color}) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: color.withOpacity(0.2)),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: color, size: 24),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimingsList(List<ConsultingDay> consultingDays) {
//     return Column(
//       children: consultingDays.map((day) {
//         return Container(
//           margin: EdgeInsets.only(bottom: 8),
//           decoration: BoxDecoration(
//             color: Colors.grey[50],
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.grey[200]!),
//           ),
//           child: ListTile(
//             leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.blue[100],
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.calendar_today, color: Colors.blue, size: 20),
//             ),
//             title: Text(
//               day.day,
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[800],
//               ),
//             ),
//             subtitle: day.sessions.isNotEmpty
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: day.sessions.map((session) {
//                       return Text(
//                         '${session.startTime} - ${session.endTime}',
//                         style: TextStyle(
//                           color: Colors.green[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       );
//                     }).toList(),
//                   )
//                 : Text(
//                     'Not Available',
//                     style: TextStyle(
//                       color: Colors.grey[500],
//                     ),
//                   ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildNoTimings() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         children: [
//           Icon(Icons.schedule_rounded, size: 40, color: Colors.grey[400]),
//           SizedBox(height: 8),
//           Text(
//             'No schedule available',
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             'Please contact the hospital for schedule',
//             style: TextStyle(
//               color: Colors.grey[500],
//               fontSize: 12,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Modern Booking Form
// class BookingForm extends StatefulWidget {
//   final Doctor doctor;
//   final Function(
//     BuildContext context,
//     Doctor doctor,
//     String patientName,
//     String patientPhone,
//     String patientPlace,
//     DateTime? patientDob,
//     DateTime? appointmentDate,
//   ) onBooking;

//   const BookingForm({super.key, required this.doctor, required this.onBooking});

//   @override
//   State<BookingForm> createState() => _BookingFormState();
// }

// class _BookingFormState extends State<BookingForm> {
//   final TextEditingController patientNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController placeController = TextEditingController();
//   DateTime? dob;
//   DateTime? appointmentDate;

//   // Get available days for the doctor
//   List<String> get availableDays {
//     return widget.doctor.consulting
//         .where((day) => day.sessions.isNotEmpty)
//         .map((day) => day.day)
//         .toList();
//   }

//   // Convert day name to weekday number
//   int _getWeekdayNumber(String dayName) {
//     switch (dayName.toLowerCase()) {
//       case 'monday': return 1;
//       case 'tuesday': return 2;
//       case 'wednesday': return 3;
//       case 'thursday': return 4;
//       case 'friday': return 5;
//       case 'saturday': return 6;
//       case 'sunday': return 7;
//       default: return 0;
//     }
//   }

//   // Check if a date should be enabled based on doctor's availability
//   bool _isDateEnabled(DateTime date) {
//     final dayName = _getDayName(date.weekday);
//     return availableDays.any((availableDay) => 
//         availableDay.toLowerCase() == dayName.toLowerCase());
//   }

//   String _getDayName(int weekday) {
//     switch (weekday) {
//       case 1: return 'Monday';
//       case 2: return 'Tuesday';
//       case 3: return 'Wednesday';
//       case 4: return 'Thursday';
//       case 5: return 'Friday';
//       case 6: return 'Saturday';
//       case 7: return 'Sunday';
//       default: return 'Unknown';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get first letter or default to 'D' - Fixed to handle empty names
//     String firstLetter = 'D';
//     if (widget.doctor.name.trim().isNotEmpty) {
//       firstLetter = widget.doctor.name.trim()[0].toUpperCase();
//     }
    
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.85,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       child: Column(
//         children: [
//           // Header
//           Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.blue[500],
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       firstLetter,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Book Appointment',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                       Text(
//                         'Dr. ${widget.doctor.name}',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//           ),
          
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Available Days & Timings Preview
//                   _buildTimingsPreview(),
                  
//                   SizedBox(height: 24),
                  
//                   // Patient Details Form
//                   Text(
//                     'Patient Information',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                   SizedBox(height: 16),
                  
//                   _buildInputField('Full Name', patientNameController, Icons.person_outline),
//                   SizedBox(height: 16),
//                   _buildInputField('Phone Number', phoneController, Icons.phone_android_outlined, keyboardType: TextInputType.phone),
//                   SizedBox(height: 16),
//                   _buildDateField('Date of Birth', dob, Icons.cake_outlined, (picked) => setState(() => dob = picked), isPastOnly: true),
//                   SizedBox(height: 16),
//                   _buildInputField('Place', placeController, Icons.location_on_outlined),
//                   SizedBox(height: 16),
//                   _buildDateField('Appointment Date', appointmentDate, Icons.calendar_today_outlined, (picked) => setState(() => appointmentDate = picked), isPastOnly: false),
                  
//                   // Available Days Info
//                   if (availableDays.isNotEmpty) ...[
//                     SizedBox(height: 16),
//                     Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.blue[50],
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.blue[100]!),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(Icons.info_outline, color: Colors.blue[600], size: 16),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Doctor is available on: ${availableDays.join(', ')}',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.blue[800],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
          
//           // Book Button
//           Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 10,
//                   offset: Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () => widget.onBooking(
//                   context,
//                   widget.doctor,
//                   patientNameController.text,
//                   phoneController.text,
//                   placeController.text,
//                   dob,
//                   appointmentDate,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//                 child: Text(
//                   'CONFIRM BOOKING',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimingsPreview() {
//     final availableDays = widget.doctor.consulting.where((day) => day.sessions.isNotEmpty).toList();
    
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.grey[200]!),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.schedule_rounded, color: Colors.blue, size: 20),
//               SizedBox(width: 8),
//               Text(
//                 'Available Days & Timings',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           if (availableDays.isNotEmpty)
//             Column(
//               children: availableDays.take(3).map((day) {
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 8),
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey[200]!),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.blue[100],
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(Icons.calendar_today, color: Colors.blue, size: 18),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               day.day,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.grey[800],
//                               ),
//                             ),
//                             if (day.sessions.isNotEmpty)
//                               ...day.sessions.map((session) {
//                                 return Text(
//                                   '${session.startTime} - ${session.endTime}',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.green[600],
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 );
//                               }).toList(),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             )
//           else
//             Text(
//               'No available timings',
//               style: TextStyle(
//                 color: Colors.grey[500],
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInputField(String label, TextEditingController controller, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.grey[500]),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey[300]!),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey[300]!),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.blue),
//         ),
//       ),
//     );
//   }

//   Widget _buildDateField(String label, DateTime? date, IconData icon, Function(DateTime) onPicked, {required bool isPastOnly}) {
//     return InkWell(
//       onTap: () async {
//         final now = DateTime.now();
//         final firstDate = isPastOnly ? DateTime(1900) : now;
//         final lastDate = isPastOnly ? now : DateTime(now.year + 1);
        
//         final picked = await showDatePicker(
//           context: context,
//           initialDate: date ?? now,
//           firstDate: firstDate,
//           lastDate: lastDate,
//           selectableDayPredicate: isPastOnly ? null : _isDateEnabled,
//         );
//         if (picked != null) onPicked(picked);
//       },
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Colors.grey[500]),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.grey[300]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               date == null ? "Select Date" : "${date.day}/${date.month}/${date.year}",
//               style: TextStyle(fontSize: 14, color: date == null ? Colors.grey[400] : Colors.grey[800]),
//             ),
//             Icon(Icons.arrow_drop_down_rounded, color: Colors.grey[500]),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hosta/common/top_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../models/doctor_model.dart';

class Doctors extends StatefulWidget {
  final String hospitalId;
  final String specialty;
  
  const Doctors({super.key, required this.hospitalId, required this.specialty});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  String searchQuery = '';
  List<Hospital> hospitals = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    try {
      final response = await ApiService().getDoctors(
        id: widget.hospitalId,
        specialty: widget.specialty,
      );

      print(response.data);
      
      if (response.data['success'] == true) {
        setState(() {
          hospitals = (response.data['hospitals'] as List)
              .map((hospitalJson) => Hospital.fromJson(hospitalJson))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = response.data['message'] ?? 'Failed to load doctors';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error loading doctors: $e';
        isLoading = false;
      });
    }
  }

  List<Doctor> get allDoctors {
    List<Doctor> doctors = [];
    for (var hospital in hospitals) {
      doctors.addAll(hospital.doctors.map((doctor) => doctor.copyWith(
        hospitalName: hospital.name,
        hospitalAddress: hospital.address,
        hospitalPhone: hospital.phone,
        hospitalId: hospital.id,
      )));
    }
    return doctors;
  }

  List<Doctor> get filteredDoctors {
    if (searchQuery.isEmpty) return allDoctors;
    
    return allDoctors.where((doctor) {
      final name = doctor.name.toLowerCase();
      final specialty = doctor.specialty.toLowerCase();
      final hospitalName = doctor.hospitalName?.toLowerCase() ?? '';
      
      return name.contains(searchQuery.toLowerCase()) ||
          specialty.contains(searchQuery.toLowerCase()) ||
          hospitalName.contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECFDF5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Doctors",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search
            _buildSearchBar(),
            // Content
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            SizedBox(width: 16),
            Icon(Icons.search_rounded, color: Colors.grey[500], size: 20),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                onChanged: (value) => setState(() => searchQuery = value),
                decoration: InputDecoration(
                  hintText: 'Search doctors, specialties...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.blue));
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              errorMessage!,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchDoctors,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text('Try Again', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Results Count
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: Colors.white,
          child: Row(
            children: [
              Text(
                '${filteredDoctors.length} Doctors',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        SizedBox(height: 8),
        // Doctors Grid
        Expanded(
          child: filteredDoctors.isEmpty
              ? _buildEmptyState()
              : _buildDoctorsGrid(),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 80, color: Colors.grey[300]),
          SizedBox(height: 20),
          Text(
            'No doctors found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try adjusting your search',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.82, // Reduced from 0.85 to prevent overflow
        ),
        itemCount: filteredDoctors.length,
        itemBuilder: (context, index) {
          final doctor = filteredDoctors[index];
          return _buildDoctorCard(doctor);
        },
      ),
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    // Get first letter or default to 'D' - Fixed to handle empty names
    String firstLetter = 'D';
    if (doctor.name.trim().isNotEmpty) {
      firstLetter = doctor.name.trim()[0].toUpperCase();
    }
    
    return GestureDetector(
      onTap: () => _showDoctorDetails(context, doctor),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Header with Avatar
            Container(
              padding: EdgeInsets.all(12), // Reduced padding
              child: Row(
                children: [
                  // Avatar with consistent blue color
                  Container(
                    width: 45, // Slightly smaller
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        firstLetter,
                        style: TextStyle(
                          fontSize: 16, // Smaller font
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Reduced spacing
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name.isNotEmpty ? doctor.name : 'Unknown Doctor',
                          style: TextStyle(
                            fontSize: 14, // Smaller font
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3), // Reduced spacing
                        Text(
                          doctor.specialty,
                          style: TextStyle(
                            fontSize: 11, // Smaller font
                            color: Colors.blue[600],
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Doctor Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12), // Reduced padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (doctor.qualification != null && doctor.qualification!.isNotEmpty)
                    Text(
                      doctor.qualification!,
                      style: TextStyle(
                        fontSize: 10, // Smaller font
                        color: Colors.grey[600],
                        height: 1.2, // Reduced line height
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  SizedBox(height: 6), // Reduced spacing
                  Row(
                    children: [
                      Icon(Icons.local_hospital_rounded, size: 11, color: Colors.grey[500]), // Smaller icon
                      SizedBox(width: 3), // Reduced spacing
                      Expanded(
                        child: Text(
                          doctor.hospitalName ?? 'Hospital',
                          style: TextStyle(
                            fontSize: 10, // Smaller font
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            Spacer(),
            
            // Book Button - Full width at bottom
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(12), // Reduced margin
              child: ElevatedButton(
                onPressed: () => _showBookingSheet(context, doctor),
                style: ElevatedButton.styleFrom(
                  backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey[400],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 8), // Reduced padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today_rounded, size: 12), // Smaller icon
                    SizedBox(width: 4), // Reduced spacing
                    Text(
                      doctor.bookingOpen ? 'BOOK' : 'CLOSED', // Shorter text
                      style: TextStyle(
                        fontSize: 10, // Smaller font
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDoctorDetails(BuildContext context, Doctor doctor) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DoctorDetailsSheet(doctor: doctor, onBook: _showBookingSheet);
      },
    );
  }

  void _showBookingSheet(BuildContext context, Doctor doctor) {
    if (!doctor.bookingOpen) {
      _showNotification(context, 'Booking is currently closed for Dr. ${doctor.name}', Colors.orange);
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BookingForm(doctor: doctor, onBooking: _handleBooking);
      },
    );
  }

  Future<void> _handleBooking(
    BuildContext context,
    Doctor doctor,
    String patientName,
    String patientPhone,
    String patientPlace,
    DateTime? patientDob,
    DateTime? appointmentDate,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUserId = prefs.getString('userId');

    if (storedUserId == null) {
      _showLoginDialog(context);
      return;
    }

    if (patientName.isEmpty || patientPhone.isEmpty || patientPlace.isEmpty || 
        patientDob == null || appointmentDate == null) {
      _showNotification(context, 'Please fill all required fields', Colors.red);
      return;
    }

    // Check if appointment date is in the past
    final now = DateTime.now();
    final selectedDate = DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day);
    final currentDate = DateTime(now.year, now.month, now.day);
    
    if (selectedDate.isBefore(currentDate)) {
      _showNotification(context, 'Please select a future date for appointment', Colors.red);
      return;
    }

    // Check if selected appointment day is available for the doctor
    final selectedDay = _getDayName(appointmentDate.weekday);
    final isDayAvailable = doctor.consulting.any((day) => 
        day.day.toLowerCase() == selectedDay.toLowerCase() && day.sessions.isNotEmpty);

    if (!isDayAvailable) {
      _showNotification(context, 'Dr. ${doctor.name} is not available on $selectedDay. Please select an available day.', Colors.orange);
      return;
    }

    final bookingData = {
      'userId': storedUserId,
      'specialty': doctor.specialty,
      'doctor_name': doctor.name,
      'booking_date': appointmentDate.toIso8601String(),
      'patient_name': patientName,
      'patient_phone': patientPhone,
      'patient_place': patientPlace,
      'patient_dob': patientDob.toIso8601String(),
    };

    try {
      final response = await ApiService().createBooking(
        doctor.hospitalId!,
        bookingData,
      );
      if (response.statusCode == 201 || response.data['status'] == 201) {
        // Show success notification at the top
        showTopSnackBar(context, 'Appointment booked successfully with Dr. ${doctor.name}!');
        
        // Close booking form
        Navigator.pop(context);
      } else {
        _showNotification(context, 'Booking failed: ${response.data['message']}', Colors.red);
      }
    } catch (e) {
      _showNotification(context, 'Error booking appointment: $e', Colors.red);
    }
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'Monday';
      case 2: return 'Tuesday';
      case 3: return 'Wednesday';
      case 4: return 'Thursday';
      case 5: return 'Friday';
      case 6: return 'Saturday';
      case 7: return 'Sunday';
      default: return 'Unknown';
    }
  }

  void _showNotification(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessNotification(BuildContext context, String message) {
    // Show a more prominent success notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 4),
        elevation: 6,
        margin: EdgeInsets.all(20),
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Sign In Required', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('Please sign in to book appointments and access all features.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('Sign In', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// Modern Doctor Details Sheet
class DoctorDetailsSheet extends StatelessWidget {
  final Doctor doctor;
  final Function(BuildContext, Doctor) onBook;

  const DoctorDetailsSheet({super.key, required this.doctor, required this.onBook});

  @override
  Widget build(BuildContext context) {
    // Get first letter or default to 'D' - Fixed to handle empty names
    String firstLetter = 'D';
    if (doctor.name.trim().isNotEmpty) {
      firstLetter = doctor.name.trim()[0].toUpperCase();
    }
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      firstLetter,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        doctor.specialty,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (doctor.qualification != null)
                        Text(
                          doctor.qualification!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hospital Info
                  _buildInfoCard(
                    icon: Icons.local_hospital_rounded,
                    title: doctor.hospitalName ?? 'Hospital',
                    subtitle: doctor.hospitalAddress ?? 'Address not available',
                    color: Colors.blue,
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Available Timings
                  Text(
                    'Available Days & Timings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 12),
                  
                  if (doctor.consulting.isNotEmpty)
                    _buildTimingsList(doctor.consulting)
                  else
                    _buildNoTimings(),
                  
                  SizedBox(height: 20),
                  
                  // About Doctor
                  Text(
                    'About Doctor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dr. ${doctor.name} is a specialized ${doctor.specialty.toLowerCase()} with extensive experience in patient care. '
                    'Available for consultations as per the schedule above.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Action Buttons
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onBook(context, doctor);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: doctor.bookingOpen ? Colors.green : Colors.grey,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today_rounded, size: 18, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          doctor.bookingOpen ? 'Book Now' : 'Closed',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, required Color color}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimingsList(List<ConsultingDay> consultingDays) {
    return Column(
      children: consultingDays.map((day) {
        return Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.calendar_today, color: Colors.blue, size: 20),
            ),
            title: Text(
              day.day,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
            subtitle: day.sessions.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: day.sessions.map((session) {
                      return Text(
                        '${session.startTime} - ${session.endTime}',
                        style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }).toList(),
                  )
                : Text(
                    'Not Available',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNoTimings() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(Icons.schedule_rounded, size: 40, color: Colors.grey[400]),
          SizedBox(height: 8),
          Text(
            'No schedule available',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Please contact the hospital for schedule',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Modern Booking Form
class BookingForm extends StatefulWidget {
  final Doctor doctor;
  final Function(
    BuildContext context,
    Doctor doctor,
    String patientName,
    String patientPhone,
    String patientPlace,
    DateTime? patientDob,
    DateTime? appointmentDate,
  ) onBooking;

  const BookingForm({super.key, required this.doctor, required this.onBooking});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  DateTime? dob;
  DateTime? appointmentDate;

  // Get available days for the doctor
  List<String> get availableDays {
    return widget.doctor.consulting
        .where((day) => day.sessions.isNotEmpty)
        .map((day) => day.day)
        .toList();
  }

  // Convert day name to weekday number
  int _getWeekdayNumber(String dayName) {
    switch (dayName.toLowerCase()) {
      case 'monday': return 1;
      case 'tuesday': return 2;
      case 'wednesday': return 3;
      case 'thursday': return 4;
      case 'friday': return 5;
      case 'saturday': return 6;
      case 'sunday': return 7;
      default: return 0;
    }
  }

  // Check if a date should be enabled based on doctor's availability
  bool _isDateEnabled(DateTime date) {
    if (availableDays.isEmpty) return true; // If no available days, allow all dates
    
    final dayName = _getDayName(date.weekday);
    return availableDays.any((availableDay) => 
        availableDay.toLowerCase() == dayName.toLowerCase());
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'Monday';
      case 2: return 'Tuesday';
      case 3: return 'Wednesday';
      case 4: return 'Thursday';
      case 5: return 'Friday';
      case 6: return 'Saturday';
      case 7: return 'Sunday';
      default: return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get first letter or default to 'D' - Fixed to handle empty names
    String firstLetter = 'D';
    if (widget.doctor.name.trim().isNotEmpty) {
      firstLetter = widget.doctor.name.trim()[0].toUpperCase();
    }
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      firstLetter,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Appointment',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        'Dr. ${widget.doctor.name}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Available Days & Timings Preview
                  _buildTimingsPreview(),
                  
                  SizedBox(height: 24),
                  
                  // Patient Details Form
                  Text(
                    'Patient Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  _buildInputField('Full Name', patientNameController, Icons.person_outline),
                  SizedBox(height: 16),
                  _buildInputField('Phone Number', phoneController, Icons.phone_android_outlined, keyboardType: TextInputType.phone),
                  SizedBox(height: 16),
                  _buildDateField('Date of Birth', dob, Icons.cake_outlined, (picked) => setState(() => dob = picked), isPastOnly: true),
                  SizedBox(height: 16),
                  _buildInputField('Place', placeController, Icons.location_on_outlined),
                  SizedBox(height: 16),
                  _buildDateField('Appointment Date', appointmentDate, Icons.calendar_today_outlined, (picked) => setState(() => appointmentDate = picked), isPastOnly: false),
                  
                  // Available Days Info
                  if (availableDays.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue[100]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue[600], size: 16),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Doctor is available on: ${availableDays.join(', ')}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          
          // Book Button
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => widget.onBooking(
                  context,
                  widget.doctor,
                  patientNameController.text,
                  phoneController.text,
                  placeController.text,
                  dob,
                  appointmentDate,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'CONFIRM BOOKING',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimingsPreview() {
    final availableDays = widget.doctor.consulting.where((day) => day.sessions.isNotEmpty).toList();
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.schedule_rounded, color: Colors.blue, size: 20),
              SizedBox(width: 8),
              Text(
                'Available Days & Timings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          if (availableDays.isNotEmpty)
            Column(
              children: availableDays.take(3).map((day) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.calendar_today, color: Colors.blue, size: 18),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              day.day,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                            if (day.sessions.isNotEmpty)
                              ...day.sessions.map((session) {
                                return Text(
                                  '${session.startTime} - ${session.endTime}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          else
            Text(
              'No available timings',
              style: TextStyle(
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, IconData icon, Function(DateTime) onPicked, {required bool isPastOnly}) {
    return InkWell(
      onTap: () async {
        final now = DateTime.now();
        final firstDate = isPastOnly ? DateTime(1900) : now;
        final lastDate = isPastOnly ? now : DateTime(now.year + 1);
        
        final picked = await showDatePicker(
          context: context,
          initialDate: date ?? now,
          firstDate: firstDate,
          lastDate: lastDate,
          selectableDayPredicate: isPastOnly ? null : _isDateEnabled,
        );
        if (picked != null) {
          setState(() => onPicked(picked));
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.grey[500]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date == null ? "Select Date" : "${date.day}/${date.month}/${date.year}",
              style: TextStyle(fontSize: 14, color: date == null ? Colors.grey[400] : Colors.grey[800]),
            ),
            Icon(Icons.arrow_drop_down_rounded, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }
}