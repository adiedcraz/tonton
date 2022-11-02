import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tonton/app/modules/home/controllers/home_controller.dart';

class SampelResponsiveWidget extends StatelessWidget {
  const SampelResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //return LayoutBuilderWidget();
    //return MediaQueryWidget();
    //return GetXFirstWay();
    //return GetXSecondWay();
    return GetXThirdWay();
  }
}

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 400) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('bawah 400'),
          );
        }

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            'atas 400',
          ),
        );
      },
    );
  }
}

class MediaQueryWidget extends StatelessWidget {
  const MediaQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      alignment: Alignment.center,
      child: AutoSizeText(
        'The text to display The text to displayThe text to displayThe text to display The text to displayThe text to display',
        style: TextStyle(fontSize: 20),
        maxLines: 2,
        minFontSize: 15,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class GetXFirstWay extends GetResponsiveView<HomeController> {
  GetXFirstWay({super.key});

  @override
  Widget? builder() {
    if (screen.isPhone) {
      return const Icon(
        Icons.phone,
        color: Colors.orange,
      );
    }
    if (screen.isDesktop) {
      return const Icon(
        Icons.desktop_windows,
        color: Colors.orange,
      );
    }
    if (screen.isTablet) {
      return const Icon(
        Icons.tablet,
        color: Colors.orange,
      );
    }
    if (screen.isWatch) {
      return const Icon(
        Icons.watch,
        color: Colors.orange,
      );
    }

    return const Icon(
      Icons.phone,
      color: Colors.orange,
    );
  }
}

//Cara-cara lain kenalpasti Reponsive View
class GetXSecondWay extends GetResponsiveView<HomeController> {
  //GetXSecondWay({super.key});
  GetXSecondWay({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget? phone() {
    return const Icon(
      Icons.phone,
      color: Colors.yellow,
    );
  }

  @override
  Widget? desktop() {
    return const Icon(
      Icons.desktop_windows,
      color: Colors.yellow,
    );
  }

  @override
  Widget? tablet() {
    return const Icon(
      Icons.tablet,
      color: Colors.yellow,
    );
  }

  @override
  Widget? watch() {
    return const Icon(
      Icons.watch,
      color: Colors.yellow,
    );
  }
}

class GetXThirdWay extends GetResponsiveView<HomeController> {
  GetXThirdWay({super.key})
      : super(
          settings: const ResponsiveScreenSettings(
            desktopChangePoint: 1200,
            tabletChangePoint: 600,
            watchChangePoint: 300,
          ),
        );

  @override
  Widget? builder() {
    return Text(screen.screenType.name);
  }
}
//Cara-cara lain kenalpasti Reponsive View