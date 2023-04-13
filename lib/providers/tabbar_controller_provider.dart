// import 'package:flutter/material.dart';
// import 'package:landing_page/models/turno.dart';

// import '../../utils/sizes_app.dart';


// class RappiBloc extends ChangeNotifier {
//   late TabController tabController;
//   ScrollController scrollController = ScrollController();

//   bool _listen = true;

//   List<String> tabs = [];
//   List<String> items = [];

//   void init(TickerProvider ticker) {
//     tabController = TabController(length: listadeTurnos.length, vsync: ticker);

//     double offsetFromY = 0.0;
//     double offsetToY = 0.0;

//     for (int categoryIndex = 0;
//         categoryIndex < listadeTurnos.length;
//         categoryIndex++) {
//       final category = listadeTurnos[categoryIndex];
//       if (categoryIndex > 0) {
//         // offsetFromY = offsetFromY + rappiCategories[categoryIndex - 1].products.length * SizesApp.productHeight;
//         offsetFromY += listadeTurnos[categoryIndex - 1].turnos.length *
//             SizesApp.productsHeight;
//       }
//       print('offsetFromY: === $offsetFromY ===');
//       if (categoryIndex < listadeTurnos.length - 1) {
//         offsetToY = offsetFromY +
//             listadeTurnos[categoryIndex + 1].turnos.length *
//                 SizesApp.productsHeight;
//         print('offsetToY: === $offsetToY ===');
//       } else {
//         offsetToY = double.infinity;
//       }

//       tabs.add(
//         TabCategoryBloc(
//           category: category,
//           selected: (categoryIndex == 0),
//           offsetFrom:
//               SizesApp.categoryTitleHeight * categoryIndex + offsetFromY,
//           offsetTo: offsetToY,
//         ),
//       );
//       items.add(ItemBloc(category: category));
//       for (var j = 0; j < category.products.length; j++) {
//         final product = category.products[j];
//         items.add(ItemBloc(product: product));
//       }
//     }
//     scrollController.addListener(() {
//       onScrollListener();
//     });
//   }

//   void onCategorySelectedTab(int index, {bool animatedRequired = true}) async {
//     final tabSelected = tabs[index];
//     for (var i = 0; i < tabs.length; i++) {
//       tabs[i] =
//           tabs[i].copyWith(tabSelected.category.name == tabs[i].category.name);
//     }
//     notifyListeners();
//     if (animatedRequired) {
//       _listen = false;
//       await scrollController.animateTo(tabSelected.offsetFrom,
//           duration: const Duration(milliseconds: 500), curve: Curves.ease);
//       _listen = true;
//     }
//   }

//   void onScrollListener() {
//     if (_listen) {
//       for (var i = 0; i < tabs.length; i++) {
//         final tab = tabs[i];
//         if (scrollController.offset >= tab.offsetFrom &&
//             scrollController.offset <= tab.offsetTo &&
//             !tab.selected) {
//           onCategorySelectedTab(i, animatedRequired: false);
//           tabController.animateTo(i);
//           break;
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     scrollController.removeListener(onScrollListener);
//     scrollController.dispose();
//     super.dispose();
//   }
// }