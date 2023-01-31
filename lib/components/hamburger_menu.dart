import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/themes/theme_color.dart';
import 'package:url_launcher/url_launcher.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ThemeColors.drawerColor1,
            ThemeColors.drawerColor2,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: FractionalOffset.topCenter,
              child: Column(
                children: [
                  const Divider(),
                  Image.asset(
                    "assets/images/pokedex_logo.png",
                    height: 75.0,
                    width: 270.0,
                  ),
                  const Text(
                    "by Daniel Moya da Silva",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: [
                const Divider(),
                ListTile(
                  title: InkWell(
                    onTap: () {
                      final Uri launchUri =
                          Uri.https('github.com', '/Dms98Br/pokedex_flutter');
                      _launchInBrowser(launchUri);
                    },
                    child: const Text(
                      "Project repository",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          final Uri launchUri = Uri.https(
                            'br.linkedin.com',
                            '/in/daniel-moya-da-silva-dev',
                          );
                          _launchInBrowser(launchUri);
                        },
                        child: SvgPicture.asset(
                          "assets/images/linkedin.svg",
                          height: 46.0,
                          width: 46.0,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final Uri launchUri =
                              Uri.https('github.com', '/Dms98Br');
                          _launchInBrowser(launchUri);
                        },
                        child: SvgPicture.asset(
                          "assets/images/github.svg",
                          height: 46.0,
                          width: 46.0,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
