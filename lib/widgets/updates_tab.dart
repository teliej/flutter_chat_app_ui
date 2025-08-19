import 'package:flutter/material.dart';

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              child: Text(
                "Status",
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        // Add status card
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  color: theme.inputDecorationTheme.fillColor,
                  child: SizedBox(
                    height: 130,
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: theme.hintColor,
                                child: Icon(Icons.person,
                                    color: theme.scaffoldBackgroundColor),
                              ),
                              Positioned(
                                bottom: -2,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: theme.colorScheme.primary,
                                  child: Icon(Icons.add,
                                      color: theme.colorScheme.onPrimary,
                                      size: 18),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Add status",
                            style: TextStyle(
                              color: theme.textTheme.bodyLarge?.color,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // Channels section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Channels",
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                ActionChip(
                  label: const Text("Explore"),
                  onPressed: () {},
                  backgroundColor: theme.inputDecorationTheme.fillColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: theme.scaffoldBackgroundColor),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelStyle: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Main scrollable list
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: CircleAvatar(
                  backgroundColor: theme.hintColor,
                  child: Icon(Icons.group_add_outlined,
                      color: theme.scaffoldBackgroundColor),
                ),
                title: Text(
                  mockChats[index]['name']!,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
                subtitle: Text(
                  mockChats[index]['content']!,
                  style: TextStyle(color: theme.textTheme.bodySmall?.color),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      mockChats[index]['time']!,
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "${((index * 7 + 13) % 50) + 1}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: theme.colorScheme.onPrimary,
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


































// import 'package:flutter/material.dart';
// import '../app_color.dart';

// class UpdatesTab extends StatelessWidget {
//   const UpdatesTab({super.key});





//   @override
//   Widget build(BuildContext context) {

//     final List<Map<String, String>> mockChats = [
//       {"name": "Big Money Moves 💰", "content": "Investment confirmed.", "time": "1:31 PM"},
//       {"name": "Nurse Bae 💉", "content": "Don’t forget your appointment 😅", "time": "6:25 AM"},
//       {"name": "Ada Lovelace", "content": "Can you send the PDF now?", "time": "9:32 AM"},
//       {"name": "Fola Poetry 📝", "content": "What do you think of stanza two?", "time": "2:22 AM"},
//       {"name": "Funmi Coder", "content": "I'll push the changes tonight.", "time": "7:10 PM"},
//       {"name": "Tobi UX", "content": "The UI looks solid now 👍", "time": "11:47 AM"},
//       {"name": "Jane - Tutor 🇬🇧", "content": "Homework looks good now!", "time": "10:50 PM"},
//       {"name": "Michael - Client", "content": "Please resend the invoice.", "time": "4:55 PM"},
//       {"name": "Zara Study Group", "content": "Meeting at 8pm sharp!", "time": "8:00 PM"},
//       {"name": "Dev Circle 🇳🇬", "content": "New PR merged 🚀", "time": "3:14 PM"},
//       {"name": "Ayo Backup", "content": "That’s the right cable.", "time": "10:02 AM"},
//       {"name": "Mummy", "content": "Okay, I’ll cook it tomorrow.", "time": "12:18 PM"},
//       {"name": "Kingsley Gym", "content": "Bro, don’t skip leg day 😂", "time": "5:40 PM"},
//       {"name": "Uche Designer 🎨", "content": "I changed the font spacing.", "time": "9:08 AM"},
//     ];

//     return CustomScrollView(
//       slivers: [
//         // Static widget that scrolls with list
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: SizedBox(
//               height: 40,
//               child: Text("Status", style: TextStyle(color: AppColors.textPrimary,fontWeight: FontWeight.w500,fontSize: 18)),
//             ),
//           ),
//         ),

//         // 🔧 Wrap Row in SliverToBoxAdapter
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Card(
//                   color: AppColors.searchBackground,
//                   child: SizedBox(
//                     height: 130,
//                     width: 80,
//                     child: Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               CircleAvatar(
//                                 radius: 18,
//                                 backgroundColor: AppColors.textSecondary,
//                                 child: Icon(Icons.person, color: AppColors.background),
//                               ),
//                               Positioned(
//                                 bottom: -2,
//                                 right: -2,
//                                 child: CircleAvatar(
//                                   radius: 10,
//                                   backgroundColor:
//                                       AppColors.primary,
//                                   child: Icon(Icons.add,
//                                       color: AppColors.background, size: 15),
//                                 ),
//                               )
//                             ],
//                           ),
//                           Text("Add status", style: TextStyle(color: AppColors.textPrimary,fontWeight: FontWeight.w500, fontSize: 12))
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),

//         // 🔧 Wrap Row & ActionChip too
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Channels", style: TextStyle(color: AppColors.textPrimary,fontWeight: FontWeight.w500, fontSize: 18)),
//                 ActionChip(
//                   label: Text("Explore"),
//                   onPressed: () {},
//                   backgroundColor: AppColors.searchBackground,
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(color: AppColors.background,),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           labelStyle: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w500, fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         // The main scrollable list
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) {
//               return ListTile(
//                 onTap: () {},
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                 leading: const CircleAvatar(
//                   backgroundColor: AppColors.textSecondary,
//                   child: Icon(Icons.group_add_outlined, color: AppColors.background),
//                 ),
//                 title: Text(mockChats[index]['name']!, style: TextStyle(color: AppColors.textPrimary),),
//                 subtitle: Text(mockChats[index]['content']!, style: TextStyle(color: AppColors.textSecondary),),
//                 trailing: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(mockChats[index]['time']!, style: TextStyle(color: AppColors.primary),),
//                     // Text("")
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: 70,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                             decoration: BoxDecoration(
//                               color: AppColors.primary,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               "${((index * 7 + 13) % 50) + 1}",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12,
//                                 color: AppColors.background,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             childCount: mockChats.length,
//           ),
//         ),
//       ],
//     );
//   }
// }