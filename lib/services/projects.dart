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
    image: 'assets/images/hipay.jpeg',
    title: "Hipay Payment Solutions",
    subtitle: "A recharge application for indian and internation mobile,d2h and card recharge.",
    androidLink: "https://play.google.com/store/apps/details?id=ae.hipay",
    iosLink: "https://apps.apple.com/in/app/hipay-payment-services/id6498886922",
    isPublished: true,
  ),
  ProjectModel(
    image: 'assets/images/igold.jpeg',
    title: "I Gold",
    subtitle: "An application providing real-time currency, bullion, and commodity rates.",
    isPublished: false,
  ),
  ProjectModel(
    image: 'assets/images/payinpay.jpeg',
    title: "PayIn Pay",
    subtitle: "A recharge application for Indian and international mobile, DTH, and card services.",
    isPublished: false,
  ),
];
List<ProjectModel> personalProjects = [
  ProjectModel(
    image: 'assets/images/snap.jpeg',
    title: "Snap Shield",
    subtitle:
        "A secure social media platform powered by ML models to detect and protect sensitive and confidential data shared by users.",
    gitLink: "https://github.com/S-Haq-ue/Snap-shield.git",
  ),
  ProjectModel(
    image: 'assets/images/chatapp.jpeg',
    title: "Chat application",
    subtitle: "A chat application where users can participate in group chats.",
    gitLink: "https://github.com/S-Haq-ue/chat_app.git",
  ),
  ProjectModel(
    image: 'assets/images/bio.png',
    title: "Portfolio - Web",
    subtitle: "Current Application",
    gitLink: "https://github.com/S-Haq-ue/Bio_Flutter.git",
  ),
  ProjectModel(
    image: 'assets/images/factory.jpeg',
    title: "Factory Outlet",
    subtitle:
        "An e-commerce application that enables users to browse, search, sell, and purchase a wide range of products online.",
    gitLink: "https://github.com/S-Haq-ue/factory_outlet.git",
  ),
  ProjectModel(
    image: 'assets/images/meals.jpeg',
    title: "Meals Application",
    subtitle: "A menu application that can be used as a cooking manual for various types of food.",
    gitLink: "https://github.com/S-Haq-ue/Meals.git",
  ),
];
