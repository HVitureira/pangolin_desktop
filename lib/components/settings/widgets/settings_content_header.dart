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

import 'package:flutter/material.dart';
import 'package:pangolin/components/settings/models/settings_element_model.dart';

class SettingsContentHeader extends SettingsElementModel {
  const SettingsContentHeader(
    this.title, {
    super.key,
  }) : super(
          type: SettingsElementModelType.contentHeader,
        );
  final String title;

  @override
  _SettingsContentHeaderState createState() => _SettingsContentHeaderState();
}

class _SettingsContentHeaderState extends State<SettingsContentHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
