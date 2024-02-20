// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:todo/common/theme/colors.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'f_category_add.dart';
// import 'vo_category.dart';

// class CategoryFragment extends StatefulWidget {
//   const CategoryFragment({Key? key}) : super(key: key);

//   @override
//   _CategoryFragmentState createState() => _CategoryFragmentState();
// }

// class _CategoryFragmentState extends State<CategoryFragment> {
//   @override
//   Widget build(BuildContext context) {
//     final categoryModel = context.read(categoryProvider);

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ReorderableListView(
//           onReorder: (oldIndex, newIndex) {
//             categoryModel.reorderCategories(
//                 oldIndex, newIndex); // CategoryModel의 메서드를 호출
//           },
//           children:
//               categoryModel.categories // CategoryModel의 categories getter를 사용
//                   .map((category) => _buildListItem(context, category))
//                   .toList(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const CategoryAddFragment()),
//           );

//           if (result != null) {
//             setState(() {
//               categoryModel.addCategory(result['name'], result['privacy']);
//             });
//           }
//         },
//         child: const Icon(CupertinoIcons.add),
//       ),
//     );
//   }

//   Widget _buildListItem(BuildContext context, String category) {
//     final categoryName = category.split(' (')[0];
//     final privacy = category.split(' (')[1].split(')')[0];

//     return ListTile(
//       key: Key(category),
//       title: Row(
//         children: [
//           Text(categoryName),
//           const SizedBox(width: 5),
//           Text(
//             '($privacy)',
//             style: const TextStyle(
//               color: mainColor,
//               fontSize: 13,
//               //fontWeight: FontWeight.bold,
//             ), // 보라색으로 설정
//           ),
//         ],
//       ),
//       trailing: const Icon(CupertinoIcons.bars),
//     );
//   }

//   /*void _onReorder(int oldIndex, int newIndex) {
//     setState(() {
//       if (newIndex > oldIndex) {
//         newIndex -= 1;
//       }
//       final String removedCategory = _categories.removeAt(oldIndex);
//       _categories.insert(newIndex, removedCategory);
//     });
//   }*/
// }
