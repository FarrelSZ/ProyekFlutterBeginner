import 'package:education_app/constants/icon.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:education_app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/constants/color.dart';
import 'package:education_app/widgets/lesson_card.dart';
import 'package:education_app/models/lessons.dart';

class DetailsScreen extends StatefulWidget {
  final String? title;
  const DetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth <= 360
                  ? 10
                  : 20, // Kurangi padding untuk layar kecil
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Flutter',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: screenWidth <= 360
                                    ? 24
                                    : null, // Sesuaikan ukuran font
                              ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                            child: const Icon(Icons.arrow_back),
                            height: 35,
                            width: 35,
                            onTap: () => Navigator.pop(context)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const CustomVideoPlayer(),
                const SizedBox(height: 10),
                Text(
                  'Fluter',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth <= 360 ? 16 : 18,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Created by Farrel Syach Zahran",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          icFeaturedOutlined,
                          height: 20,
                        ),
                        const Text(
                          '4.8',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '65 Hours',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    const Text(
                      "\$55",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                CustomTabView(
                  index: _selectedTag,
                  changeTab: changeTab,
                ),
                _selectedTag == 0 ? const Playlist() : const Description(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
            onClosing: () {},
            backgroundColor: Colors.white,
            enableDrag: false,
            builder: (context) {
              return const SizedBox(height: 80, child: EnrollBottomSheet());
            }),
      ),
    );
  }
}

class EnrollBottomSheet extends StatelessWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth <= 360 ? 15 : 30),
      child: Row(
        children: [
          CustomIconButton(
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
            height: 45,
            width: 45,
            onTap: () {},
          ),
          SizedBox(
            width: screenWidth <= 360 ? 10 : 20,
          ),
          Expanded(
            child: CustomIconButton(
              color: kPrimaryColor,
              child: Text(
                'Enroll Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth <= 360 ? 16 : 18,
                ),
              ),
              height: 45,
              width: 45,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;

  const CustomTabView({
    Key? key,
    required this.changeTab,
    required this.index,
  }) : super(key: key);

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (22)", "Description"];

  Widget _buildTags(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal:
              screenWidth <= 405 ? 10 : MediaQuery.of(context).size.width * .08,
          vertical: screenWidth <= 360 ? 10 : 15,
        ),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
            fontSize: screenWidth <= 360 ? 14 : 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.all(MediaQuery.of(context).size.width <= 360 ? 10 : 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        itemBuilder: (_, index) {
          return LessonCard(
            lesson: lessonsList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: lessonsList.length,
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override

  /// Builds the UI for the Description widget, returning a container widget.
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text("Build Flutter"),
    );
  }
}
