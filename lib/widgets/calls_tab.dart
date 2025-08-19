import 'package:flutter/material.dart';
import '../app_color.dart';


class CallsTab extends StatelessWidget{
  const CallsTab({super.key});


  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> chatList = [
      {"name": "Olivia Parker", "time": "2 August 8:03PM", "red": true, "outgoing": false},
      {"name": "James Holden", "time": "2 August 6:18AM", "red": false, "outgoing": true},
      {"name": "Sophia Bennett", "time": "1 August 10:42AM", "red": true, "outgoing": false},
      {"name": "Ethan Walker", "time": "1 August 4:29PM", "red": false, "outgoing": false},
      {"name": "Isabella Reed", "time": "31 July 7:55PM", "red": true, "outgoing": false},
      {"name": "Liam Carter", "time": "30 July 11:36AM", "red": true, "outgoing": false},
      {"name": "Charlotte Myers", "time": "30 July 2:17PM", "red": false, "outgoing": true},
      {"name": "Noah Hughes", "time": "29 July 9:03AM", "red": true, "outgoing": false},
      {"name": "Amelia Fisher", "time": "29 July 5:45PM", "red": true, "outgoing": false},
      {"name": "Logan Hayes", "time": "28 July 8:14AM", "red": false, "outgoing": true},
      {"name": "Emma Daniels", "time": "27 July 6:21PM", "red": false, "outgoing": false},
      {"name": "Henry Coleman", "time": "27 July 1:00PM", "red": true, "outgoing": false},
      {"name": "Ava Mitchell", "time": "26 July 3:37PM", "red": false, "outgoing": true},
      {"name": "Mason Brooks", "time": "25 July 10:18AM", "red": false, "outgoing": true},
    ];


    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Text("Favourites", style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontWeight: FontWeight.w500,fontSize: 20)),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                    radius: 20,
                    backgroundColor: theme.colorScheme.primary,
                    child: Icon(Icons.heart_broken, color: theme.scaffoldBackgroundColor, size: 25,)
                    ),
              SizedBox(width: 12,),
              Text("Add favourite", style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontWeight: FontWeight.w500, fontSize: 15),)
            ],
          ),

          // const Divider(),
          
          SizedBox(height: 15),
          Text("Recent", style: TextStyle(color: theme.textTheme.bodyLarge?.color,fontSize: 18, fontWeight: FontWeight.w500),),

          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index){
                return ListTile(
                  onTap: (){},
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: theme.textTheme.bodyMedium?.color,
                    child: Icon(Icons.person, color: theme.scaffoldBackgroundColor,),
                  ),
                  title: Text(
                    chatList[index]['name'],
                    style: TextStyle(color: chatList[index]['red'] == true ? Colors.red : theme.textTheme.bodyLarge?.color),),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      chatList[index]['outgoing'] == true ? Icon(Icons.call_made, color: theme.colorScheme.primary, size: 18,) : Icon(Icons.call_received, color: chatList[index]['red'] == true ? Colors.red : theme.colorScheme.primary, size: 18,),
                      SizedBox(width: 5,),
                      Text(chatList[index]['time'], style: TextStyle(color: theme.textTheme.bodyMedium?.color),),
                    ],
                  ),
                  trailing: Icon(Icons.call_outlined, color: theme.textTheme.bodyLarge?.color,),
                );
              }
            )
          )
        ],
      ),
    );
  }
}







































// import 'package:flutter/material.dart';






// class CallTab extends StatelessWidget{
//   const CallTab({super.key});

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












