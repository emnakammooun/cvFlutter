class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/ecommerce.jpg',
    title: 'Online Shop Web App',
    subtitle:
        'This is a responsive online shop web application for fashion ',
    webLink:
        'https://play.google.com/store/apps/details?id=co.thanos.dtnah&hl=en&gl=US'
  ),
  ProjectUtils(
    image: 'assets/projects/bubble.jpg',
    title: 'Bubble Game',
    subtitle:
        'This is a bubble game for children under the age of 12',
    webLink: 'https://play.google.com/store/apps/details?id=com.link.bubble&hl=en&gl=US',
  ),

];
