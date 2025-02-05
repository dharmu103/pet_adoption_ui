import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_app/screens/image_view.dart';
import 'package:pet_adoption_app/widgets/dialog_box.dart';

import '../controller/controller.dart';

class DetailsPage extends StatefulWidget {
  final pet;
  const DetailsPage({super.key, required this.pet});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ConfettiController _controllerCenter;
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  bool isAdopted = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.70,
              width: size.width,
              child: Hero(
                tag: widget.pet["name"],
                child: InteractiveViewer(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ImageView(
                        pet: widget.pet,
                      ));
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.pet["image"],
                      fadeOutCurve: Curves.bounceIn,
                      fit: BoxFit.cover,
                      // maxHeight: size.height * 0.45,
                    ),
                  ),
                ),
              ),
            ),
            // for back button and more icon
            backButton(size, context),
            // for name location and favorite icon
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.48,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        nameAddressAndFavoriteButton(),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            moreInfo(
                              Colors.blue,
                              Colors.blue.withOpacity(0.5),
                              widget.pet["sex"],
                              "Sex",
                            ),
                            moreInfo(
                              Colors.pink,
                              Colors.pink.withOpacity(0.5),
                              widget.pet["age"].toString(),
                              "Age",
                            ),
                            moreInfo(
                              Colors.purple,
                              Colors.purple.withOpacity(0.5),
                              widget.pet["color"].toString(),
                              "Weight",
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // for woiner name and contact
                        ownerInfo(),
                        // for description
                        // const SizedBox(height: 20),

                        const SizedBox(height: 20),
                        // for adopt me button
                        Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white),
                              onPressed: isAdopted == false &&
                                      widget.pet["is_adopted"] != true
                                  ? () {
                                      setState(() {
                                        isAdopted = true;
                                      });
                                      controller.setAdopted(widget.pet["name"]);
                                      showConfettiDialog(
                                        context: context,
                                        builder: (con) {
                                          return Dialog(
                                            child: Container(
                                              height: 300,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    height: 200,
                                                    width: Get.width,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        25),
                                                                topRight: Radius
                                                                    .circular(
                                                                        25)),
                                                        color: Colors.green,
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                'assets/icons/success.gif'))),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "You've now adopted ${widget.pet["name"]}",
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  const Spacer()
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        barrierColor: Colors.transparent,
                                      );
                                    }
                                  : null,
                              child: Text(
                                "Adopt Me",
                                style: GoogleFonts.lato(),
                              )),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              // createParticlePath: drawStar, // define a custom shape/path.
            )
          ],
        ),
      )),
    );
  }

  Row ownerInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.pet["owner_name"],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${widget.pet["name"]} Owner",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: color3.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.chat_outlined,
            color: Colors.lightBlue,
            size: 16,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.phone_outlined,
            color: Colors.red,
            size: 16,
          ),
        ),
      ],
    );
  }

  Row nameAddressAndFavoriteButton() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.pet["name"],
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    '${widget.pet["location"]})',
                    style: TextStyle(
                      color: Colors.black54.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // for favorite icon
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: widget.pet["is_favorited"]
                    ? Colors.red.withOpacity(0.1)
                    : Colors.black54.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 1,
              )
            ],
          ),
          child: Icon(
            widget.pet["is_favorited"]
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: widget.pet["is_favorited"]
                ? Colors.red
                : Colors.black54.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Positioned backButton(Size size, BuildContext context) {
    return Positioned(
      height: size.height * 0.14,
      right: 20,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: const Icon(
              Icons.more_horiz,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect moreInfo(pawColor, backgroundColr, title, value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: 0,
            child: Transform.rotate(
              angle: 12,
              child: Image.network(
                widget.pet["image"],
                // color: widget.pet["color"],
                height: 45,
              ),
            ),
          ),
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColr,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
