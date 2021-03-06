/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Battery.svg
  SvgGenImage get battery => const SvgGenImage('assets/icons/Battery.svg');

  /// File path: assets/icons/Car.svg
  SvgGenImage get car => const SvgGenImage('assets/icons/Car.svg');

  /// File path: assets/icons/Charge.svg
  SvgGenImage get charge => const SvgGenImage('assets/icons/Charge.svg');

  /// File path: assets/icons/FL_Tyre.svg
  SvgGenImage get fLTyre => const SvgGenImage('assets/icons/FL_Tyre.svg');

  /// File path: assets/icons/Lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/icons/Lock.svg');

  /// File path: assets/icons/Temp.svg
  SvgGenImage get temp => const SvgGenImage('assets/icons/Temp.svg');

  /// File path: assets/icons/Tyre.svg
  SvgGenImage get tyre => const SvgGenImage('assets/icons/Tyre.svg');

  /// File path: assets/icons/coolShape.svg
  SvgGenImage get coolShape => const SvgGenImage('assets/icons/coolShape.svg');

  /// File path: assets/icons/door_lock.svg
  SvgGenImage get doorLock => const SvgGenImage('assets/icons/door_lock.svg');

  /// File path: assets/icons/door_unlock.svg
  SvgGenImage get doorUnlock =>
      const SvgGenImage('assets/icons/door_unlock.svg');

  /// File path: assets/icons/heatShape.svg
  SvgGenImage get heatShape => const SvgGenImage('assets/icons/heatShape.svg');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Cool_glow_2.png
  AssetGenImage get coolGlow2 =>
      const AssetGenImage('assets/images/Cool_glow_2.png');

  /// File path: assets/images/Hot_glow_4.png
  AssetGenImage get hotGlow4 =>
      const AssetGenImage('assets/images/Hot_glow_4.png');

  /// File path: assets/images/flutter_day.jpg
  AssetGenImage get flutterDay =>
      const AssetGenImage('assets/images/flutter_day.jpg');

  /// File path: assets/images/loadingpoint.gif
  AssetGenImage get loadingpoint =>
      const AssetGenImage('assets/images/loadingpoint.gif');
}

class Assets {
  Assets._();

  static const AssetGenImage iconDevelopment =
      AssetGenImage('assets/icon_development.png');
  static const AssetGenImage iconProduction =
      AssetGenImage('assets/icon_production.png');
  static const AssetGenImage iconProductionAndroid =
      AssetGenImage('assets/icon_production_android.png');
  static const AssetGenImage iconStaging =
      AssetGenImage('assets/icon_staging.png');
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
