import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TopSectionText extends StatelessWidget {
  const TopSectionText({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: context.setHeight(112)),
            Expanded(
              child: Text(
                "Books For \nEvery Taste.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              )
                  .animate()
                  .fadeIn(
                    duration: 800.milliseconds,
                  )
                  .slideY(
                    begin: -0.3,
                    end: 0,
                    curve: Curves.easeInOut,
                    duration: 800.milliseconds,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
