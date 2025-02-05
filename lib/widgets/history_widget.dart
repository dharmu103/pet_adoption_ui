import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption_app/controller/controller.dart';
import 'package:pet_adoption_app/screens/details_page.dart';

class PetHistoryWidget extends StatelessWidget {
  const PetHistoryWidget({super.key, this.pet});
  final pet;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsPage(
          pet: pet,
        ));
      },
      child: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: pet["is_adopted"] == true
                    ? Colors.grey.shade200
                    : Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
                ]),
            child: Row(
              children: [
                Hero(
                  tag: pet["name"],
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          opacity: pet["is_adopted"] == true ? 0.5 : 1,
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(
                            pet["image"],
                          ),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              spreadRadius: 0.01)
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pet["name"],
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: pet["is_adopted"] != true
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          pet["is_adopted"] == true
                              ? const Text(
                                  "Already adopted",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            pet["rate"].toString(),
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(),
                      Row(
                        children: [
                          const Icon(
                            Icons.transgender,
                            color: Colors.black54,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            pet["sex"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 13),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.query_builder,
                            size: 16,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            pet["age"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 13),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.color_lens_outlined,
                            size: 16,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            pet["color"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.black54,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            pet["location"],
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
