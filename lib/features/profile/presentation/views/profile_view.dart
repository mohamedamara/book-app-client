import 'package:books_app_client/core/widgets/secondary_button.dart';
import 'package:books_app_client/features/profile/presentation/views/widgets/review_card.dart';
import 'package:books_app_client/features/profile/presentation/views/widgets/user_info_section.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/themes/custom_colors.dart';
import '../../../../core/widgets/error_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(profileControllerProvider).when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, _) => ErrorView(
              errorText: e.toString(),
              buttonAction: () =>
                  ref.read(profileControllerProvider.notifier).getProfileData(),
            ),
            data: (data) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.setHeight(22)),
                  UserInfoSection(user: data.userInfo),
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.setWidth(35),
                    ),
                    child: SecondaryButtoon(
                      width: context.setWidth(150),
                      buttonText: 'Edit profile',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: context.setHeight(30)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.setWidth(35),
                    ),
                    child: Text(
                      'Your reviews (${data.userReviews.length})',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: context.setSp(20),
                            color: CustomColors.textColorAlmostBlack
                                .withOpacity(0.5),
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: context.setHeight(22),
                        horizontal: context.setWidth(34),
                      ),
                      itemCount: data.userReviews.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.setHeight(22));
                      },
                      itemBuilder: (context, index) {
                        var review = data.userReviews[index];
                        return ReviewCard(review: review);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
