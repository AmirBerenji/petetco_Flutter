import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(color: Styles.green900),
    );
  }
}
