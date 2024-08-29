class ProjectModel {
  final String? title;
  final String? image;
  final String? subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? gitLink;
  final bool isPublished;
  ProjectModel({
    this.gitLink,
    this.image,
    this.subtitle,
    this.androidLink,
    this.iosLink,
    this.title,
    this.isPublished = false,
  });
}

List<ProjectModel> workProjects = [
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
    gitLink: "hdfgdfff",
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
    gitLink: "hdfgdfff",
    isPublished: true
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
  )
];
List<ProjectModel> personalProjects = [
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
  ),
  ProjectModel(
    image: 'assets/images/2.png',
    title: "Hipay Payment Solutions",
    subtitle: "ghgfghfgdf",
    androidLink: "hghgfdjf",
    iosLink: "hdfgdfff",
    isPublished: true
  )
];
