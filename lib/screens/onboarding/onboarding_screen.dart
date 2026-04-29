import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/primary_button.dart';
import '../../common/widgets/progress_dots.dart';
import '../../controller/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.skip,
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.onboardingPages.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    final page = controller.onboardingPages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          controller.iconFromName(page.iconName),
                          size: 120,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 28),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Obx(
                () => ProgressDots(
                  total: controller.onboardingPages.length,
                  currentIndex: controller.currentPage.value,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => PrimaryButton(
                  title: controller.isLastPage ? 'Get Started' : 'Next',
                  onPressed: controller.nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
