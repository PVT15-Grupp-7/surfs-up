import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/pages/authenticate/authenticate.dart';
import 'package:surfs_up/data/app_user_data.dart';

/// Wrapper widget that listens to StreamProvider<AppUser?> from main.dart.
/// Whenever the state of the AppUser changes, the Wrapper will be notified and rebuild.
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return HomePage(title: 'Surfs Up');
    }
  }
}
