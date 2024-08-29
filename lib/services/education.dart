class Education {
  final String course;
  final String location;
  final String? gPA;
  Education({required this.course, required this.location, this.gPA});
}

List<Education> educationData = [
  Education(
    course: "B-Tech INFORMATION TECHNOLOGY",
    location: "Govt Engineering Collage Idukki",
    gPA: "CGPA 7.87",
  ),
  Education(
    course: "Bug Bounty Hunting & Web Security Testing",
    location: "Udemy",
  ),
  Education(
    course: "HSE",
    location: "VHM HSS MORAYUR",
    gPA: "8.94",
  ),
];
