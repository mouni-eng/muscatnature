import 'package:flutter/cupertino.dart';
import 'package:muscatnature/size_config.dart';

const Color kPrimaryColor = Color(0xFF007BFF);
const Color kSecondaryColor = Color(0xFF9EA7B2);
BoxShadow boxShadow = BoxShadow(
  color: const Color(0xFF000000).withOpacity(0.06), //color of shadow
  //spread radius
  blurRadius: width(30), // blur radius
  offset: const Offset(0, 4),
);

EdgeInsets padding = EdgeInsets.symmetric(
  horizontal: width(16),
  vertical: height(16),
);

