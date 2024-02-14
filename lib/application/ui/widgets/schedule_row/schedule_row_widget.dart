import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/navigation/main_navigation.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_session_widget.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_time_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({super.key});

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleRowMultiSessionWidget(key: key);
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const progressStatus = ScheduleRowWidgetConfigurationProgressStatus.current;
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl: 'https://cameralabs.org/media/k2/items/cache/'
          '4e0e497af18493ff40fd90ed7fd4876f_L.jpg',
      speakerName: 'Emma Hix',
      sessionTitle: 'About the dangers of smoking',
      isFavorite: true,
      progressStatus: progressStatus,
    );

    final configurationExample = ScheduleRowTimeWidgetConfiguration(
      startTime: '8:00',
      endTime: '10:30',
      progressStatus: progressStatus,
    );
    return Stack(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              ScheduleRowTimeWidget(configuration: configurationExample),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: ScheduleRowSessionWidget(
                  configuration: configuration,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () =>
                  Navigator.of(context).pushNamed(Screens.sessionDetails),
            ),
          ),
        )
      ],
    );
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum ScheduleRowWidgetConfigurationProgressStatus {
  past,
  current,
  oncoming,
}
