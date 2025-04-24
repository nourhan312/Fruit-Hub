import 'package:flutter/material.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/fruit.png'),
        radius: 30,
      ),
      title: Text(
        'welcome_back'.tr(context),
        style: TextStyles.regular16,
      ),
      subtitle: Text(
        'Nourhan',
        style: TextStyles.regular22,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
    );
  }
}
