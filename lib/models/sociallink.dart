import 'package:traveling_app_flutter/utils/app_assets.dart';

class SocialLink {
  final String title;
  final String subtitle;
  final String image;

  SocialLink({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<SocialLink> social = [
  SocialLink(title: 'Facebook', subtitle: 'Limited time paid promotion', image: AppAssets.socialSaringtitle1),
  SocialLink(title: 'Twitter', subtitle: 'Limited time paid promotion', image: AppAssets.socialSaringtitle2),
  SocialLink(title: 'Instagram', subtitle: 'Promote your blog for free', image: AppAssets.socialSaringtitle3),
  SocialLink(title: 'Pinterest', subtitle: 'Promote your blog for free', image: AppAssets.socialSaringtitl4),
];
