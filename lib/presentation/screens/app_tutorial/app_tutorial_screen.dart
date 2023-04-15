import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const slides = <SlideInfo>[
  SlideInfo(
    title: 'Search food',
    caption: 'Amet irure nisi ad nulla exercitation.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Deliver the food',
    caption: 'Tempor voluptate nisi laboris ipsum excepteur excepteur deserunt.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Enjoy the food',
    caption: 'Id eu voluptate culpa mollit incididunt anim labore anim culpa qui sit.',
    imageUrl: 'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final page = pageController.page ?? 0;

      if (!isLastPage && page >= slides.length - 1.5) {
        setState(() => isLastPage = true);
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(title: slide.title, caption: slide.caption, imageUrl: slide.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 30,
            child: TextButton(child: const Text('Skip'), onPressed: () => context.pop()),
          ),
          if (isLastPage)
            Positioned(
              bottom: 20,
              right: 20,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Start'),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
