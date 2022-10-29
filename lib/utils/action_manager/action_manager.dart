/*
Copyright 2021 The dahliaOS Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pangolin/components/overlays/account_overlay.dart';
import 'package:pangolin/components/overlays/launcher/compact_launcher_overlay.dart';
import 'package:pangolin/components/overlays/launcher/launcher_overlay.dart';
import 'package:pangolin/components/overlays/power_overlay.dart';
import 'package:pangolin/components/shell/shell.dart';
import 'package:pangolin/services/application.dart';
import 'package:pangolin/services/customization.dart';
import 'package:pangolin/utils/data/constants.dart';

class ActionManager {
  const ActionManager._();

  static Future<void> showPowerMenu(BuildContext context) async {
    final shell = Shell.of(context, listen: false)..dismissEverything();
    await Future<void>.delayed(Constants.animationDuration);
    await shell.showOverlay(
      PowerOverlay.overlayId,
      dismissEverything: false,
    );
  }

  static Future<void> showAccountMenu(BuildContext context) async {
    final shell = Shell.of(context, listen: false)..dismissEverything();
    await Future<void>.delayed(Constants.animationDuration);
    await shell.showOverlay(
      AccountOverlay.overlayId,
      dismissEverything: false,
    );
  }

  static Future<void> switchLauncher(BuildContext context) async {
    final shell = Shell.of(context, listen: false);
    final service = CustomizationService.current;
    shell.dismissEverything();
    service.compactLauncher = !service.compactLauncher;
    await Future<void>.delayed(Constants.animationDuration);
    await shell.showOverlay(
      service.compactLauncher
          ? CompactLauncherOverlay.overlayId
          : LauncherOverlay.overlayId,
    );
  }

  static void openSettings(BuildContext context) {
    Shell.of(context, listen: false).dismissEverything();
    ApplicationService.current.startApp('io.dahlia.settings');
  }

  static void powerOff() {
    if (Platform.isLinux) {
      Process.run('poweroff', []);
    } else {
      print('Not supported on this Platform');
    }
  }

  static void reboot() {
    if (Platform.isLinux) {
      Process.run('reboot', []);
    } else {
      print('Not supported on this Platform');
    }
  }

  static void suspend() {}

  static void lock() {}

  static void logout() {}
}
