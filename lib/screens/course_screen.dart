import 'package:education_app/models/course.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/widgets/course_container.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
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
                          'Development',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 25,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return CourseCotainer(
                        course: courseList[index],
                      );
                    },
                    separatorBuilder: (context, _) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: courseList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
