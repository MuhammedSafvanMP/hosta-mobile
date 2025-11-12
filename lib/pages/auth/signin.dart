
// import 'package:flutter/material.dart';
// import 'package:hosta/pages/bottomnav.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import './signup.dart';
// import '../../services/api_service.dart'; 
// import 'package:shared_preferences/shared_preferences.dart';


// class Signin extends StatefulWidget {
//   const Signin({super.key});

//   @override
//   State<Signin> createState() => _SigninState();
// }

// class _SigninState extends State<Signin> {
//   final TextEditingController phoneController = TextEditingController();
//   final ApiService _apiService = ApiService();

//   bool isSendingOtp = false;

//   // STEP 1: Send OTP (loginUser)
//   Future<void> _sendOtp() async {
//     final phone = phoneController.text.trim();
//     if (phone.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter your phone number")),
//       );
//       return;
//     }

//     try {
//       setState(() => isSendingOtp = true);
//       await _apiService.loginUser({"phone": phone});
//       setState(() => isSendingOtp = false);
//       _showOtpPopup(phone);
//     } catch (e) {
//       setState(() => isSendingOtp = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to send OTP: $e")),
//       );
//     }
//   }

//   // STEP 2: Show OTP popup and verify OTP (otpUser)
//   void _showOtpPopup(String phone) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         TextEditingController otpController = TextEditingController();
//         bool isLoading = false;
//         int resendAfter = 30;

//         return StatefulBuilder(builder: (context, setState) {
//           Future.delayed(const Duration(seconds: 1), () {
//             if (resendAfter > 0) {
//               setState(() => resendAfter--);
//             }
//           });

//           return AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             titlePadding: const EdgeInsets.only(top: 8, right: 8, left: 16),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text("Enter OTP", style: TextStyle(fontWeight: FontWeight.bold)),
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text("We’ve sent a 6-digit code to your phone."),
//                 const SizedBox(height: 16),
//                 PinCodeTextField(
//                   appContext: context,
//                   length: 6,
//                   controller: otpController,
//                   keyboardType: TextInputType.number,
//                   animationType: AnimationType.fade,
//                   autoDismissKeyboard: true,
//                   enablePinAutofill: true,
//                   pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     borderRadius: BorderRadius.circular(8),
//                     fieldHeight: 45,
//                     fieldWidth: 40,
//                     activeColor: Colors.green,
//                     selectedColor: Colors.blue,
//                     inactiveColor: Colors.grey,
//                   ),
//                   onChanged: (value) {},
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final otp = otpController.text.trim();
//                     if (otp.length != 6) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Enter a valid 6-digit OTP")),
//                       );
//                       return;
//                     }

//                     setState(() => isLoading = true);
//                     try {
                   
//   final response = await _apiService.otpUser({
//   "phone": phone,
//   "otp": otp,
// });

// setState(() => isLoading = false);

// if (response.statusCode == 200 && response.data["status"] == 200) {
//   // ✅ Extract user id and token
//   final userId = response.data["userDetails"]["_id"];
//   final userPhone = response.data["userDetails"]["phone"];
//   // ✅ Save to SharedPreferences
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('userId', userId);
//   await prefs.setString('userPhone', userPhone);
 
//      ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(content: Text("Login successful!")),
//   );

//   // Go to Home (or bottomnav)
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => const Bottomnav()),
//   );
  
// } 


