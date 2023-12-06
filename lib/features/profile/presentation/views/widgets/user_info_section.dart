import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';

import '../../../../../core/constants/assets_constants.dart';
import '../../../../../core/models/user/user.dart';
import '../../../../../core/themes/custom_colors.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: context.setWidth(35)),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: CustomColors.textColorAlmostBlack.withOpacity(0.75),
                    fontWeight: FontWeight.w600,
                    fontSize: context.setSp(21)),
              ),
              SizedBox(height: context.setHeight(3)),
              Text(
                user.email,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: context.setSp(11.5)),
              ),
            ],
          ),
        ),
        SizedBox(width: context.setWidth(44)),
        Image.asset(
          AssetsConstants.profileImage,
          height: context.setHeight(84),
        ),
        SizedBox(width: context.setWidth(44)),
      ],
    );
  }
}
