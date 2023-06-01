import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

/// Custom widget to display different attributes of a WeatherData object within a ListTile.
class ExpandedItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemText;

  const ExpandedItem({Key? key, required this.itemIcon, required this.itemText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            itemIcon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            itemText,
            style: CustomTextStyle.tileTextStyle,
          ),
        ],
      ),
    );
  }
}
