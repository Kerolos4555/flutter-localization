import 'package:flutter/material.dart';
import 'package:flutter_localization/routes/route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: SizedBox(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              AppLocalizations.of(context)!.aboutUs,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
