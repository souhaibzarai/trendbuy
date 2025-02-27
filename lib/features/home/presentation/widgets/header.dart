import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/auth/domain/entities/user.dart';
import 'package:trendbuy/features/home/presentation/bloc/user_info_display_cubit.dart';
import 'package:trendbuy/features/home/presentation/bloc/user_info_display_state.dart';
import 'package:trendbuy/utils/constants/images_path.dart';

import '../../../../utils/theme/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoDisplayCubit>(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return Image.asset(
              ImagesPath.loadingAnimation,
              fit: BoxFit.fitWidth,
            );
          } else if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user),
                _gender(state.user),
                _card(state.user),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Container _profileImage(UserEntity user) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              user.image.isEmpty
                  ? const AssetImage(ImagesPath.defaultProfile)
                  : NetworkImage(user.image),
          fit: BoxFit.cover,
        ),
        color: AppColors.errorColor, //
        shape: BoxShape.circle,
      ),
    );
  }

  Container _gender(UserEntity user) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 50, 70), //
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            user.gender == 1 ? 'Male' : 'Female',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.whiteColor, //
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.whiteColor, //
          ),
        ],
      ),
    );
  }

  Container _card(UserEntity user) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: AppColors.tertiaryColor, //
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.shopping_bag_sharp,
        color: Colors.white, //
      ),
    );
  }
}
