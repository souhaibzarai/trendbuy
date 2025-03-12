import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../domain/entities/product.dart';
import '../cubit/image_slide_cubit.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';

class ImagesView extends StatelessWidget {
  ImagesView({
    super.key,
    required ProductEntity productEntity, //
  }) : _product = productEntity;

  final PageController _controller = PageController();
  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSlideCubit(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: 250,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 215,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(AppConstants.border), //
              ),
              child: Builder(
                builder: (context) {
                  return PageView.builder(
                    onPageChanged: (index) {
                      context.read<ImageSlideCubit>().updateImageIndex(index);
                    },
                    controller: _controller,
                    itemCount:
                        _product.images!.length >= 8
                            ? 8
                            : _product.images!.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        _product.images![index],
                        fit: BoxFit.cover, //
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutCirc,
                  );
                  context.read<ImageSlideCubit>().updateImageIndex(index);
                },
                controller: _controller,
                count:
                    _product.images!.length >= 8
                        ? 8
                        : _product.images!.length, //
                effect: CustomizableEffect(
                  dotDecoration: DotDecoration(
                    color: AppColors.fillColor,
                    width: 20,
                    height: 7,
                    rotationAngle: 180,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  activeDotDecoration: DotDecoration(
                    color: AppColors.tertiaryColor,
                    width: 35,
                    height: 7,
                    rotationAngle: 0,
                    borderRadius: BorderRadius.circular(2),
                    verticalOffset: -2,
                    dotBorder: const DotBorder(
                      width: .8,
                      color: AppColors.tertiaryColor,
                      padding: 2, //
                    ),
                  ),
                  spacing: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
