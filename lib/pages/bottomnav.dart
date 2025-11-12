import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:hosta/common/top_snackbar.dart';
import 'package:hosta/components/about.dart';
import 'package:hosta/components/contact.dart';
import 'package:hosta/components/privacy.dart';
import 'package:hosta/components/profile.dart';
import 'package:hosta/pages/auth/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'home.dart';
import 'booking.dart';
import 'notifications.dart';
import '../services/api_service.dart'; 

class Bottomnav extends ConsumerStatefulWidget {
  const Bottomnav({super.key});

  @override
  ConsumerState<Bottomnav> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<Bottomnav> {
  int currentTabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int notificationCount = 0;
  Map<String, dynamic> userData = {};
  bool isLoadingUser = true;
  String? userId;
  IO.Socket? socket;
  OverlayEntry? _overlayEntry;

  // Use keys to manage page state
  final List<GlobalKey> _pageKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _initializePages();
    _loadUserId();
    _checkBadgeSupport();
  }

  void _initializePages() {
    pages = [
      const Home(),
      Booking(key: _pageKeys[1]), 
      const Notifications(),
    ];
  }

  // Method to completely reset all pages
  void _resetAllPages() {
    if (mounted) {
      setState(() {
        _pageKeys[0] = GlobalKey();
        _pageKeys[1] = GlobalKey();
        _pageKeys[2] = GlobalKey();
        
        pages = [
          const Home(),
          Booking(key: _pageKeys[1]), 
          const Notifications(),
        ];
        
        // Reset to home page
        currentTabIndex = 0;
      });
    }
  }

  Future<void> _checkBadgeSupport() async {
    try {
      await FlutterAppBadger.isAppBadgeSupported();
    } catch (e) {
      print("❌ Error checking badge support: $e");
    }
  }

  // Update external app icon badge
  Future<void> _updateAppIconBadge() async {
    try {
      if (notificationCount > 0) {
        await FlutterAppBadger.updateBadgeCount(notificationCount);
      } else {
        await FlutterAppBadger.removeBadge();
      }
    } catch (e) {
      print("❌ Error updating app icon badge: $e");
    }
  }

  // Load user ID from shared preferences
  Future<void> _loadUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      
      if (mounted) {
        setState(() {
          userId = storedUserId;
        });
      }
      
