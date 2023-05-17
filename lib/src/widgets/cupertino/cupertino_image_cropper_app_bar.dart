import 'package:croppy/src/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoImageCropperAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const CupertinoImageCropperAppBar({
    super.key,
    required this.controller,
  });

  final CroppableImageController controller;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) => SafeArea(
          top: true,
          child: Stack(
            children: [
              Row(
                children: [
                  CupertinoButton(
                    onPressed: controller.onMirrorHorizontal,
                    minSize: 44.0,
                    child: const CupertinoFlipHorizontalIcon(
                      color: CupertinoColors.systemGrey2,
                      size: 24.0,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: controller.onRotateCCW,
                    minSize: 44.0,
                    child: const Icon(
                      CupertinoIcons.rotate_left_fill,
                      color: CupertinoColors.systemGrey2,
                    ),
                  ),
                  const Spacer(),
                  // CupertinoButton(
                  //   onPressed: () {},
                  //   minSize: 44.0,
                  //   child: const Icon(
                  //     Icons.aspect_ratio_rounded,
                  //     color: CupertinoColors.systemGrey2,
                  //   ),
                  // ),
                ],
              ),
              Center(
                child: AnimatedOpacity(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 100),
                  opacity: controller.canReset ? 1.0 : 0.0,
                  child: CupertinoButton(
                    onPressed: controller.reset,
                    child: Text(
                      'RESET',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navActionTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
