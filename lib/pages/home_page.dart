import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connecting_firebase/pages/descuni.dart';

void main() {
  runApp(const HomeScreen());
}

class DescModel {
  String? imgUrl;
  String? description;

  DescModel(this.imgUrl, this.description);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          'Welcome!!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: const ParallaxScrollView(),
    );
  }
}

class ParallaxScrollView extends StatefulWidget {
  const ParallaxScrollView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ParallaxScrollViewState createState() => _ParallaxScrollViewState();
}

class _ParallaxScrollViewState extends State<ParallaxScrollView> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, -_scrollOffset / 3),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Top Universities',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliderScreen(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Most Picked..',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            VerticalScrollView(),
          ],
        );
      },
    );
  }
}

class SliderScreen extends StatefulWidget {
  const SliderScreen({
    super.key,
  });

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Map<String, dynamic>> imageList = [
    {
      "id": 1,
      "image_path":
          'https://i.pinimg.com/564x/a6/2b/ca/a62bca1de240fc404c4ab1c729c704c0.jpg'
    },
    {
      "id": 2,
      "image_path":
          'https://i.pinimg.com/564x/d3/5b/c3/d35bc3294662839009ca88b05a55479f.jpg'
    },
    {
      "id": 3,
      "image_path":
          'https://i.pinimg.com/564x/28/fc/d0/28fcd037b2890f0135e758a7c3763beb.jpg'
    },
    {
      "id": 4,
      "image_path":
          'https://i.pinimg.com/564x/58/a2/db/58a2db429fc9e536525e306f40699acf.jpg'
    },
    {
      "id": 5,
      "image_path":
          'https://i.pinimg.com/564x/b9/36/99/b93699d6dbef16ed08c037f99eca83a7.jpg'
    },
    {
      "id": 6,
      "image_path":
          'https://i.pinimg.com/736x/e0/2e/c5/e02ec5f846811c405f0f71c1a3f8a278.jpg'
    },
    {
      "id": 7,
      "image_path":
          'https://i.pinimg.com/564x/4d/42/93/4d42933cf06d2109ce43259b0dd3ccea.jpg'
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                if (kDebugMode) {
                  print(currentIndex);
                }
              },
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageList[index]['image_path'],
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                },
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? const Color.fromARGB(255, 70, 227, 247)
                            : Colors.teal,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class VerticalScrollView extends StatelessWidget {
  final List<String> verticalImageUrls = [
    'https://i.pinimg.com/564x/0c/89/50/0c895054ba280c1415007d88c2d3a7a5.jpg',
    'https://images.pexels.com/photos/207692/pexels-photo-207692.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.unsplash.com/photo-1605470207062-b72b5cbe2a87?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dW5pdmVyc2l0eSUyMG9mJTIwY2FtYnJpZGdlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    'https://i.pinimg.com/564x/e9/0a/80/e90a806aef43ff50e45debeebf47f32b.jpg',
    'https://images.unsplash.com/photo-1537888692311-8a7fb3e9f374?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TUlUfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    'https://i.pinimg.com/564x/46/64/e8/4664e80969aa41ed766de5544386b2de.jpg',
    'https://i.pinimg.com/564x/79/f5/db/79f5db918853c4e20ee5bfdc7b830ca8.jpg',
    'https://i.pinimg.com/564x/a9/76/19/a97619570e357032f76d830487e07de0.jpg',
    'https://i.pinimg.com/564x/de/71/59/de71595b7f0f5c88d99dde163dad08e5.jpg',
    'https://i.pinimg.com/564x/6d/f8/74/6df87494ef098e1947ddde8a6a2ae8b2.jpg',
  ];

  final List<String> descriptions = [
    'Oxford University, established in the 12th century, is a renowned institution known for academic excellence and historic architecture in Oxford, England.',
    'Harvard, founded in 1636, is a prestigious Ivy League university in Cambridge, Massachusetts, with notable alumni spanning politics, academia, and business.',
    'The University of Cambridge, founded in 1209 in Cambridge, England, is a prestigious institution with global recognition for academic excellence and research contributions.',
    'Stanford University, founded in 1885 in California, is a top-tier research institution renowned for technology innovation, entrepreneurship, and academic excellence.',
    'MIT (Massachusetts Institute of Technology), founded in 1861, is a world-leading research university in Cambridge, known for its STEM excellence, innovation, and influential alumni across diverse fields.',
    'Caltech (California Institute of Technology) is a prestigious science and engineering university in Pasadena, renowned for pioneering research and Nobel laureates.',
    'Princeton University, founded in 1746 in New Jersey, is an Ivy League institution acclaimed for its liberal arts education, renowned faculty, and a rich history of academic excellence.',
    'The University of California, Berkeley, is a prominent public research university known for academic excellence, innovation, and a diverse and influential alumni network.',
    'Yale University, founded in 1701 in Connecticut, is an Ivy League institution celebrated for its comprehensive education, historic prestige, and influential alumni across various fields, including politics and the arts.',
    'Imperial College London, founded in 1907, excels in science, engineering, medicine, and business research, with a global reputation for innovation and academic excellence.',
  ];
  final List<String> clg_name = [
    'Oxford University',
    'Harvard University',
    'University of Cambridge',
    'Stanford University',
    'MIT',
    'Caltech',
    'Princeton University',
    'Caltech,berkley',
    'Yale University',
    'Imperial College of London'
  ];

  VerticalScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(verticalImageUrls.length, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        imageUrl: verticalImageUrls[index],
                        description: descriptions[index],
                        imgName: clg_name[index],
                        coursesOffered: const [
                          'BSc in Computer Science',
                          'BSc in Statistics and Data Science',
                          'BSc in Mechanical Engineering & Materials Science',
                          'Advanced Professional MPH Program',
                          'School of Engineering and Applied Science Joint Degree (MS)',
                          'BSc in Biomedical Engineering',
                          'BSc in Chemical Engineering',
                          'BSc in Applied Physics',
                        ],
                        duration: const [
                          '12',
                          '18',
                          '12',
                          '11',
                          '30',
                          '12',
                          '12',
                          '24'
                        ],
                      ),
                    ), 
                  );
                },
                child: ImageDescriptionContainer(
                  imagePath: verticalImageUrls[index],
                  description: descriptions[index],
                ),
              ),
              const Divider()
            ],
          );
        }),
      ),
    );
  }
}

class ImageDescriptionContainer extends StatelessWidget {
  final String imagePath;
  final String description;

  const ImageDescriptionContainer({
    required this.imagePath,
    required this.description,
  });

  Widget buildCircularProgressIndicator() {
    return Container(
      width: double.infinity,
      height: 150.0,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 150.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility(
                      visible: imagePath.isEmpty,
                      child:
                          buildCircularProgressIndicator(), // Circular progress indicator
                    ),
                    Visibility(
                      visible: imagePath.isNotEmpty,
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Flexible(
            flex: 3,
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
