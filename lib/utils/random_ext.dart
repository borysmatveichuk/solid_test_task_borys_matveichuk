import 'dart:math';

/// Extension for Random class from 'dart:math' lib
///
extension RandomExt on Random {
  /// Generates a non-negative random integer for color in aRGB
  /// a-channel is always 255 (totally opacity)
  int nextRGBColor() {
    // values can be from 0 to 255, we need to include 255, so just add +1
    const int maxRange = 256;

    // alpha channel is always the same
    const int a = 255;

    //                                      A  R  G  B
    int color = a << 24; //               0xFF.00.00.00
    color += nextInt(maxRange) << 16; //  0xFF.RR.00.00
    color += nextInt(maxRange) << 8; //   0xFF.RR.GG.00
    color += nextInt(maxRange); //        0xFF.RR.GG.BB

    return color;
  }
}
