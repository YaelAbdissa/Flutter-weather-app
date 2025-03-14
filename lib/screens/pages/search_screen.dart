import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';
import '../../widgets/famous_city_widget.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/round_text_field_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Pick Location",
              style: TextStyles.h1,
            ),
            Text(
              "Find the area or city that you want to know the detailed weather info at this time",
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: RoundTextFieldWidget(
                    controller: _searchController,
                  ),
                ),
                SizedBox(width: 10),
                LocationIcon(),
              ],
            ),
            SizedBox(height: 30),
            FamousCityWidget(),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
