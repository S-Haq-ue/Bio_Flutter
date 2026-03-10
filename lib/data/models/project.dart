class Project {
  final String title;
  final String category;
  final String description;
  final String? imageUrl;
  final List<String> tools;

  const Project({
    required this.title,
    required this.category,
    required this.description,
    this.imageUrl,
    required this.tools,
  });
}
