import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double space;
  final bool _isVertical;
  final bool _forceSquare;

  /// To return [SizedBox] widget by default vertical space
  /// you need horizontal space use [Space.horizontal] or set
  /// [isVertical] to false
  const Space({required this.space, bool? isVertical, super.key})
      : _isVertical = isVertical ?? true,
        _forceSquare = false;

  ///To return [SizedBox]  vertical space
  const Space.vertical(this.space, {super.key})
      : _isVertical = true,
        _forceSquare = false;

  ///To return [SizedBox]  horizontal space
  const Space.horizontal(this.space, {super.key})
      : _isVertical = false,
        _forceSquare = false;

  ///To add empty space
  const Space.empty({super.key})
      : _isVertical = false,
        _forceSquare = false,
        space = 0.0;

  ///To add square space h & v space
  const Space.square(this.space, {super.key})
      : _isVertical = false,
        _forceSquare = true;

  @override
  Widget build(BuildContext context) {
    if (_forceSquare) return _squareSpace;
    return _isVertical ? _vSpace : _hSpace;
  }

  Widget _box({double? w, double? h}) => SizedBox(width: w, height: h);

  Widget get _vSpace => _box(h: space);
  Widget get _hSpace => _box(w: space);
  Widget get _squareSpace => _box(w: space, h: space);
} //end Space Widget
