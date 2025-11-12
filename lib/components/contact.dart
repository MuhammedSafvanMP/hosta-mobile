// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Contact extends StatefulWidget {
//   const Contact({super.key});

//   @override
//   State<Contact> createState() => _ContactState();
// }

// class _ContactState extends State<Contact> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController opinionController = TextEditingController();

//   int rating = 0;
//   bool isSubmitting = false;
//   String? statusMessage;

//   Future<void> _submitFeedback() async {
//     if (emailController.text.isEmpty) {
//       setState(() {
//         statusMessage = "Please enter your email.";
//       });
//       return;
//     }

//     setState(() {
//       isSubmitting = true;
//       statusMessage = null;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse('https://your-api-url.com/api/email'), // your API
//         headers: {'Content-Type': 'application/json'},
//         body:
//             '{"from":"${emailController.text}","to":"hostahealthcare@gmail.com","subject":"Review from: ${emailController.text}","text":"Rating: $rating Opinion: ${opinionController.text}"}',
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           statusMessage = "✅ Thank you for your feedback!";
//           emailController.clear();
//           opinionController.clear();
//           rating = 0;
//         });
//       } else {
//         setState(() {
//           statusMessage = "❌ Something went wrong. Please try again.";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         statusMessage = "⚠️ Error submitting feedback.";
//       });
//     }

//     setState(() {
//       isSubmitting = false;
//     });
//   }

//   Future<void> _openUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw Exception("Could not open $url");
//     }
//   }

//   Widget _buildStar(int index) {
//     return IconButton(
//       icon: Icon(
//         Icons.star,
//         color: index <= rating ? Colors.amber : Colors.grey,
//         size: 32,
//       ),
//       onPressed: () {
//         setState(() => rating = index);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFECFDF5),
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         elevation: 2,
//         title: const Text(
//           "Contact Us",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _buildCard(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Send Us a Message",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green),
//                   ),
//                   const SizedBox(height: 12),
//                   _buildInputField(
//                     label: "Email Address *",
//                     controller: emailController,
//                     hint: "Enter your email",
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   _buildInputField(
//                     label: "Your Opinion",
//                     controller: opinionController,
//                     hint: "Share your feedback",
//                     maxLines: 4,
//                   ),
//                   const SizedBox(height: 12),
//                   const Text(
//                     "Rate Our Application",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.green),
//                   ),
//                   Row(
//                     children:
//                         List.generate(5, (index) => _buildStar(index + 1)),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton.icon(
//                     onPressed: isSubmitting ? null : _submitFeedback,
//                     icon: isSubmitting
//                         ? const SizedBox(
//                             height: 16,
//                             width: 16,
//                             child: CircularProgressIndicator(
//                                 strokeWidth: 2, color: Colors.white),
//                           )
//                         : const Icon(Icons.send, color: Colors.white),
//                     label: Text(
//                       isSubmitting ? "Submitting..." : "Submit",
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       minimumSize: const Size(double.infinity, 48),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6)),
//                     ),
//                   ),
//                   if (statusMessage != null) ...[
//                     const SizedBox(height: 12),
//                     Text(
//                       statusMessage!,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: statusMessage!.contains("✅")
//                             ? Colors.green
//                             : Colors.red,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ]
//                 ],
//               ),
//             ),

//             _buildCard(
//               child: Column(
//                 children: [
//                   const Text(
//                     "Get in Touch",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green),
//                   ),
//                   const SizedBox(height: 16),
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     spacing: 18,
//                     runSpacing: 10,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.phone, color: Colors.green),
//                         onPressed: () => _openUrl("tel:8714412090"),
//                       ),
//                       IconButton(
//                         icon: FaIcon(FontAwesomeIcons.whatsapp,
//                             color: Colors.green),
//                         onPressed: () =>
//                             _openUrl("https://wa.me/918714412090"),
//                       ),
//                       IconButton(
//                         icon: FaIcon(FontAwesomeIcons.facebook,
//                             color: Colors.green),
//                         onPressed: () => _openUrl(
//                             "https://www.facebook.com/profile.php?id=61568947746890&mibextid=LQQJ4d"),
//                       ),
//                       IconButton(
//                         icon: FaIcon(FontAwesomeIcons.instagram,
//                             color: Colors.green),
//                         onPressed: () => _openUrl(
//                             "https://www.instagram.com/hosta_healthcare/?igsh=MnR6d3h0YTJlbXEy"),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.email, color: Colors.green),
//                         onPressed: () => _openUrl(
//                             "mailto:hostahealthcare@gmail.com?subject=Inquiry&body=Hello Hosta,"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCard({required Widget child}) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.green.withOpacity(0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           )
//         ],
//       ),
//       child: child,
//     );
//   }

