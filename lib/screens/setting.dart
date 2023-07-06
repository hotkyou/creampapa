import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromPlatform = useMemoized(PackageInfo.fromPlatform);
    final snapshot = useFuture(fromPlatform);
    if (!snapshot.hasData) {
      return const SizedBox.shrink();
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('設定'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  title: const Text('設定１'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.mail,
                    color: Colors.lightBlue,
                  ),
                  title: const Text('設定２'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  title: const Text('設定３'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(
                    Icons.local_police,
                    color: Colors.grey,
                  ),
                  title: const Text('設定４'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  title: const Text('設定５'),
                  onPressed: (context) {},
                ),
                SettingsTile.navigation(
                  title: const Text('設定６'),
                  onPressed: (context) {},
                ),
              ],
            ),
            SettingsSection(
              title: const Text('お知らせ設定'),
              tiles: [
                SettingsTile.switchTile(
                  title: const Text('設定７'),
                  leading: const Icon(Icons.access_alarm),
                  enabled: true,
                  onToggle: (bool value) {},
                  initialValue: null,
                ),
              ],
            ),
            SettingsSection(
              title: const Text('生地計算設定'),
              tiles: [
                SettingsTile.switchTile(
                  title: const Text('設定８'),
                  leading: const Icon(Icons.access_alarm),
                  enabled: true,
                  onToggle: (bool value) {},
                  initialValue: null,
                ),
              ],
            ),
            SettingsSection(
              title: const Text('精算処理設定'),
              tiles: [
                SettingsTile.switchTile(
                  title: const Text('設定９'),
                  leading: const Icon(Icons.access_alarm),
                  enabled: true,
                  onToggle: (bool value) {},
                  initialValue: null,
                ),
              ],
            ),
            SettingsSection(
              title: const Text('アプリ情報'),
              tiles: [
                SettingsTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('アプリのバージョン'),
                    value: Text("${snapshot.data?.version}"))
              ],
            ),
          ],
        ));
  }
}
