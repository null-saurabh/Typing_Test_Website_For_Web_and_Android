import 'package:flutter/material.dart';

class TextToWrite extends StatelessWidget {
  const TextToWrite({
    super.key,
  });

  final String sampleText = "In the quiet town of Eldenwood, Emma wandered through the ancient forest, her footsteps barely making a sound on the fallen leaves. She had heard legends about a mysterious creature residing deep within the woods, "
      "and her adventurous spirit yearned to discover the truth behind the tales. Every tree stood tall and majestic, their trunks gnarled with age, and their canopies forming a dense green roof above.The sun's golden rays pierced through the gaps, "
      "creating a mesmerizing dance of light and shadow on the ground. Birds sang harmoniously, their melodies echoing in the serene environment. A gentle breeze rustled the leaves, carrying with it the scent of blooming flowers and the distant murmur of a flowing stream. "
      "As Emma ventured deeper, she stumbled upon an old stone bridge, its arches covered in moss and ivy. Beneath it, the stream glistened, its waters crystal clear and reflecting the azure sky. She paused, taking a moment to admire the beauty before her. "
      "Suddenly, a soft whisper reached her ears. Turning around, she spotted a creature, unlike anything she had ever seen. It had the grace of a deer, the wings of a butterfly, and the luminous eyes of a cat. The creature looked at her curiously, its gaze gentle and unafraid. "
      "Emma realized that this was the fabled guardian of Eldenwood, a being that protected the forest and its inhabitants. She approached slowly, extending her hand, and the creature nuzzled it affectionately. They formed an instant bond, two souls connected by their love for nature. "
      "The guardian led Emma to the heart of the forest, where a magnificent tree stood. Its bark shimmered with ethereal light, and its roots delved deep into the earth, drawing strength from the very core of the world. Emma understood that this tree was the source of life for the entire forest. "
      "With a heavy heart, she bid farewell to her newfound friend, promising to keep the forest's secret safe. As she retraced her steps, the trees seemed to bow in gratitude, and the wind whispered tales of her bravery.";


  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 18),
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white)),
      child: Text(sampleText,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
    );
  }
}
