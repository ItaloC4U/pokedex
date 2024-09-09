import 'package:flutter/material.dart';

const large = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const medium = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const small = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const textTheme = TextTheme(
  bodyLarge: medium,
  bodyMedium: medium,
  bodySmall: medium,
  displayLarge: medium,
  displayMedium: medium,
  displaySmall: medium,
  headlineLarge: large,
  headlineMedium: medium,
  headlineSmall: small,
  labelLarge: medium,
  labelMedium: medium,
  labelSmall: medium,
  titleLarge: large,
  titleMedium: medium,
  titleSmall: small,
);