//                     } catch (e) {
//                       setState(() => isLoading = false);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Invalid OTP or error: $e")),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     minimumSize: const Size(double.infinity, 45),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   ),
//                   child: isLoading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text("Verify & Login", style: TextStyle(color: Colors.white)),
//                 ),
//                 const SizedBox(height: 8),
//                 resendAfter > 0
//                     ? Text("Resend in ${resendAfter}s")
//                     : TextButton(
//                         onPressed: () async {
//                           setState(() => resendAfter = 30);
//                           await _sendOtp();
//                         },
//                         child: const Text("Resend OTP"),
//                       ),
//               ],
//             ),
//           );
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Login with Phone",
//                   style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 32),
//                 TextField(
//                   controller: phoneController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     labelText: "Phone Number",
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                     prefixIcon: const Icon(Icons.phone),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 ElevatedButton(
//                   onPressed: isSendingOtp ? null : _sendOtp,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   child: isSendingOtp
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text("Send OTP", style: TextStyle(color: Colors.white)),
//                 ),
//                 const SizedBox(height: 28),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don't have an account? "),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => const Signup()),
//                         );
//                       },
//                       child: const Text(
//                         "Register here",
//                         style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hosta/common/top_snackbar.dart';
import 'package:hosta/pages/bottomnav.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import './signup.dart';
import '../../services/api_service.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController phoneController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool isSendingOtp = false;

  // STEP 1: Send OTP (loginUser)
  Future<void> _sendOtp() async {
    final phone = phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your phone number"), backgroundColor: Colors.red,),
      );
      return;
    }

    try {
      setState(() => isSendingOtp = true);
      await _apiService.loginUser({"phone": phone});
      setState(() => isSendingOtp = false);
      _showOtpPopup(phone);
    } catch (e) {
      setState(() => isSendingOtp = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send OTP: $e")),
      );
    }
  }

  // STEP 2: Show OTP popup and verify OTP (otpUser)
  void _showOtpPopup(String phone) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        TextEditingController otpController = TextEditingController();
        bool isLoading = false;
        int resendAfter = 30;

        return StatefulBuilder(builder: (context, setState) {
          Future.delayed(const Duration(seconds: 1), () {
            if (resendAfter > 0) {
              setState(() => resendAfter--);
            }
          });

          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            titlePadding: const EdgeInsets.only(top: 8, right: 8, left: 16),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Enter OTP", style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("We've sent a 6-digit code to your phone."),
                const SizedBox(height: 16),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  autoDismissKeyboard: true,
                  enablePinAutofill: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 45,
                    fieldWidth: 40,
                    activeColor: Colors.green,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final otp = otpController.text.trim();
                    if (otp.length != 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Enter a valid 6-digit OTP"), backgroundColor: Colors.red,),
                      );
                      return;
                    }

                    setState(() => isLoading = true);
                    try {
                   
                      final response = await _apiService.otpUser({
                        "phone": phone,
                        "otp": otp,
                      });

                      setState(() => isLoading = false);

                      if (response.statusCode == 200 && response.data["status"] == 200) {
                        // ✅ Extract user id and token
                        final userId = response.data["userDetails"]["_id"];
                        final userPhone = response.data["userDetails"]["phone"];
                         final donorId = response.data["userDetails"]["donorId"];

                        
                        // ✅ Save to SharedPreferences
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('userId', userId);
                        await prefs.setString('userPhone', userPhone);

                     
                        
                        if (donorId != null && donorId.toString().isNotEmpty) {
                          await prefs.setString('bloodId', donorId.toString());}
                 

                       showTopSnackBar(context, "Login successful!");


                        // Go to Home (or bottomnav)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Bottomnav()),
                        );
                      } 
                    } catch (e) {
                      setState(() => isLoading = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Invalid OTP or error: $e"), backgroundColor: Colors.red,),
                      );
                      
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify & Login", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                resendAfter > 0
                    ? Text("Resend in ${resendAfter}s")
                    : TextButton(
                        onPressed: () async {
                          setState(() => resendAfter = 30);
                          await _sendOtp();
                        },
                        child: const Text("Resend OTP"),
                      ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: const Color(0xFFECFDF5),

      appBar: AppBar(
              backgroundColor: const Color(0xFFECFDF5),

        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Login with Phone",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: isSendingOtp ? null : _sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: isSendingOtp
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Send OTP", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Signup()),
                        );
                      },
                      child: const Text(
                        "Register here",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}