import 'package:get/get.dart';
import 'package:pet_adoption_app/utils/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List pets1 = pets;
  List pets2 = pets;

  @override
  void onInit() {
    super.onInit();
    updatePetsFromLocalStorage();
  }

  updatePetsFromLocalStorage() async {
    List adoptedPets = await getAdoptedPet();
    for (var i = 0; i < adoptedPets.length; i++) {
      for (var j = 0; j < pets.length; j++) {
        if (adoptedPets[i] == pets1[j]["name"]) {
          pets1[j]["is_adopted"] = true;
        }
      }
    }
    // print(pets1);
    update();
  }

  getAdoptedPet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("adopted") ?? [];
  }

  setAdopted(name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> adopedCurrent = prefs.getStringList("adopted") ?? [];
    adopedCurrent.add(name);
    prefs.setStringList("adopted", adopedCurrent);
    updatePetsFromLocalStorage();
  }

  searchFunction(String v) {
    if (v == "") {
      pets1 = pets;
    } else if (v != "") {
      pets1 = [];
      for (var element in pets2) {
        if (element["name"]
            .toString()
            .toUpperCase()
            .startsWith(v.toUpperCase())) {
          pets1.add(element);
        }
      }
    }
    update();
  }
}
