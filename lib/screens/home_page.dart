import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption_app/controller/controller.dart';
import 'package:pet_adoption_app/utils/data.dart';
import 'package:pet_adoption_app/widgets/search_bar.dart';

import '../widgets/pets_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    "Pets",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            GetBuilder<HomeController>(builder: (_) {
              return searchBarField((v) => {_.searchFunction(v)});
            }),
            GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _.pets1.length,
                    itemBuilder: ((context, index) {
                      return PetWidget(
                        pet: _.pets1[index],
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
