import 'package:flutter/material.dart';

import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/themes/app_theme.dart';
import 'package:flutter_fest/images.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxScreenWidth),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 200,
              child: MapSurpriseWidget(
                scrollController: _scrollController,
              ),
            ),
            CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              controller: _scrollController,
              slivers: const [
                _HeaderWidget(),
                _GeolocationWidget(),
              ],
            ),
          ],
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

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 80,
          right: 20,
          bottom: 20,
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Do you remember\n',
              style: AppTextStyle.steinbeckHeadItalic
                  .copyWith(color: AppColors.whiteWithOpacity88),
              children: <TextSpan>[
                TextSpan(
                  text: 'how it all began?',
                  style: AppTextStyle.steinbeckHeadNormal
                      .copyWith(color: AppColors.whiteWithOpacity88),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GeolocationWidget extends StatelessWidget {
  const _GeolocationWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 480,
        child: Center(
          child: Image.asset(AppImages.geolocation),
        ),
      ),
    );
  }
}

class MapSurpriseWidget extends StatefulWidget {
  final ScrollController scrollController;

  const MapSurpriseWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<MapSurpriseWidget> createState() => _MapSurpriseWidget();
}

class _MapSurpriseWidget extends State<MapSurpriseWidget> {
  late ScrollController _scrollController;
  var _mapImageScale = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _scrollController.addListener(_onChangeScrollOffset);
  }

  @override
  void didUpdateWidget(covariant MapSurpriseWidget oldWidget) {
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
      scale: _mapImageScale,
      child: Image.asset(AppImages.locationSurprise),
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
        _mapImageScale = offset / 100;
      });
    }
  }
}
