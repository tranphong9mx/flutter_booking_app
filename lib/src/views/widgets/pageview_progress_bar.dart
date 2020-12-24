import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/views/widgets/step_by_step_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewProgressBar extends StatelessWidget {
  PageViewProgressBar(
      {this.backPageView, this.nextPageView, this.totalStep, this.currentStep});
  final Function backPageView;
  final Function nextPageView;
  final int totalStep;
  final int currentStep;

  static const _BACKWARD_ICON =
      'assets/icons/signin_screen/bp_backward_icon.svg';
  static const _FORWARD_TITLE = 'Next';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: backPageView,
            child:
                Container(width: 26, child: SvgPicture.asset(_BACKWARD_ICON))),
        StepByStepProgressBar(totalStep: totalStep, currentStep: currentStep),
        GestureDetector(
          onTap: nextPageView,
          child: Text(_FORWARD_TITLE,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