      if (userId != null && userId!.isNotEmpty) {
        await _loadUserData();
        await _loadNotificationCountFromStorage();
        _setupSocketListener(); // Setup socket after user ID is loaded
      } else {
        setState(() => isLoadingUser = false);
      }
      
    } catch (e) {
      print("❌ Error loading user ID: $e");
      setState(() => isLoadingUser = false);
    }
  }

  // Load notification count from local storage when app starts
  Future<void> _loadNotificationCountFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCount = prefs.getInt('notification_count') ?? 0;
      if (mounted) {
        setState(() {
          notificationCount = savedCount;
        });
        _updateAppIconBadge(); // Update external badge on startup
      }
            
      // Then load fresh data from API
      await _loadNotificationCountFromAPI();
    } catch (e) {
      print("❌ Error loading notification count from storage: $e");
      await _loadNotificationCountFromAPI();
    }
  }

  // Save notification count to local storage
  Future<void> _saveNotificationCountToStorage(int count) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('notification_count', count);
    } catch (e) {
      print("❌ Error saving notification count to storage: $e");
    }
  }

  Future<void> _loadUserData() async {
    if (userId == null || userId!.isEmpty) {
      setState(() => isLoadingUser = false);
      return;
    }

    try {
      setState(() => isLoadingUser = true);
      final response = await ApiService().getAUser(userId!);
      
      if (mounted) {
        setState(() {
          userData = response.data['data'] ?? {};
        });
      }
    } catch (e) {
      print("❌ Error loading user data: $e");
showTopSnackBar(context, "Error loading user data", isError: true);


    } finally {
      if (mounted) {
        setState(() => isLoadingUser = false);
      }
    }
  }

  Future<void> _loadNotificationCountFromAPI() async {
    if (userId == null || userId!.isEmpty) {
      return;
    }

    try {
      final response = await ApiService().getAllNotificationUnRead(userId!);
      
      List<dynamic> notifications = [];
      
      if (response.data is List) {
        notifications = response.data as List<dynamic>;
      } else if (response.data?['notifications'] is List) {
        notifications = response.data!['notifications'] as List<dynamic>;
      } else if (response.data?['data'] is List) {
        notifications = response.data!['data'] as List<dynamic>;
      }
            
      // Count unread notifications
      final unreadCount = notifications.where((notification) {
        final userIsRead = notification['userIsRead'] ?? true;
        final isRead = notification['isRead'] ?? true;
        
        // Check both possible field names
        return userIsRead == false || isRead == false;
      }).length;
            
      if (mounted) {
        setState(() {
          notificationCount = unreadCount;
        });
        await _saveNotificationCountToStorage(unreadCount);
        _updateAppIconBadge(); // Update external badge
      }
    } catch (e) {
      showTopSnackBar(context, "Error loading notifications", isError: true);
      // Set to 0 on error
      if (mounted) {
        setState(() {
          notificationCount = 0;
        });
        _updateAppIconBadge(); // Update external badge
      }
    }
  }

  void _setupSocketListener() {
    try {
      // Replace with your backend URL
      const String serverUrl = 'https://hostaserver.onrender.com';
      
      socket = IO.io(serverUrl, <String, dynamic>{
        'transports': ['websocket', 'polling'],
        'autoConnect': true,
      });

      socket!.on('connect', (_) {
        print("Connected to server");
      });

      socket!.on('disconnect', (_) {
        print("Disconnected from server");
      });

      socket!.on('error', (error) {
        print('⚠️ Socket error: $error');
      });

      // Listen for push notifications
      socket!.on('pushNotificationPhone', (data) {
        // Check if the notification is for this user
        final notificationUserId = data['userId']?.toString();
        final message = data['message']?.toString() ?? 'New notification';
        
        if (notificationUserId == userId) {
          // Auto-refetch notifications from API
          _refetchNotifications();
          
          // Show top push notification
          _showTopPushNotification(message);
        } else {
          print('🚫 This notification is for another user');
        }
      });

      socket!.connect();

    } catch (e) {
      print('❌ Error setting up socket: $e');
    }
  }

  // Auto-refetch notifications when new one comes
  Future<void> _refetchNotifications() async {
    try {
      await _loadNotificationCountFromAPI();
    } catch (e) {
      print("❌ Error refetching notifications: $e");
    }
  }

  void _incrementNotificationCount() {
    if (mounted) {
      setState(() {
        notificationCount++;
        _saveNotificationCountToStorage(notificationCount);
      });
      _updateAppIconBadge(); 
    }
  }



  // Show push notification at the very top (like mobile push notification)
  void _showTopPushNotification(String message) {
    // Remove existing overlay if any
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "New Notification",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 18),
                  onPressed: _removeOverlay,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insert overlay
    Overlay.of(context).insert(_overlayEntry!);

    // Auto remove after 5 seconds
    Future.delayed(const Duration(seconds: 5), _removeOverlay);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  void _markNotificationsAsRead() {
    if (mounted) {
      setState(() {
        notificationCount = 0;
        _saveNotificationCountToStorage(0);
      });
      _updateAppIconBadge();       
    }
  }

  @override
  void dispose() {
    // Remove overlay and disconnect socket when widget is disposed
    _removeOverlay();
    socket?.disconnect();
    socket?.close();
    super.dispose();
  }

  // Simple Sidebar with only required items
  Widget _buildRightSidebar() {
    final isLoggedIn = userId != null && userId!.isNotEmpty;
    
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.green.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade200,
                    child: _buildProfileImage(),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isLoggedIn 
                      ? (isLoadingUser ? "Loading..." : userData['name'] ?? "User")
                      : "Guest User",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isLoggedIn
                      ? (isLoadingUser ? "loading..." : userData['email'] ?? "user@example.com")
                      : "Please login to access profile",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 10),

            // Only Required Menu Items
            Expanded(
              child: ListView(
                children: [
                  if (isLoggedIn) ...[
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: "View Profile",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Profile()),
                        );
                      },
                    ),
                  ],
                  _buildMenuItem(
                    icon: Icons.info_outline,
                    title: "About",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const About()),
                      );
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.contact_phone,
                    title: "Contact",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Contact()),
                      );
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy & Policy",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Privacy()),
                      );
                    },
                  ),
                  
                  const Divider(),
                  
                  if (isLoggedIn)
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: "Logout",
                      color: Colors.red,
                      onTap: _showLogoutConfirmation,
                    )
                  else
                    _buildMenuItem(
                      icon: Icons.login,
                      title: "Login",
                      color: Colors.green,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signin()),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    final isLoggedIn = userId != null && userId!.isNotEmpty;
    
    if (!isLoggedIn) {
      return const Icon(Icons.person, size: 60, color: Colors.grey);
    }
    
    if (isLoadingUser) {
      return const Icon(Icons.person, size: 60, color: Colors.grey);
    }
    
    final profileImage = userData['profileImage']?.toString();
    if (profileImage != null && profileImage.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          profileImage,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Icon(Icons.person, size: 60, color: Colors.grey);
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person, size: 60, color: Colors.grey);
          },
        ),
      );
    }
    
    return const Icon(Icons.person, size: 60, color: Colors.grey);
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.green,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout? All data will be cleared."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                // Close dialog first
                Navigator.pop(context);
                // Then close sidebar
                Navigator.pop(context);
                // Perform logout
                await _performLogout();
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performLogout() async {
    try {
      // Clear user data from shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId');
      await prefs.remove('userPhone');
      
      // Clear notification count
      await _saveNotificationCountToStorage(0);
      
      // Clear external badge
      await _updateAppIconBadge();
      
      // Disconnect socket
      socket?.disconnect();
      socket?.close();
      
      // Clear local state
      if (mounted) {
        setState(() {
          userId = null;
          userData = {};
          notificationCount = 0;
          isLoadingUser = false;
        });
      }
      
      // RESET ALL PAGES - This is the key fix
      _resetAllPages();
            
      // Show success message
          showTopSnackBar(context, "Logged out seccessfully!");

      
    } catch (e) {
      print("❌ Error during logout: $e");
    }
  }

  // Badge widget for notifications - Clean version
  Widget _buildNotificationWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.notifications_outlined, color: Colors.white, size: 30.0),
        if (notificationCount > 0)
          Positioned(
            right: -5,
            top: -5,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                notificationCount > 99 ? '99+' : notificationCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Debug print
    print("🎯 Current notification count: $notificationCount");
    print("👤 User ID: $userId");
    print("📱 Current tab index: $currentTabIndex");
    
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildRightSidebar(),
      body: IndexedStack(
        index: currentTabIndex,
        children: pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: const Color(0xFFECFDF5),
        color: const Color(0xFF28A745),
        animationDuration: const Duration(milliseconds: 400),
        items: [
          const Icon(Icons.home_outlined, color: Colors.white, size: 30.0),
          const Icon(Icons.calendar_today_outlined, color: Colors.white, size: 30.0),
          // Notification icon WITH badge inside the app
          _buildNotificationWithBadge(),
          const Icon(Icons.person, color: Colors.white, size: 30.0),
        ],
        onTap: (index) {
          print("🔄 Tab changed to: $index");
          if (index == 3) {
            // When person icon is clicked → open sidebar
            _scaffoldKey.currentState?.openEndDrawer();
          } else {
            setState(() {
              currentTabIndex = index;
              
              // If navigating to notifications, mark as read
              if (index == 2) {
                print("📢 Marking notifications as read");
                _markNotificationsAsRead();
              }
            });
          }
        },
      ),
    );
  }
}

