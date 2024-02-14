import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_colors.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/dialogs/dialog_widget.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_break_widget.dart';
import 'package:flutter_fest/'
    'application/ui/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/'
    'images.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  void showOverlay(BuildContext context) {
    final configuration = DialogConfiguration(
      title: 'Do you want to receive                           '
          'a reminder 10 minutes before the start of the lecture?',
      actions: [
        DialogActionConfiguration(
          'No',
          () {
            Navigator.of(context).pop();
          },
          true,
        ),
        DialogActionConfiguration(
          'Yes',
          () {},
          false,
        ),
      ],
    );
    DialogWidget.show<void>(context, configuration);
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const _LogoWidget(),
          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: () {
                  showOverlay(context);
                },
                child: const Text('OVERLAY'),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(topInset: topInset),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 2) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                      top: 16,
                      right: 12,
                      bottom: 0,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: ScheduleRowBreakWidget(),
                    ),
                  );
                }
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

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(AppImages.backgroundOnSchedule),
            ),
            Positioned(
              height: 150,
              right: 20,
              bottom: 0,
              child: Image.asset(AppImages.logoOnScheduleRight),
            ),
            Positioned(
              height: 150,
              left: 20,
              bottom: 0,
              child: Image.asset(AppImages.logoOnScheduleLeft),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _height = 56;
  final double topInset;

  _SliverAppBarDelegate({required this.topInset});

  @override
  double get maxExtent => _height + topInset;

  @override
  double get minExtent => _height + topInset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overLapsContent,
  ) {
    return _SectionButtonsWidget(topInset: topInset);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionButtonsWidget extends StatelessWidget {
  final double topInset;

  const _SectionButtonsWidget({
    required this.topInset,
  });

  @override
  Widget build(BuildContext context) {
    const totalItem = 4;
    const itemGradientWidth = 2;
    const halfItemGradientPoint = itemGradientWidth / 2;
    const endGradientPoint =
        totalItem * itemGradientWidth + halfItemGradientPoint;

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: topInset,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          final currentGradientStartPoint =
              halfItemGradientPoint + index * itemGradientWidth;
          final currentGradientEndPoint =
              endGradientPoint - currentGradientStartPoint;
          return Center(
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  elevation: MaterialStateProperty.all(0.0),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-currentGradientStartPoint, 0.0),
                      end: Alignment(currentGradientEndPoint, 0.0),
                      colors: const <Color>[
                        AppColors.green,
                        AppColors.blue,
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Section $index'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
