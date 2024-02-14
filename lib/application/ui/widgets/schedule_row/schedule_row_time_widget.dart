import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_colors.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_text_style.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  final ScheduleRowTimeWidgetConfiguration configuration;

  const ScheduleRowTimeWidget({
    super.key,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    AppTextStyle.bookTextSmall;

    return SizedBox(
      width: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                configuration.startTime,
                style: AppTextStyle.bookTextSmall.copyWith(
                  color: configuration._style.startColor,
                ),
                maxLines: 1,
              ),
              const Spacer(),
              Text(
                configuration.endTime,
                style: AppTextStyle.bookTextSmall.copyWith(
                  color: configuration._style.endColor,
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            children: [
              Expanded(
                child: _DividerWidget(
                    color: configuration._style.startColor,
                    position: _DividerWidgetPosition.top),
              ),
              Expanded(
                child: _DividerWidget(
                    color: configuration._style.endColor,
                    position: _DividerWidgetPosition.bottom),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _DividerWidgetPosition {
  top,
  bottom,
}

class _DividerWidget extends StatelessWidget {
  final Color color;
  final _DividerWidgetPosition position;

  const _DividerWidget({
    super.key,
    required this.color,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(1.0);
    final borderRadius = position == _DividerWidgetPosition.top
        ? const BorderRadius.only(topLeft: radius, topRight: radius)
        : const BorderRadius.only(bottomLeft: radius, bottomRight: radius);

    return SizedBox(
      width: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Container(),
      ),
    );
  }
}

class _ScheduleRowTimeWidgetConfigurationProgressStyle {
  final Color startColor;
  final Color endColor;

  const _ScheduleRowTimeWidgetConfigurationProgressStyle({
    required this.startColor,
    required this.endColor,
  });
}

class ScheduleRowTimeWidgetConfiguration {
  final String startTime;
  final String endTime;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowTimeWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
        return oncomingStyle;

      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return inProgressStyle;

      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
    }
  }

  ScheduleRowTimeWidgetConfiguration({
    required this.startTime,
    required this.endTime,
    required this.progressStatus,
  });

  static const oncomingStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.whiteWithOpacity72,
    endColor: AppColors.whiteWithOpacity72,
  );

  static const pastStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.darkTextWithOpacity72,
    endColor: AppColors.darkTextWithOpacity72,
  );

  static const inProgressStyle =
  _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.darkTextWithOpacity72,
    endColor: AppColors.greenWithOpacity72,
  );
}
