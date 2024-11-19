import 'package:education_app/constants/color.dart';
import 'package:education_app/models/category.dart';
import 'package:education_app/widgets/category_card.dart';
import 'package:education_app/widgets/circle_button.dart';
import 'package:education_app/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AppBar(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text('Explore Categories',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryList.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth <= 360 ? 1 : 2, // Breakpoint di 360px
            childAspectRatio: screenWidth <= 360 ? 1.5 : 0.8,
            crossAxisSpacing: screenWidth <= 360 ? 10 : 20,
            mainAxisSpacing: screenWidth <= 360 ? 15 : 24,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
            );
          },
        )
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xff886ff2),
              Color(0xff6849ef),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Hello, \nGood Morning',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                CircleButton(
                  icon: Icons.notifications,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchField(),
          ],
        ));
  }
}
