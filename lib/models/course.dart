class Course {
  String author;
  double completedPercentage;
  String name;
  String imageAsset;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.imageAsset,
  });
}

var courseList = [
  Course(
    author: "Farrel",
    completedPercentage: .85,
    name: "Flutter for Beginner",
    imageAsset: 'assets/images/flutter.jpg',
  ),
  Course(
    author: "Farrel",
    completedPercentage: .75,
    name: "React Native for Beginner",
    imageAsset: 'assets/images/react.jpg',
  ),
  Course(
    author: "Farrel",
    completedPercentage: .60,
    name: "Node.js for Beginner",
    imageAsset: 'assets/images/node.png',
  ),
];
