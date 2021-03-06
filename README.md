# flutter_flipperkit

[![pub version][pub-image]][pub-url]
[![Join the chat][telegram-image]][telegram-url]

[pub-image]: https://img.shields.io/pub/v/flutter_flipperkit.svg
[pub-url]: https://pub.dev/packages/flutter_flipperkit
[telegram-image]:https://img.shields.io/badge/chat-on%20telegram-blue.svg
[telegram-url]: https://t.me/flipper4flutter

English | [简体中文](./README.zh_CN.md)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Introduction](#introduction)
  - [Features](#features)
- [Quick Start](#quick-start)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Run the app](#run-the-app)
- [Known Issues (to note)](#known-issues-to-note)
- [Related Links](#related-links)
- [Discussion](#discussion)
- [Stargazers over time](#stargazers-over-time)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

*Flipper (Extensible mobile app debugger) for flutter.*

[View document](./docs/en/README.md)

### Features

- Network inspector
![network](https://fbflipper.com/docs/assets/network.png)

- Shared preferences (and UserDefaults) inspector
![shared-preferences](https://fbflipper.com/docs/assets/shared-preferences.png)

- Redux inspector
- Database Browser

## Quick Start

### Prerequisites

Before starting make sure you have:

- Installed [Flipper Desktop](https://fbflipper.com/docs/getting-started.html)

### Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  flutter_flipperkit: ^0.0.21
```

If you are using a legacy version of Flutter, please add it in the following way:

```yaml
dependencies:
  flutter_flipperkit:
    git:
      url: https://github.com/blankapp/flutter_flipperkit
      ref: legacy
```

Change your project `ios/Podfile` file according to the example:

```diff
# Uncomment this line to define a global platform for your project
-# platform :ios, '8.0'
+platform :ios, '9.0'
```

Change your project files according to the example:

`android/app/build.gradle`:

```diff
android {
-    compileSdkVersion 27
+    compileSdkVersion 28

    defaultConfig {
-        targetSdkVersion 27
+        targetSdkVersion 28
    }
}
```

`android/app/gradle.properties`:

```diff
+android.useAndroidX=true
+android.enableJetifier=true
```

`android/settings.gradle`:
```diff
...

plugins.each { name, path ->
    def pluginDirectory = flutterProjectRoot.resolve(path).resolve('android').toFile()
    include ":$name"
    project(":$name").projectDir = pluginDirectory

+    if (name == 'flutter_flipperkit') {
+        include ':flipper-no-op'
+        project(':flipper-no-op').projectDir = new File(pluginDirectory, 'flipper-no-op')
+    }
}

...

```

You can install packages from the command line:

```bash
$ flutter packages get
```

### Usage

```dart
import 'package:flutter_flipperkit/flutter_flipperkit.dart';

void main() {
  FlipperClient flipperClient = FlipperClient.getDefault();

  flipperClient.addPlugin(new FlipperNetworkPlugin(
    // If you use http library, you must set it to false and use https://pub.dev/packages/flipperkit_http_interceptor
    // useHttpOverrides: false,
    // Optional, for filtering request
    filter: (HttpClientRequest request) {
      String url = '${request.uri}';
      if (url.startsWith('https://via.placeholder.com') || url.startsWith('https://gravatar.com')) {
        return false;
      }
      return true;
    }
  ));
  flipperClient.addPlugin(new FlipperReduxInspectorPlugin());
  flipperClient.addPlugin(new FlipperSharedPreferencesPlugin());
  flipperClient.start();

  runApp(MyApp());
}

...

```

> Please refer to  [flutter_flipperkit_examples](flutter_flipperkit_examples) project, to integrate `flutter_flipperkit` into your project.

### Run the app

```bash
$ flutter run
```

## Known Issues (to note)

- 【iOS】If you use `use_frameworks!` in your Podfile, Please see the [issue](https://github.com/blankapp/flutter_flipperkit/issues/10#issuecomment-505138362).

## Related Links

- https://github.com/blankapp/flutter_flipperkit_plugins
- https://github.com/blankapp/flutter_flipperkit_examples

## Discussion

If you have any suggestions or questions about this project, you can discuss it by [Telegram Group](https://t.me/flipper4flutter) with me.

## Stargazers over time

[![Stargazers over time](https://starchart.cc/blankapp/flutter_flipperkit.svg)](https://starchart.cc/blankapp/flutter_flipperkit)

## License

```text
MIT License

Copyright (c) 2019 LiJianying <lijy91@foxmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
