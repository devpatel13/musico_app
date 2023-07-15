import '../models/category.dart';

class CategoryOperations {
  //private constructor is created so that we can't instantiate these class.
  CategoryOperations._(){}
  static List<Category> getCategories() {
    return <Category>[
      Category('Top songs',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSskCxNR-FMyc1PtMZ8K0oMJea700F02GpfHQ&usqp=CAU'),
      Category('Old Hits',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSskCxNR-FMyc1PtMZ8K0oMJea700F02GpfHQ&usqp=CAU'),
      Category('Remix songs',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSskCxNR-FMyc1PtMZ8K0oMJea700F02GpfHQ&usqp=CAU'),
      Category('Top songs',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSskCxNR-FMyc1PtMZ8K0oMJea700F02GpfHQ&usqp=CAU'),
      Category('Old Hits',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSskCxNR-FMyc1PtMZ8K0oMJea700F02GpfHQ&usqp=CAU'),
      Category('Remix songs',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSskCxNR-FMyc1PtMZ8K0oMJea700F02GpfHQ&usqp=CAU'),

    ];
  }
}
