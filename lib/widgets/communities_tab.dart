import 'package:flutter/material.dart';



class CommunitiesTab extends StatelessWidget{
  const CommunitiesTab({super.key});


  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color.fromARGB(255, 11, 21, 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 44, 44, 44),
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.groups, size: 30, color: const Color.fromARGB(255, 77, 77, 77),)
                      )
                    ),
                    Positioned(
                      bottom: -2,
                      right: -2,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 1, 94, 69),
                        radius: 12,
                        child: Icon(Icons.add, size: 15, color: Colors.black,)
                      ),
                    )
                  ],
                )
              ),
              SizedBox(width: 12),
              Text("New community", style: TextStyle(fontSize: 16),)
            ],
          )
        ),

        // const Divider(),
        
        SizedBox(height: 12),
        

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index){
              return Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 11, 21, 11),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                color: const Color.fromARGB(255, 44, 44, 44),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Icon(Icons.groups, size: 25, color: const Color.fromARGB(255, 77, 77, 77),)
                                )
                              ),
                              SizedBox(width: 12),
                              Text("TCS ${(index + 1)* 100} LVL", style: TextStyle(fontSize: 18),)
                            ],
                          )
                        ),
                        const Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: (){},
                                contentPadding: EdgeInsets.all(0),
                                leading: const Card(
                                  margin: EdgeInsets.all(0),
                                  color: Color.fromARGB(255, 0, 49, 10),
                                  child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.record_voice_over, color: Color.fromARGB(255, 119, 169, 121),),
                                  )
                                ),
                                title: Text("Announcements"),
                                subtitle: Text("TCS ${(index + 1) * 104} Assignment"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Yesterday"),
                                    Text(""),
                                  ],
                                )
                              ),

                              ListTile(
                                onTap: (){},
                                contentPadding: EdgeInsets.all(0),
                                leading: const CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color.fromARGB(255, 0, 49, 10),
                                  child: Icon(Icons.people, color: Color.fromARGB(255, 119, 169, 121), size: 20,),
                                ),
                                title: Text("TELECOMMUNICATION SCI. P..."),
                                subtitle: const Text("~ You: This is an opportunity bro"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("11/06/2025"),
                                    // Text(""),
                                    Icon(Icons.notifications_off_rounded)
                                  ],
                                )
                              ),

                              ListTile(
                                onTap: (){},
                                contentPadding: EdgeInsets.all(0),
                                leading: const CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color.fromARGB(255, 0, 49, 10),
                                  child: Icon(Icons.people, color: Color.fromARGB(255, 119, 169, 121), size: 20,),
                                ),
                                title: Text("OFFICIAL ${(index +1) * 100}"),
                                subtitle: const Text("Today, 10:00 AM"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("29/07/2025"),
                                    Text(""),
                                  ],
                                )
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    
                                    Icon(Icons.arrow_forward_ios_outlined, size: 20,),

                                    SizedBox(width: 12),
                                    Text("View all")
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 10)
                ],
              );
            }
          )
        )
      ],
    );
  }
}

































// // import 'package:flutter/material.dart';




// // class CommunityTab extends StatelessWidget {
// //   const CommunityTab({super.key});
  
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     throw UnimplementedError();
// //   }
// // }



// import 'package:flutter/material.dart';






// class CommunitiesTab extends StatelessWidget{
//   const CommunitiesTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.lock, size: 64, color: Colors.deepPurple),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Welcome Back!',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // Email TextField
//                 CustomTextInput(
//                   hintText: 'Email',
//                   icon: Icons.email,
//                 ),
//                 const SizedBox(height: 16),

//                 // Password TextField
//                 CustomTextInput(
//                   hintText: 'Password',
//                   icon: Icons.lock,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 24),

//                 // Login Button
//                 ElevatedButton(
//                   onPressed: () {
//                     // TODO: Login logic
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }









// class CustomTextInput extends StatelessWidget {
//   final String hintText;
//   final IconData icon;
//   final bool obscureText;

//   const CustomTextInput({
//     super.key,
//     required this.hintText,
//     required this.icon,
//     this.obscureText = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: obscureText,
//       style: const TextStyle(
//         color: Colors.deepPurple,       // 🔤 Text color
//         fontSize: 16,
//       ),
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.deepPurple),
//         hintText: hintText,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.deepPurple),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.purple, width: 2),
//         ),
//       ),
//     );
//   }
// }














// // TextFormField(
// //   style: const TextStyle(
// //     color: Colors.deepPurple,       // 🔤 Text color
// //     fontSize: 16,
// //   ),
// //   decoration: InputDecoration(
// //     filled: true,
// //     fillColor: Colors.grey[200],     // 🎨 Background color
// //     hintText: 'Enter your email',
// //     hintStyle: TextStyle(
// //       color: Colors.grey[600],       // Hint text color
// //     ),
// //     contentPadding: const EdgeInsets.symmetric(
// //       horizontal: 16,
// //       vertical: 14,
// //     ),
// //     enabledBorder: OutlineInputBorder(
// //       borderRadius: BorderRadius.circular(12),
// //       borderSide: const BorderSide(
// //         color: Colors.deepPurple,
// //         width: 1.5,
// //       ),
// //     ),
// //     focusedBorder: OutlineInputBorder(
// //       borderRadius: BorderRadius.circular(12),
// //       borderSide: const BorderSide(
// //         color: Colors.purple,
// //         width: 2,
// //       ),
// //     ),
// //   ),
// //   validator: (value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Email can\'t be empty';
// //     }
// //     return null;
// //   },
// // ),










