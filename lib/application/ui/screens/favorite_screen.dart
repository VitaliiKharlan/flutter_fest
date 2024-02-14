import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_colors.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const _HeaderWidget(),
          const _NotificationControlWidget(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 16,
                    right: 20,
                    bottom: 0,
                  ),
                  child: ScheduleRowWidget.single(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          top: 80,
          right: 20,
          bottom: 0,
        ),
        child: RichText(
          text: TextSpan(
            text: 'My\n',
            style: AppTextStyle.steinbeckHeadItalic
                .copyWith(color: AppColors.whiteWithOpacity88),
            children: <TextSpan>[
              TextSpan(
                text: 'program',
                style: AppTextStyle.steinbeckHeadNormal
                    .copyWith(color: AppColors.whiteWithOpacity88),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationControlWidget extends StatelessWidget {
  const _NotificationControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 28,
          right: 20,
          bottom: 0,
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.darkSecondary,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 12,
                    right: 0,
                    bottom: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Remind me about lectures\n10 minutes before the start',
                      style: AppTextStyle.bookText
                          .copyWith(color: AppColors.whiteWithOpacity88),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 20,
                  bottom: 16,
                ),
                child: Center(
                  child: UniversalCheckBox(value: true, onChanged: (_) {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UniversalCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;

  const UniversalCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const isIOS = true;
    // final isIOS = Platform.isIOS;
    return isIOS
        ? CupertinoSwitch(
      activeColor: AppColors.green,
      trackColor: AppColors.darkText,
      thumbColor: AppColors.darkSecondary,
      value: true,
      onChanged: onChanged,
    )
        : Checkbox(value: value, onChanged: (v) => onChanged(v ?? false));
  }
}
