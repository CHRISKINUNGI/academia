import 'dart:async';

import 'package:academia/controllers/settings_controller.dart';
import 'package:academia/pages/webview_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/common.dart';
import 'intro_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SettingsController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.xmark),
        ),
        title: const Text("Settings"),
        actions: [
          IconButton(
            tooltip: "About this app",
            onPressed: () {
              Get.to(
                const WebviewPage(
                  title: "About Academia",
                  url:
                      "https://github.com/IamMuuo/academia/blob/main/README.md",
                ),
              );
            },
            icon: const Icon(CupertinoIcons.question_circle),
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            // Personal
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Personal Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            ListTile(
              title: const Text("Show my profile picture"),
              trailing: Switch(
                  value: controller.showProfilePic.value,
                  onChanged: (value) async {
                    controller.showProfilePic.value = value;
                    await controller.saveSettings();
                  }),
            ),

            ListTile(
              title: const Text("Show GPA"),
              trailing: Switch(
                  value: controller.showGPA.value,
                  onChanged: (value) async {
                    controller.showGPA.value = value;
                    await controller.saveSettings();
                  }),
            ),

            const Divider(),

            // Todos
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Tool Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            ListTile(
              title: const Text("Lock showing audit tool"),
              trailing: Switch(
                  value: controller.showAudit.value,
                  onChanged: (value) async {
                    controller.showAudit.value = value;
                    await controller.saveSettings();
                  }),
            ),
            const Divider(),
            ListTile(
              title: const Text("Lock showing transcript tool"),
              trailing: Switch(
                  value: controller.showTranscript.value,
                  onChanged: (value) async {
                    controller.showTranscript.value = value;
                    await controller.saveSettings();
                  }),
            ),
            const Divider(),
            ListTile(
              title: const Text("Show fees statistics"),
              trailing: Switch(
                  value: controller.showFees.value,
                  onChanged: (value) async {
                    controller.showFees.value = value;
                    await controller.saveSettings();
                  }),
            ),

            // notifications

            const Divider(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: const Text("Show exam timetable during exam period"),
              trailing: Switch(
                  value: controller.showExamTimeTable.value,
                  onChanged: (value) async {
                    controller.showExamTimeTable.value = value;
                    await controller.saveSettings();
                  }),
            ),
            const Divider(),

            ListTile(
              title: const Text("Wish me happy birthday"),
              trailing: Switch(
                  value: controller.birthdayNotify.value,
                  onChanged: (value) async {
                    controller.birthdayNotify.value = value;
                    await controller.saveSettings();
                  }),
            ),
            const Divider(),

            const Align(
              alignment: Alignment.center,
              child: Text(
                "Features",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: const Text("Report a bug or issue"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.arrow_right_circle),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("How to contribute to Academia"),
              trailing: IconButton(
                  onPressed: () {
                    Get.to(
                      const WebviewPage(
                          title: "How to contribute",
                          url:
                              "https://github.com/IamMuuo/academia/blob/main/CONTRIBUTING.md"),
                    );
                  },
                  icon: const Icon(CupertinoIcons.arrow_right_circle)),
            ),

            const Divider(),
            ListTile(
              title: const Text("How to contact us"),
              trailing: IconButton(
                  onPressed: () {
                    Get.to(const WebviewPage(
                        title: "DITA Contact",
                        url: "https://dita.co.ke/#contact"));
                  },
                  icon: const Icon(CupertinoIcons.arrow_right_circle)),
            ),
            const Divider(),

            // button to refresh all content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: ElevatedButton(
                // log out the use
                onPressed: () async {
                  bool flag = await Get.defaultDialog(
                    title: "Confirmation",
                    content: Column(
                      children: [
                        Image.asset(
                          "assets/images/bot_sad.png",
                          height: 80,
                          width: 80,
                        ),
                        const Text("Are you sure you wish to leave?"),
                      ],
                    ),
                    textConfirm: "Leave",
                    textCancel: "I'll stay",
                    onCancel: () {
                      Get.back(result: false);
                    },
                    onConfirm: () => Get.back(result: true),
                  );

                  if (flag) {
                    user.logout();
                    Get.offAll(const IntroPage());
                    Get.deleteAll(); // Clear all the controllers
                    Get.snackbar(
                      "Logout success",
                      "Please take your time to let us know what we would have done to make you stay",
                      backgroundColor: Colors.white,
                      icon: const Icon(CupertinoIcons.checkmark_seal),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  elevation: 0,
                  minimumSize: const Size(300, 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            Image.asset(
              "assets/icons/branding.png",
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
