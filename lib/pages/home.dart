import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../components/hospitaltypes.dart';
import '../components/ambulance.dart';
import '../components/blood.dart';
import '../components/specialties.dart';
import '../components/doctors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> products = [
    {"name": "Hospitals", "icon": Icons.local_hospital, "page": const HospitalTypes()},
    {"name": "Doctors", "icon": Icons.medical_services_outlined, "page": const Doctors( hospitalId: "",
          specialty: "",
          )},
    {"name": "Specialties", "icon": Icons.category_outlined, "page": const Specialties()},
    {"name": "Ambulance", "icon": Icons.local_taxi_outlined, "page": const Ambulance()},
    {"name": "Blood", "icon": Icons.bloodtype_outlined, "page": const Blood()},
  ];

  List<String> carouselImages = [];
  bool isLoading = true;
  Position? _currentPosition;
  bool _locationDenied = false;

  @override
  void initState() {
    super.initState();
    _checkLocationAndFetchAds();
  }

  Future<void> _checkLocationAndFetchAds() async {
    setState(() => isLoading = true);

    try {
      // Check if location service is enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // If location services are disabled, fetch ads without location
        await _fetchCarouselImages();
        return;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        // Check if we've already asked for permission before
        final prefs = await SharedPreferences.getInstance();
        bool hasAskedBefore = prefs.getBool('location_permission_asked') ?? false;
        
        if (!hasAskedBefore) {
          // First time - ask for permission
          await prefs.setBool('location_permission_asked', true);
          permission = await Geolocator.requestPermission();
          
          if (permission == LocationPermission.denied) {
            // User denied first time - fetch without location
            setState(() => _locationDenied = true);
            await _fetchCarouselImages();
            return;
          }
        } else {
          // Already asked before and denied - fetch without location
          setState(() => _locationDenied = true);
          await _fetchCarouselImages();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // User permanently denied - fetch without location
        setState(() => _locationDenied = true);
        await _fetchCarouselImages();
        return;
      }

      // We have permission - get location and fetch ads
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      setState(() {
        _currentPosition = position;
      });

      // Fetch carousel images with location
      await _fetchCarouselImages(
        latitude: position.latitude,
        longitude: position.longitude,
      );

    } catch (e) {
      print("Error in location process: $e");
      // If any error occurs, fetch ads without location
      await _fetchCarouselImages();
    }
  }

  Future<void> _fetchCarouselImages({double? latitude, double? longitude}) async {
    try {
      final response = await ApiService().getAllCarousel(
        latitude: latitude,
        longitude: longitude,
      );

      final data = response.data["data"] as List;
      setState(() {
        carouselImages = data
            .where((item) => item["isActive"] == true && item["imageUrl"] != null)
            .map<String>((item) => item["imageUrl"].toString())
            .toList();
      });
    } catch (e) {
      print("Error fetching carousel images: $e");
      setState(() => carouselImages = []);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFECFDF5),
      body: SafeArea(
        child: Column(
          children: [
            // ===== Carousel =====
            if (isLoading)
              SizedBox(
                height: screenHeight * 0.2,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text(
                        "Loading healthcare services...",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              )
            else if (carouselImages.isEmpty)
              SizedBox(
                height: screenHeight * 0.2,
                child: const Center(
                  child: Text(
                    "No Ads Available",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: screenHeight * 0.20,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                  items: carouselImages.map((imgUrl) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    );
                  }).toList(),
                ),
              ),

            const SizedBox(height: 6),

            // Header Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    "Find Nearby",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Healthcare Services",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  
                  // Location Warning Banner
                  if (_locationDenied)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_off, color: Colors.orange[800], size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Location disabled. Please enable Location.",
                              style: TextStyle(
                                color: Colors.orange[800],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _openLocationSettings,
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Enable",
                              style: TextStyle(
                                color: Colors.orange[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ===== 2-column Grid =====
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // First row: 2 items
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCard(products[0], (screenWidth - 48) / 2, screenHeight * 0.14, context),
                          _buildCard(products[1], (screenWidth - 48) / 2, screenHeight * 0.14, context),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Second row: 2 items
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCard(products[2], (screenWidth - 48) / 2, screenHeight * 0.14, context),
                          _buildCard(products[3], (screenWidth - 48) / 2, screenHeight * 0.14, context),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Third row: 1 item (centered)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCard(products[4], (screenWidth - 48) / 2, screenHeight * 0.14, context),
                        ],
                      ),
                      const SizedBox(height: 16), // Extra padding at bottom
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      Map<String, dynamic> item, double width, double height, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => item["page"]));
      },
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item["icon"], size: width * 0.25, color: const Color(0xFF28A745)),
            const SizedBox(height: 8),
            Text(
              item["name"],
              style: TextStyle(
                fontSize: width * 0.11 > 16 ? 16 : width * 0.11, // Limit max font size
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}