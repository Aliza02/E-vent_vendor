import 'package:flutter/animation.dart';

class onboarding_model {
  onboarding_model(
      {required this.heading,
      required this.description,
      required this.image,
      required this.color1,
      required this.color2});
  String heading;
  String description;
  String image;
  int color1;
  int color2;
}

List<onboarding_model> content = [
  onboarding_model(
      heading: 'Growth in sales with broader customer reach',
      description:
          'Now reach out to more customers through this platform and see a tremendous increase in sales',
      image: 'assets/images/sales.png',
      color1: 0xFFF57366,
      color2: 0xFFFFAF4A),
  onboarding_model(
      heading: 'Manage your bookings and availibility',
      description:
          'With availability feature, easily track all your bookings and never miss on any order',
      image: 'assets/images/booking.png',
      color1: 0xFFF45C1C1,
      color2: 0xFFFF57366),
  onboarding_model(
      heading: 'Chat with customers',
      description:
          'Chat with customers, listen to their customization requests, decide on prices and much more',
      image: 'assets/images/Chat support.png',
      color1: 0xFFFFFAF4E,
      color2: 0xFFF45C1C1),
];
