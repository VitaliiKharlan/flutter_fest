import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_colors.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/'
    'application/ui/themes/app_theme.dart';
import 'package:flutter_fest/'
    'images.dart';

class SessionDetailsScreen extends StatefulWidget {
  const SessionDetailsScreen({super.key});

  @override
  State<SessionDetailsScreen> createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      floatingActionButton: const _AddToFavoriteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxScreenWidth),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 300,
                child: SessionDetailsSurpriseWidget(
                  scrollController: _scrollController,
                ),
              ),
              ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                controller: _scrollController,
                padding: EdgeInsets.zero,
                children: const [
                  _HeaderWidget(),
                  _SessionTitleWidget(),
                  _SessionDescriptionWidget(),
                  _ScheduleInfoWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class SessionDetailsSurpriseWidget extends StatefulWidget {
  final ScrollController scrollController;

  const SessionDetailsSurpriseWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<SessionDetailsSurpriseWidget> createState() => _SessionDetailsSurpriseWidgetState();
}

class _SessionDetailsSurpriseWidgetState extends State<SessionDetailsSurpriseWidget> {
  late ScrollController _scrollController;
  var _easterImageScale = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _scrollController.addListener(_onChangeScrollOffset);
  }

  @override
  void didUpdateWidget(covariant SessionDetailsSurpriseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!identical(oldWidget.scrollController, oldWidget.scrollController)) {
      _scrollController.removeListener(_onChangeScrollOffset);
      _scrollController = widget.scrollController;
      _scrollController.addListener(_onChangeScrollOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _easterImageScale,
      child: Image.asset(AppImages.sessionDetailsSurprise),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onChangeScrollOffset);
    super.dispose();
  }

  void _onChangeScrollOffset() {
    final offset =
        _scrollController.offset - _scrollController.position.maxScrollExtent;
    if (offset > 0) {
      setState(() {
        _easterImageScale = offset / 100;
      });
    }
  }
}

class _AddToFavoriteWidgetConfiguration {
  final String text;
  final String icon;
  final Color iconColor;
  final Color? backgroundColor;
  final LinearGradient? backGroundGradient;

  static const favorite = _AddToFavoriteWidgetConfiguration(
    text: 'In the program',
    icon: AppImages.selectFavoriteIcon,
    iconColor: AppColors.green,
    backgroundColor: AppColors.darkSecondary,
    backGroundGradient: null,
  );

  static const disFavorite = _AddToFavoriteWidgetConfiguration(
    text: 'To my favorite',
    icon: AppImages.unselectFavoriteIcon,
    iconColor: AppColors.whiteWithOpacity88,
    backgroundColor: null,
    backGroundGradient: LinearGradient(
      colors: <Color>[
        AppColors.green,
        AppColors.blue,
      ],
    ),
  );

  const _AddToFavoriteWidgetConfiguration({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.backGroundGradient,
  });
}

class _AddToFavoriteWidget extends StatelessWidget {
  final isFavorite = false;

  const _AddToFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final configuration = isFavorite
        ? _AddToFavoriteWidgetConfiguration.favorite
        : _AddToFavoriteWidgetConfiguration.disFavorite;
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
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
                gradient: configuration.backGroundGradient,
                color: configuration.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 24,
                      child: Image.asset(
                        configuration.icon,
                        color: configuration.iconColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(configuration.text),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            AppImages.backgroundSessionDetails,
            fit: BoxFit.fill,
          ),
        ),
        const _SpeakerInfoWidget(),
      ],
    );
  }
}

class _SpeakerInfoWidget extends StatelessWidget {
  const _SpeakerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 400 / 320,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 84),
                Flexible(
                  flex: 48,
                  child: Text(
                    'Bethany\nBenz',
                    style: AppTextStyle.speakerName
                        .copyWith(color: AppColors.whiteWithOpacity88),
                  ),
                ),
                const Spacer(flex: 12),
                Flexible(
                  flex: 48,
                  child: Text(
                    'American porn actress\nof Ukrainian-Nigerian\norigin',
                    style: AppTextStyle.bookTextItalic
                        .copyWith(color: AppColors.whiteWithOpacity88),
                  ),
                ),
                const Spacer(flex: 24),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(AppImages.speakerSessionDetails),
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionTitleWidget extends StatelessWidget {
  const _SessionTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 32,
        right: 20,
      ),
      child: Text(
        'About the dangers of smoking',
        style: AppTextStyle.steinbeckText
            .copyWith(color: AppColors.whiteWithOpacity88),
      ),
    );
  }
}

class _SessionDescriptionWidget extends StatelessWidget {
  const _SessionDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 16,
        right: 20,
      ),
      child: Text(
        'Bethany is now a colorful American porn actress '
        'of Ukrainian-Nigerian origin.'
        '\nBethany has a huge fan following, '
        'and her videos have been viewed many times.',
        style:
            AppTextStyle.bookText.copyWith(color: AppColors.whiteWithOpacity88),
      ),
    );
  }
}

class _ScheduleInfoWidget extends StatelessWidget {
  const _ScheduleInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 24,
      ),
      child: Row(
        children: [
          _ScheduleInfoElementWidget(
            label: 'Start',
            text: '8:00',
          ),
          SizedBox(width: 16),
          _ScheduleInfoElementWidget(
            label: 'Section',
            text: '№1',
          ),
        ],
      ),
    );
  }
}

class _ScheduleInfoElementWidget extends StatelessWidget {
  final String label;
  final String text;

  const _ScheduleInfoElementWidget({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 88,
      decoration: const BoxDecoration(
        color: AppColors.darkSecondary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: GradientBorder(
        borderWidth: 2,
        radius: 16,
        gradient: const RadialGradient(
          center: Alignment.bottomCenter,
          radius: 1.0,
          colors: [
            Color(0xFF50AF64),
            Color(0xFF3D734D),
            Color(0xFF3D734D),
            Color(0xFF206D82),
          ],
          stops: [
            0.2,
            0.4,
            0.6,
            0.8,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            top: 12,
            right: 20,
            bottom: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    AppTextStyle.snackText.copyWith(color: AppColors.darkText),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                text,
                style: AppTextStyle.timeText
                    .copyWith(color: AppColors.whiteWithOpacity88),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBorder extends StatelessWidget {
  final double borderWidth;
  final double radius;
  final Gradient gradient;
  final Widget child;

  const GradientBorder({
    super.key,
    required this.borderWidth,
    required this.radius,
    required this.gradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientPainter(
        borderWidth: borderWidth,
        radius: radius,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double borderWidth;
  final double radius;
  final Gradient gradient;

  _GradientPainter({
    super.repaint,
    required this.borderWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    final Rect outerRect = Offset.zero & size;
    final outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    final Rect innerRect = Rect.fromLTWH(borderWidth, borderWidth,
        size.width - borderWidth * 2, size.height - borderWidth * 2);
    final innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - borderWidth));

    // apply gradient shader
    final paint = Paint()..shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    final Path outerPath1 = Path()..addRRect(outerRRect);
    final Path innerPath2 = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, outerPath1, innerPath2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
