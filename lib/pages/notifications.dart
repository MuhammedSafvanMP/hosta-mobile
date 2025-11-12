// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../services/api_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Notifications extends StatefulWidget {
//   const Notifications({super.key});

//   @override
//   State<Notifications> createState() => _NotificationsState();
// }

// class _NotificationsState extends State<Notifications> {
//   List<Map<String, dynamic>> notifications = [];
//   bool isLoading = true;
//   String? userId; // Make userId nullable
//   String selectedDate = "";
//   bool showUnread = false;
//   bool showRead = false;
  

//   @override
//   void initState() {
//     super.initState();
//     _loadUserIdAndFetchNotifications();
//   }

//   // Load user ID first, then fetch notifications
//   Future<void> _loadUserIdAndFetchNotifications() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final storedUserId = prefs.getString('userId');
      
//       if (mounted) {
//         setState(() {
//           userId = storedUserId;
//         });
//       }
      
//       if (userId != null && userId!.isNotEmpty) {
//         await _fetchNotifications();
//       } else {
//         if (mounted) {
//           setState(() => isLoading = false);
//         }
        
//       }
//     } catch (e) {
//       print("❌ Error loading user ID: $e");
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   Future<void> _fetchNotifications() async {
//     if (userId == null || userId!.isEmpty) {
//       setState(() => isLoading = false);
//       return;
//     }

//     setState(() => isLoading = true);
//     try {
//       final unreadResp = await ApiService().getAllNotificationUnRead(userId!);
//       final readResp = await ApiService().getAllNotificationRead(userId!);

//       // Handle different response structures
//       List<dynamic> unreadList = [];
//       List<dynamic> readList = [];

//       if (unreadResp.data is List) {
//         unreadList = unreadResp.data;
//       } else if (unreadResp.data?['notifications'] is List) {
//         unreadList = unreadResp.data!['notifications'];
//       }

//       if (readResp.data is List) {
//         readList = readResp.data;
//       } else if (readResp.data?['notifications'] is List) {
//         readList = readResp.data!['notifications'];
//       }

//       final unread = List<Map<String, dynamic>>.from(unreadList)
//           .map((n) => {...n, "read": false})
//           .toList();

//       final read = List<Map<String, dynamic>>.from(readList)
//           .map((n) => {...n, "read": true})
//           .toList();

//       // Merge notifications
//       notifications = [...unread, ...read];

//       // Sort by createdAt descending
//       notifications.sort((a, b) => DateTime.parse(b["createdAt"])
//           .compareTo(DateTime.parse(a["createdAt"])));

//       // Default filter: today
//       selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      
//     } catch (e) {
//       print("❌ Error fetching notifications: $e");
//       notifications = [];
//     } finally {
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   Future<void> _markNotificationRead(String id) async {
//     try {
//       await ApiService().aReadNotification(id);
//       if (mounted) {
//         setState(() {
//           final index = notifications.indexWhere((n) => n["_id"] == id);
//           if (index != -1) notifications[index]["read"] = true;
//         });
//       }
//     } catch (e) {
//       print("❌ Error marking notification read: $e");
//     }
//   }

//   Future<void> _markAllRead() async {
//     if (userId == null || userId!.isEmpty) return;
    
//     try {
//       await ApiService().allReadNotifications(userId!);
//       if (mounted) {
//         setState(() {
//           for (var n in notifications) {
//             n["read"] = true;
//           }
//         });
//       }
//     } catch (e) {
//       print("❌ Error marking all notifications read: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show message if no user ID
//     if (userId == null || userId!.isEmpty) {
//       return Scaffold(
//       backgroundColor: const Color(0xFFECFDF5),

//         appBar: AppBar(
//              backgroundColor: Colors.green,
//           title: const Text("Notifications",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),

//           ),
          
//         ),
//         body: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.person_off, size: 60, color: Colors.grey),
//               SizedBox(height: 16),
//               Text(
//                 "Please login to view notifications",
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

//     // Apply filters
//     final filteredList = notifications.where((n) {
//       bool matchesRead = (!showUnread && !showRead) ||
//           (showUnread && !n["read"]) ||
//           (showRead && n["read"]);

//       bool matchesDate = selectedDate.isEmpty ||
//           DateFormat('yyyy-MM-dd').format(DateTime.parse(n["createdAt"])) ==
//               selectedDate;

//       return matchesRead && matchesDate;
//     }).toList();

//     final unreadCount = notifications.where((n) => !n["read"]).length;
//     final readCount = notifications.where((n) => n["read"]).length;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//          backgroundColor: Colors.green,
//         title: const Text("Notifications",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), ),
//         actions: [
//           if (notifications.isNotEmpty && unreadCount > 0)
//             TextButton(
//               onPressed: _markAllRead,
//               child: const Text(
//                 "Mark All Read",
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//         ],
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 // ===== Filters: Unread / Read =====
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _filterChip(
//                         label: "Unread ($unreadCount)",
//                         selected: showUnread,
//                         onTap: () {
//                           setState(() {
//                             showUnread = !showUnread;
//                             showRead = false;
//                           });
//                         },
//                       ),
//                       _filterChip(
//                         label: "Read ($readCount)",
//                         selected: showRead,
//                         onTap: () {
//                           setState(() {
//                             showRead = !showRead;
//                             showUnread = false;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 // ===== Date Filter + Clear =====
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton.icon(
//                         onPressed: () async {
//                           DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: selectedDate.isEmpty
//                                 ? DateTime.now()
//                                 : DateTime.parse(selectedDate),
//                             firstDate: DateTime(2020),
//                             lastDate: DateTime(2100),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedDate =
//                                   DateFormat('yyyy-MM-dd').format(picked);
//                             });
//                           }
//                         },
//                         icon: const Icon(Icons.date_range, color: Colors.blue),
//                         label: Text(
//                           selectedDate.isEmpty ? "Filter by Date" : selectedDate,
//                           style: const TextStyle(
//                               color: Colors.blue, fontSize: 14),
//                         ),
//                       ),
//                       TextButton.icon(
//                         onPressed: () {
//                           setState(() {
//                             selectedDate = "";
//                             showRead = false;
//                             showUnread = false;
//                           });
//                         },
//                         icon: const Icon(Icons.clear_all, color: Colors.redAccent),
//                         label: const Text(
//                           "Clear Filters",
//                           style: TextStyle(color: Colors.redAccent, fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const Divider(height: 1),

//                 // ===== Notification List =====
//                 Expanded(
//                   child: filteredList.isEmpty
//                       ? const Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.notifications_none, 
//                                   size: 60, color: Colors.grey),
//                               SizedBox(height: 16),
//                               Text(
//                                 "No notifications found",
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         )
//                       : ListView.builder(
//                           itemCount: filteredList.length,
//                           itemBuilder: (context, index) {
//                             final n = filteredList[index];
//                             return Card(
//                               margin: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 4),
//                               elevation: 1,
//                               child: ListTile(
//                                 leading: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: n["read"] 
//                                         ? Colors.grey.shade300 
//                                         : Colors.blue.shade100,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     n["read"]
//                                         ? Icons.notifications_none
//                                         : Icons.notifications_active,
//                                     color: n["read"] 
//                                         ? Colors.grey 
//                                         : Colors.blueAccent,
//                                   ),
//                                 ),
//                                 title: Text(
//                                   n["message"] ?? "No message",
//                                   style: TextStyle(
//                                     fontWeight: n["read"]
//                                         ? FontWeight.normal
//                                         : FontWeight.bold,
//                                     color: n["read"] 
//                                         ? Colors.grey.shade700 
//                                         : Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Text(
//                                   DateFormat('hh:mm a, dd MMM yyyy').format(
//                                       DateTime.parse(n["createdAt"])),
//                                   style: TextStyle(
//                                     color: Colors.grey.shade600,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 trailing: n["read"]
//                                     ? null
//                                     : const Icon(Icons.circle, 
//                                         color: Colors.red, size: 10),
//                                 onTap: () {
//                                   if (!n["read"]) {
//                                     _markNotificationRead(n["_id"]);
//                                   }
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                 ),
//               ],
//             ),
//     );
//   }

//   // ===== Filter Chip =====
//   Widget _filterChip({
//     required String label,
//     required bool selected,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: selected ? Colors.blue : Colors.grey[200],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: selected ? Colors.white : Colors.black87,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, dynamic>> notifications = [];
  bool isLoading = true;
  String? userId; // Make userId nullable
  String selectedDate = "";
  bool showUnread = false;
  bool showRead = false;
  

  @override
  void initState() {
    super.initState();
    _loadUserIdAndFetchNotifications();
  }

  // Load user ID first, then fetch notifications
  Future<void> _loadUserIdAndFetchNotifications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      
      if (mounted) {
        setState(() {
          userId = storedUserId;
        });
      }
      
      if (userId != null && userId!.isNotEmpty) {
        await _fetchNotifications();
      } else {
        if (mounted) {
          setState(() => isLoading = false);
        }
        
      }
    } catch (e) {
      print("❌ Error loading user ID: $e");
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _fetchNotifications() async {
    if (userId == null || userId!.isEmpty) {
      setState(() => isLoading = false);
      return;
    }

    setState(() => isLoading = true);
    try {
      final unreadResp = await ApiService().getAllNotificationUnRead(userId!);
      final readResp = await ApiService().getAllNotificationRead(userId!);

      // Handle different response structures
      List<dynamic> unreadList = [];
      List<dynamic> readList = [];

      if (unreadResp.data is List) {
        unreadList = unreadResp.data;
      } else if (unreadResp.data?['notifications'] is List) {
        unreadList = unreadResp.data!['notifications'];
      }

      if (readResp.data is List) {
        readList = readResp.data;
      } else if (readResp.data?['notifications'] is List) {
        readList = readResp.data!['notifications'];
      }

      final unread = List<Map<String, dynamic>>.from(unreadList)
          .map((n) => {...n, "read": false})
          .toList();

      final read = List<Map<String, dynamic>>.from(readList)
          .map((n) => {...n, "read": true})
          .toList();

      // Merge notifications
      notifications = [...unread, ...read];

      // Sort by createdAt descending
      notifications.sort((a, b) => DateTime.parse(b["createdAt"])
          .compareTo(DateTime.parse(a["createdAt"])));

      // Default filter: today
      selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      
    } catch (e) {
      print("❌ Error fetching notifications: $e");
      notifications = [];
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _markNotificationRead(String id) async {
    try {
      await ApiService().aReadNotification(id);
      if (mounted) {
        setState(() {
          final index = notifications.indexWhere((n) => n["_id"] == id);
          if (index != -1) notifications[index]["read"] = true;
        });
      }
    } catch (e) {
      print("❌ Error marking notification read: $e");
    }
  }

  Future<void> _markAllRead() async {
    if (userId == null || userId!.isEmpty) return;
    
    try {
      await ApiService().allReadNotifications(userId!);
      if (mounted) {
        setState(() {
          for (var n in notifications) {
            n["read"] = true;
          }
        });
      }
    } catch (e) {
      print("❌ Error marking all notifications read: $e");
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
            "Notifications",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white,
            ),
          ),
          centerTitle: true, // Force center title
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_off, size: 60, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                "Please login to view notifications",
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

    // Apply filters
    final filteredList = notifications.where((n) {
      bool matchesRead = (!showUnread && !showRead) ||
          (showUnread && !n["read"]) ||
          (showRead && n["read"]);

      bool matchesDate = selectedDate.isEmpty ||
          DateFormat('yyyy-MM-dd').format(DateTime.parse(n["createdAt"])) ==
              selectedDate;

      return matchesRead && matchesDate;
    }).toList();

    final unreadCount = notifications.where((n) => !n["read"]).length;
    final readCount = notifications.where((n) => n["read"]).length;

    return Scaffold(
      backgroundColor: const Color(0xFFECFDF5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Force center title for both platforms
        actions: [
          if (notifications.isNotEmpty && unreadCount > 0)
            TextButton(
              onPressed: _markAllRead,
              child: const Text(
                "Mark All Read",
                style: TextStyle(color: Colors.white),
              ),
            )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ===== Filters: Unread / Read =====
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _filterChip(
                        label: "Unread ($unreadCount)",
                        selected: showUnread,
                        onTap: () {
                          setState(() {
                            showUnread = !showUnread;
                            showRead = false;
                          });
                        },
                      ),
                      _filterChip(
                        label: "Read ($readCount)",
                        selected: showRead,
                        onTap: () {
                          setState(() {
                            showRead = !showRead;
                            showUnread = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // ===== Date Filter + Clear =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate.isEmpty
                                ? DateTime.now()
                                : DateTime.parse(selectedDate),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) {
                            setState(() {
                              selectedDate =
                                  DateFormat('yyyy-MM-dd').format(picked);
                            });
                          }
                        },
                        icon: const Icon(Icons.date_range, color: Colors.blue),
                        label: Text(
                          selectedDate.isEmpty ? "Filter by Date" : selectedDate,
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 14),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedDate = "";
                            showRead = false;
                            showUnread = false;
                          });
                        },
                        icon: const Icon(Icons.clear_all, color: Colors.redAccent),
                        label: const Text(
                          "Clear Filters",
                          style: TextStyle(color: Colors.redAccent, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 1),

                // ===== Notification List =====
                Expanded(
                  child: filteredList.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.notifications_none, 
                                  size: 60, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                "No notifications found",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final n = filteredList[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              elevation: 1,
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: n["read"] 
                                        ? Colors.grey.shade300 
                                        : Colors.blue.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    n["read"]
                                        ? Icons.notifications_none
                                        : Icons.notifications_active,
                                    color: n["read"] 
                                        ? Colors.grey 
                                        : Colors.blueAccent,
                                  ),
                                ),
                                title: Text(
                                  n["message"] ?? "No message",
                                  style: TextStyle(
                                    fontWeight: n["read"]
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                    color: n["read"] 
                                        ? Colors.grey.shade700 
                                        : Colors.black87,
                                  ),
                                ),
                                subtitle: Text(
                                  DateFormat('hh:mm a, dd MMM yyyy').format(
                                      DateTime.parse(n["createdAt"])),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: n["read"]
                                    ? null
                                    : const Icon(Icons.circle, 
                                        color: Colors.red, size: 10),
                                onTap: () {
                                  if (!n["read"]) {
                                    _markNotificationRead(n["_id"]);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  // ===== Filter Chip =====
  Widget _filterChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}