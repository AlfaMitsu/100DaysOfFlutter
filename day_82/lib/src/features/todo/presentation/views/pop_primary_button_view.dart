import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';
import '../widgets/bottom_navigator.dart';

class PopPrimaryButtonView extends StatelessWidget {
  final PageController controller;
  const PopPrimaryButtonView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          SvgPicture.asset(
              'lib/src/resources/assets/svg/heading_primary_btns.svg'),
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          NeoPopButton(
            color: kPrimaryButtonColor,
            depth: kButtonDepth,
            animationDuration: kButtonAnimationDuration,
            buttonPosition: Position.bottomRight,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'lib/src/resources/assets/svg/cta_text_primary.svg'),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          NeoPopButton(
            color: kPrimaryButtonColor,
            parentColor: kSecondaryButtonLightColor,
            depth: kButtonDepth,
            animationDuration: kButtonAnimationDuration,
            buttonPosition: Position.center,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'lib/src/resources/assets/svg/cta_text_primary.svg'),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                flex: 2,
                child: SizedBox(),
              ),
              NeoPopButton(
                color: kPrimaryButtonColor,
                depth: kButtonDepth,
                animationDuration: kButtonAnimationDuration,
                buttonPosition: Position.bottomRight,
                onTapUp: () => HapticFeedback.lightImpact(),
                onTapDown: () => HapticFeedback.lightImpact(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  child: SvgPicture.asset(
                      'lib/src/resources/assets/svg/cta_text_primary.svg'),
                ),
              ),
              const SizedBox(width: 25),
              NeoPopButton(
                color: kPrimaryButtonColor,
                parentColor: kSecondaryButtonLightColor,
                depth: kButtonDepth,
                animationDuration: kButtonAnimationDuration,
                buttonPosition: Position.center,
                onTapUp: () => HapticFeedback.lightImpact(),
                onTapDown: () => HapticFeedback.lightImpact(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  child: SvgPicture.asset(
                      'lib/src/resources/assets/svg/cta_text_primary.svg'),
                ),
              ),
              const Flexible(
                child: SizedBox(),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          NeoPopButton(
            color: kPrimaryButtonColor,
            parentColor: kSecondaryButtonLightColor,
            depth: kButtonDepth,
            animationDuration: kButtonAnimationDuration,
            buttonPosition: Position.center,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 10,
              ),
              child: SvgPicture.asset(
                  'lib/src/resources/assets/svg/cta_text_primary.svg'),
            ),
          ),
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          BottomNavigator(
            onLeftTap: () => controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            onRightTap: () => controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
