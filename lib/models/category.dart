class Category {
  String name;
  int noOfCourse;
  String imageAsset;

  Category(
      {required this.name, required this.noOfCourse, required this.imageAsset});
}

var categoryList = [
  Category(
    name: 'Development',
    noOfCourse: 55,
    imageAsset: 'assets/images/laptop.jpg',
  ),
  Category(
    name: 'Accounting',
    noOfCourse: 20,
    imageAsset: 'assets/images/accounting.jpg',
  ),
  Category(
    name: 'Photogaraphy',
    noOfCourse: 15,
    imageAsset: 'assets/images/photography.jpg',
  ),
  Category(
    name: 'Product Design',
    noOfCourse: 25,
    imageAsset: 'assets/images/design.jpg',
  )
];
