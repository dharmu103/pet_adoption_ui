import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption_app/controller/controller.dart';
import 'package:pet_adoption_app/utils/data.dart';

void main() {
  test('find pets start with c', () {
    final controller = HomeController();
    controller.pets1 = pets;
    controller.pets2 = pets;
    controller.searchFunction("c");

    expect(controller.pets1.length, 2);
  });
  test('find pets start with co', () {
    final controller = HomeController();
    controller.pets1 = pets;
    controller.pets2 = pets;
    controller.searchFunction("co");

    expect(controller.pets1.length, 1);
  });
}
