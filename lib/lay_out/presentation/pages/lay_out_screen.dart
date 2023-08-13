import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_colors.dart';
import 'package:movies_app_clean_architecture_course/lay_out/presentation/controllers/bottom_nav_bar_bloc.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<BottomNavBarBloc>();
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: bloc.bottomNavBarScreens[bloc.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColors.kSecondaryBackgroundColor,
            selectedItemColor: AppColors.kPrimaryColor,
            unselectedItemColor: AppColors.kPrimaryTextColor,
            type: BottomNavigationBarType.fixed,
            onTap: (currentIndex) {
               bloc.add(GetBottomNavBarPageTappedEvent(index: currentIndex));

            },
            currentIndex: bloc.currentIndex,
            items: List.generate(
              bloc.bottomNavBarScreens.length,
              (index) => BottomNavigationBarItem(
                icon: Icon(
                  bloc.bottomNavBarIcon[index],
                  size: 20.0.sp,
                ),
                label: bloc.bottomNavBarIconTitle[index],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class BottomNavBarContent extends StatelessWidget {
//   const BottomNavBarContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
//       builder: (context, state) {
//         //var bloc = BottomNavBarBloc.get(context);
//         var bloc = context.read<BottomNavBarBloc>();
//         return BottomNavigationBar(
//           elevation: 0,
//           backgroundColor: AppColors.kSecondaryBackgroundColor,
//           selectedItemColor: AppColors.kPrimaryColor,
//           unselectedItemColor: AppColors.kPrimaryTextColor,
//           type: BottomNavigationBarType.fixed,
//           onTap: (index) {
//             return bloc.add(GetBottomNavBarPageTappedEvent(index: index));
//           },
//           currentIndex: bloc.currentIndex,
//           items: List.generate(
//             bloc.bottomNavBarScreens.length,
//             (index) => BottomNavigationBarItem(
//               icon: Icon(
//                 bloc.bottomNavBarIcon[index],
//                 size: 20.0.sp,
//               ),
//               label: bloc.bottomNavBarIconTitle[index],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
