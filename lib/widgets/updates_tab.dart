import 'package:flutter/material.dart';

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});





  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> mockChats = [
      {"name": "Big Money Moves 💰", "content": "Investment confirmed.", "time": "1:31 PM"},
      {"name": "Nurse Bae 💉", "content": "Don’t forget your appointment 😅", "time": "6:25 AM"},
      {"name": "Ada Lovelace", "content": "Can you send the PDF now?", "time": "9:32 AM"},
      {"name": "Fola Poetry 📝", "content": "What do you think of stanza two?", "time": "2:22 AM"},
      {"name": "Funmi Coder", "content": "I'll push the changes tonight.", "time": "7:10 PM"},
      {"name": "Tobi UX", "content": "The UI looks solid now 👍", "time": "11:47 AM"},
      {"name": "Jane - Tutor 🇬🇧", "content": "Homework looks good now!", "time": "10:50 PM"},
      {"name": "Michael - Client", "content": "Please resend the invoice.", "time": "4:55 PM"},
      {"name": "Zara Study Group", "content": "Meeting at 8pm sharp!", "time": "8:00 PM"},
      {"name": "Dev Circle 🇳🇬", "content": "New PR merged 🚀", "time": "3:14 PM"},
      {"name": "Ayo Backup", "content": "That’s the right cable.", "time": "10:02 AM"},
      {"name": "Mummy", "content": "Okay, I’ll cook it tomorrow.", "time": "12:18 PM"},
      {"name": "Kingsley Gym", "content": "Bro, don’t skip leg day 😂", "time": "5:40 PM"},
      {"name": "Uche Designer 🎨", "content": "I changed the font spacing.", "time": "9:08 AM"},
    ];

    return CustomScrollView(
      slivers: [
        // Static widget that scrolls with list
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 40,
              child: Text("Status", style: TextStyle(fontSize: 20)),
            ),
          ),
        ),

        // 🔧 Wrap Row in SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  color: const Color.fromARGB(255, 44, 44, 44),
                  child: SizedBox(
                    height: 130,
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.teal,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              Positioned(
                                bottom: -2,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 94, 69),
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 15),
                                ),
                              )
                            ],
                          ),
                          Text("Add status", style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // 🔧 Wrap Row & ActionChip too
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Channels", style: TextStyle(fontSize: 20)),
                ActionChip(
                  label: Text("Explore"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),

        // The main scrollable list
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 110, 110, 110),
                  child: Icon(Icons.group_add_outlined),
                ),
                title: Text(mockChats[index]['name']!),
                subtitle: Text(mockChats[index]['content']!, style: TextStyle(color: Colors.grey),),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(mockChats[index]['time']!, style: TextStyle(color: Color.fromARGB(255, 26, 131, 29)),),
                    // Text("")
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 26, 131, 29),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "${((index * 7 + 13) % 50) + 1}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: mockChats.length,
          ),
        ),
      ],
    );
  }
}



//     Padding(
//       padding: EdgeInsets.all(5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 40,
//             child: Text("Status", style: TextStyle(fontSize: 20)),
//             ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Card(
//                 color: const Color.fromARGB(255, 44, 44, 44),
//                 child: SizedBox(
//                     height: 120,
//                     width: 80,
//                     child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               CircleAvatar(
//                               radius: 18,
//                               backgroundColor: Colors.teal,
//                               child: Icon(Icons.person, color: Colors.white,)
//                               ),
//                               Positioned(
//                                 bottom: -2,
//                                 right: -2,
//                                 child: CircleAvatar(
//                                   radius: 10,
//                                   backgroundColor: const Color.fromARGB(255, 1, 94, 69),
//                                   child: Icon(Icons.add, color: Colors.white, size: 15)
//                                 ),
//                               )
//                             ],
//                           ),
//                           Text("Add status", style: TextStyle(fontSize: 10))
//                         ],
//                       )
//                   )
//                 )
//               )
//             ],
//           ),

//           // const Divider(),
          
//           SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Channels", style: TextStyle(fontSize: 20)),
//               ActionChip(
//                 label: Text("Explore"),
//                 onPressed: () {},
//               )
//             ],
//           ),

//           Expanded(
//             child: ListView.builder(
//               itemCount: 31,
//               itemBuilder: (context, index){
//                 return ListTile(
//                   onTap: (){},
//                   contentPadding: EdgeInsets.symmetric(horizontal: 0),
//                   leading: const CircleAvatar(
//                     backgroundColor: Colors.grey,
//                     child: Icon(Icons.person),
//                   ),
//                   title: Text("Contact ${index + 1}"),
//                   subtitle: const Text("Today, 10:00 AM"),
//                 );
//               }
//             )
//           )
//         ],
//       ),
//     );
//   }
// }


































// import 'package:flutter/material.dart';



// class UpdatesTab extends StatelessWidget{
//   const UpdatesTab({super.key});


//   @override
//   Widget build(BuildContext context){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.all(5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 24,
//                 backgroundColor: Colors.teal,
//                 child: Icon(Icons.person, color: Colors.white,)
//               ),
//               SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("My Status", style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text("Tap to add status update", style: TextStyle(color: Colors.grey)),
//                 ],
//               )
//             ],
//           )
//         ),

//         const Divider(),

//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 5),
//           child: Text("Recent updates", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: 14,
//             itemBuilder: (context, index){
//               return ListTile(
//                 onTap: (){},
//                 leading: const CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(Icons.person),
//                 ),
//                 title: Text("Contact ${index + 1}"),
//                 subtitle: const Text("Today, 10:00 AM"),
//               );
//             }
//           )
//         )
//       ],
//     );
//   }
// }