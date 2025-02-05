import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../widgets/history_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28, top: 10),
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: _.petsHistory.length,
                    itemBuilder: ((context, index) {
                      return PetHistoryWidget(
                        pet: _.petsHistory[index],
                      );
                    }));
              },
            )
          ],
        ),
      ),
    );
  }
}
