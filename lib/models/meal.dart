class Meal {
  final String id;
  final String categories;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> foodElements;
  final bool sugarFree;
  final bool pressure_disease;
  final bool kidney_patients;
  final bool gout;

  Meal({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.foodElements,
    required this.sugarFree,
    required this.pressure_disease,
    required this.kidney_patients,
    required this.gout,
  });
}
