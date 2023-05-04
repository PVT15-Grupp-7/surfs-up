import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/colors.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kSecondaryColor,
      automaticallyImplyLeading: false,
      flexibleSpace: Image.asset('assets/images/surfs_up_logo.png', scale: 2),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(preferredSize.height),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            _backButton(context),
            _title(),
          ],
        ),
      ),
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 40.0,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  Center _title() {
    return Center(
      child: Text(
        title,
        style: CustomTextStyle.title1,
      ),
    );
  }
}