//   Widget _buildInputField({
//     required String label,
//     required TextEditingController controller,
//     String? hint,
//     TextInputType? keyboardType,
//     int maxLines = 1,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label,
//               style: const TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.green,
//                   fontSize: 16)),
//           const SizedBox(height: 6),
//           TextField(
//             controller: controller,
//             keyboardType: keyboardType,
//             maxLines: maxLines,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: const Color(0xFFF7FAFC),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(6),
//                 borderSide: const BorderSide(color: Color(0xFFCBD5E0)),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(6),
//                 borderSide: const BorderSide(color: Color(0xFFCBD5E0)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController opinionController = TextEditingController();

  int rating = 0;
  bool isSubmitting = false;
  String? statusMessage;

  Future<void> _submitFeedback() async {
    if (emailController.text.isEmpty) {
      setState(() {
        statusMessage = "Please enter your email.";
      });
      return;
    }

    setState(() {
      isSubmitting = true;
      statusMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('https://your-api-url.com/api/email'), // your API
        headers: {'Content-Type': 'application/json'},
        body:
            '{"from":"${emailController.text}","to":"hostahealthcare@gmail.com","subject":"Review from: ${emailController.text}","text":"Rating: $rating Opinion: ${opinionController.text}"}',
      );

      if (response.statusCode == 200) {
        setState(() {
          statusMessage = "✅ Thank you for your feedback!";
          emailController.clear();
          opinionController.clear();
          rating = 0;
        });
      } else {
        setState(() {
          statusMessage = "❌ Something went wrong. Please try again.";
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = "⚠️ Error submitting feedback.";
      });
    }

    setState(() {
      isSubmitting = false;
    });
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open $url");
    }
  }

  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        Icons.star,
        color: index <= rating ? Colors.amber : Colors.grey,
        size: 32,
      ),
      onPressed: () {
        setState(() => rating = index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECFDF5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 2,
        title: const Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Send Us a Message",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 12),
                  _buildInputField(
                    label: "Email Address *",
                    controller: emailController,
                    hint: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildInputField(
                    label: "Your Opinion",
                    controller: opinionController,
                    hint: "Share your feedback",
                    maxLines: 4,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Rate Our Application",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                  Row(
                    children:
                        List.generate(5, (index) => _buildStar(index + 1)),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: isSubmitting ? null : _submitFeedback,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send, color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  if (statusMessage != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      statusMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: statusMessage!.contains("✅")
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]
                ],
              ),
            ),

            _buildCard(
              child: Column(
                children: [
                  const Text(
                    "Get in Touch",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Phone
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.phone, color: Colors.green, size: 30),
                            onPressed: () => _openUrl("tel:8714412090"),
                          ),
                          const Text("Call", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      // WhatsApp
                      Column(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 30),
                            onPressed: () => _openUrl("https://wa.me/918714412090"),
                          ),
                          const Text("WhatsApp", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      // Facebook
                      Column(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.green, size: 30),
                            onPressed: () => _openUrl("https://www.facebook.com/profile.php?id=61568947746890&mibextid=LQQJ4d"),
                          ),
                          const Text("Facebook", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      // Instagram
                      Column(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.green, size: 30),
                            onPressed: () => _openUrl("https://www.instagram.com/hosta_healthcare/?igsh=MnR6d3h0YTJlbXEy"),
                          ),
                          const Text("Instagram", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      // Email
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.email, color: Colors.green, size: 30),
                            onPressed: () => _openUrl("mailto:hostahealthcare@gmail.com?subject=Inquiry&body=Hello Hosta,"),
                          ),
                          const Text("Email", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                  fontSize: 16)),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: const Color(0xFFF7FAFC),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFFCBD5E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFFCBD5E0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}