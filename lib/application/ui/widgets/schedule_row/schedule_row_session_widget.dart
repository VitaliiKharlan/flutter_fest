import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_colors.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/'
    'images.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const ScheduleRowSessionWidget({
    super.key,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: configuration._style.widgetBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 16,
        top: 4,
        right: 4,
        bottom: 16,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _SpeakerWidget(configuration: configuration),
              ),
              _FavoriteWidget(configuration: configuration),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _DescriptionWidget(configuration: configuration),
          ),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _SpeakerWidget({
    super.key,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    const avatarSize = 24.0;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: Image.network(
            configuration.avatarUrl,
            height: avatarSize,
            width: avatarSize,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            configuration.speakerName,
            style: AppTextStyle.bookText.copyWith(
              color: configuration._style.speakerNameColor,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}

class _FavoriteWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _FavoriteWidget({
    super.key,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {},
        icon: Image.asset(configuration._favoriteStyle.favoriteButtonIconColor,
            color: configuration._favoriteStyle.favoriteButtonColor),
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _DescriptionWidget({
    super.key,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        configuration.sessionTitle,
        style: AppTextStyle.steinbeckNormalText.copyWith(
          color: configuration._style.sessionTitleColor,
        ),
      ),
    );
  }
}

class _ScheduleRowSessionWidgetConfigurationProgressStyle {
  final Color widgetBackgroundColor;
  final Color speakerNameColor;
  final Color sessionTitleColor;

  const _ScheduleRowSessionWidgetConfigurationProgressStyle({
    required this.widgetBackgroundColor,
    required this.speakerNameColor,
    required this.sessionTitleColor,
  });
}

class _ScheduleRowSessionWidgetConfigurationFavoriteStyle {
  final Color? favoriteButtonColor;
  final Color? widgetBackgroundGradient;
  final String favoriteButtonIconColor;

  const _ScheduleRowSessionWidgetConfigurationFavoriteStyle({
    required this.favoriteButtonColor,
    required this.widgetBackgroundGradient,
    required this.favoriteButtonIconColor,
  });
}

class ScheduleRowSessionWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String sessionTitle;
  final bool isFavorite;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowSessionWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
        return oncomingStyle;

      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return oncomingStyle;

      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
    }
  }

  _ScheduleRowSessionWidgetConfigurationFavoriteStyle get _favoriteStyle =>
      isFavorite ? isFavoriteStyle : isNotFavoriteStyle;

  const ScheduleRowSessionWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.sessionTitle,
    required this.isFavorite,
    required this.progressStatus,
  });

  static const oncomingStyle =
  _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackgroundColor: AppColors.darkSecondary,
    speakerNameColor: AppColors.darkText,
    sessionTitleColor: Colors.white,
  );

  static const pastStyle = _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackgroundColor: Colors.transparent,
    speakerNameColor: AppColors.darkTextWithOpacity48,
    sessionTitleColor: AppColors.darkText,
  );

  static const isFavoriteStyle =
  _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: AppColors.green,
    widgetBackgroundGradient: AppColors.green,
    favoriteButtonIconColor: AppImages.selectFavoriteIcon,
  );

  static const isNotFavoriteStyle =
  _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: null,
    widgetBackgroundGradient: null,
    favoriteButtonIconColor: AppImages.unselectFavoriteIcon,
  );
}
