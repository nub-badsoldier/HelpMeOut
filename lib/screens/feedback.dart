import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final Color firstColor = const Color(0xCC68B8D8);
  final Color secondColor = const Color.fromRGBO(5, 30, 62, 1);
  TextEditingController msgContoller = TextEditingController();

  void sendFeedback() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection("feedback").doc().set(<String, dynamic>{
      'uid': uid,
      'desc': msgContoller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              firstColor,
                              secondColor
                            ]
                        ),
                        boxShadow: const[
                          BoxShadow(
                              color: Colors.red,
                              blurRadius: 12,
                              offset: Offset(0, 6)
                          )
                        ]
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget> [
                      Text('Welcome To Our Feedback Form',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('We Will Be Happy To Hear',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Your Opinion In Our App',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Tell Us How We Can Improve'
                    ,style: TextStyle(color: Colors.black,fontSize: 18.0),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                          child: TextField(
                            controller: msgContoller,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                            maxLines: 10,
                            decoration: InputDecoration(
                                hintText: 'Write here..',
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10),
                const Center(
                  child: Text(
                    'How Would You Rate Our App?',
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) => IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.star_border_outlined,
                        color: Colors.red,
                        size: 32,
                      ))),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (msgContoller.text != "") {
                          sendFeedback();
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("FeedBack Sent"),
                              content: const Text("Thank you for the feedback!!"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Color(0xCC68B8D8),
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("ok"),
                                  ),
                                ),
                              ],
                            ),
                          );
                          Navigator.pop(context);
                        }else {

                        }
                      },
                      child: const Text('Send Now',style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Fonts/Oswald-Bold.ttf',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    RotatedBox(quarterTurns: 6,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    firstColor,
                                    secondColor
                                  ]
                              ),
                              boxShadow: const[
                                BoxShadow(
                                    color: Colors.red,
                                    blurRadius: 12,
                                    offset: Offset(0, 6)
                                )
                              ]
                          ),
                        ),
                      ),),
                  ],
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0, size.height-70);
    path.quadraticBezierTo(size.width/2, size.height, size.width,size.height-300);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
// class _FeedbackScreenState extends State<FeedbackScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _feedbackController = TextEditingController();
//
//   String _feedbackType = 'Bug';
//   bool _isLoading = false;
//
//   void _submitFeedback() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     final user = FirebaseAuth.instance.currentUser;
//
//     await FirebaseFirestore.instance.collection('feedback').add({
//       'userId': user.uid,
//       'feedbackType': _feedbackType,
//       'feedback': _feedbackController.text,
//       'createdAt': Timestamp.now(),
//     });
//
//     setState(() {
//       _isLoading = false;
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Feedback submitted successfully')),
//     );
//   }
//
//
//       appBar: AppBar(title: Text('Submit Feedback')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Feedback Type'),
//               SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 value: _feedbackType,
//                 onChanged: (value) {
//                   setState(() {
//                     _feedbackType = value!;
//                   });
//                 },
//                 items: ['Bug', 'Feature Request', 'General Feedback']
//                     .map<DropdownMenuItem<String>>((value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16),
//               Text('Feedback'),
//               SizedBox(height: 8),
//               TextFormField(
//                 controller: _feedbackController,
//                 maxLines: 5,
//                 validator: (value) {
//                   // if (value.isEmpty) {
//                   //   return 'Please enter your feedback';
//                   // }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : ElevatedButton(
//                 onPressed: () {
//                    {
//                     _submitFeedback();
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
