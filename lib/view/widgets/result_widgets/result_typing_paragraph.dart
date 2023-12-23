import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResultTypingParagraphContainer extends StatelessWidget {
  final String originalParagraph;
  final RichText typedParagraph;
  ResultTypingParagraphContainer({
    required this.originalParagraph,
    required this.typedParagraph,
    super.key});

  final String sampleText =
      "In the quiet town of Eldenwood, Emma wandered through the ancient forest, her footsteps barely making a sound on the fallen leaves. She had heard legends about a mysterious creature residing deep within the woods, "
      "and her adventurous spirit yearned to discover the truth behind the tales. Every tree stood tall and majestic, their trunks gnarled with age, and their canopies forming a dense green roof above.The sun's golden rays pierced through the gaps, "
      "creating a mesmerizing dance of light and shadow on the ground. Birds sang harmoniously, their melodies echoing in the serene environment. A gentle breeze rustled the leaves, carrying with it the scent of blooming flowers and the distant murmur of a flowing stream. "
      "As Emma ventured deeper, she stumbled upon an old stone bridge, its arches covered in moss and ivy. Beneath it, the stream glistened, its waters crystal clear and reflecting the azure sky. She paused, taking a moment to admire the beauty before her. "
      "Suddenly, a soft whisper reached her ears. Turning around, she spotted a creature, unlike anything she had ever seen. It had the grace of a deer, the wings of a butterfly, and the luminous eyes of a cat. The creature looked at her curiously, its gaze gentle and unafraid. "
      "Emma realized that this was the fabled guardian of Eldenwood, a being that protected the forest and its inhabitants. She approached slowly, extending her hand, and the creature nuzzled it affectionately. They formed an instant bond, two souls connected by their love for nature. "
      "The guardian led Emma to the heart of the forest, where a magnificent tree stood. Its bark shimmered with ethereal light, and its roots delved deep into the earth, drawing strength from the very core of the world. Emma understood that this tree was the source of life for the entire forest. "
      "With a heavy heart, she bid farewell to her newfound friend, promising to keep the forest's secret safe. As she retraced her steps, the trees seemed to bow in gratitude, and the wind whispered tales of her bravery.";

  final _scrollController1 = ScrollController();
  final _scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.25))),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                height: 400,
                color: const Color(0xffF5FAFC),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Typing Paragraph",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 320,
                        child: Scrollbar(
                            controller: _scrollController1,
                            interactive: false,
                            thumbVisibility: true,
                            // trackVisibility: true,
                            child: SingleChildScrollView(
                                controller: _scrollController1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12.5),
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                      originalParagraph,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            width: 20,
          ),
          Flexible(
              flex: 1,
              child: Container(
                height: 400,
                color: const Color(0xffF5FAFC),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Your Typed Output",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 320,
                        child: Scrollbar(
                            controller: _scrollController2,
                            interactive: false,
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                                controller: _scrollController2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12.5),
                                  child: typedParagraph,
                                  // child: Text(
                                  //   typedParagraph,
                                  //   textAlign: TextAlign.justify,
                                  //   style: const TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                ))),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.25))),
      child: Column(
        children: [
          Container(
            height: 400,
            color: const Color(0xffF5FAFC),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Typing Paragraph",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 320,
                    child: Scrollbar(
                        controller: _scrollController1,
                        interactive: false,
                        thumbVisibility: true,
                        // trackVisibility: true,
                        child: SingleChildScrollView(
                            controller: _scrollController1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.5),
                              child: Text(
                                originalParagraph,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ))),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 20, // Adjust the height as needed for separation
            color: Colors.white, // Add a white background color here
          ),
          Container(
            height: 400,
            color: const Color(0xffF5FAFC),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your Typed Output",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 320,
                    child: Scrollbar(
                        controller: _scrollController2,
                        interactive: false,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                            controller: _scrollController2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.5),
                              child: typedParagraph,
                              // child: Text(
                              //   typedParagraph,
                              //   textAlign: TextAlign.justify,
                              //   style: const TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w500),
                              // ),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
