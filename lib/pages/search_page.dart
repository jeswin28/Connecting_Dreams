import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connecting_firebase/pages/detailpage.dart';

void main() {
  runApp(const MaterialApp(
    home: SearchScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<University> mainUniversityList = [
    University(
      name: "University of Oxford",
      location: "Oxford, UK",
      description:
          "Oxford University, established in the 12th century, is a renowned institution known for academic excellence and historic architecture in Oxford, England.",
      photoUrl:
          "https://i.pinimg.com/564x/a4/c0/1b/a4c01b4b7a36b15c1da0669fb22945ac.jpg",
      coursesOffered: [
        'MS in Computer Science',
        'M.S. in Statistics and Data Science',
        'M.S. in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'M.S. in Biomedical Engineering',
        'M.S. in Chemical Engineering',
        'M.S. in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/0c/89/50/0c895054ba280c1415007d88c2d3a7a5.jpg",
    ),
    University(
      name: 'Harvard University',
      location: "Harvard London",
      description:
          'Harvard, founded in 1636, is a prestigious Ivy League university in Cambridge, Massachusetts, with notable alumni spanning politics, academia, and business.',
      photoUrl:
          'https://i.pinimg.com/564x/fc/37/6b/fc376b6d7be545b4ab0034c69885d2a3.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://images.pexels.com/photos/207692/pexels-photo-207692.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    University(
      name: 'University of Cambridge',
      location: "Cambridge, UK",
      description:
          'The University of Cambridge is a leading university in Cambridge, UK. The university is the world’s largest university in the world, and the world’s largest university in the world.',
      photoUrl:
          'https://i.pinimg.com/564x/70/76/e4/7076e47f6e6c673bf103f235e2c654bd.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://images.unsplash.com/photo-1605470207062-b72b5cbe2a87?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dW5pdmVyc2l0eSUyMG9mJTIwY2FtYnJpZGdlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
    ),
    University(
      name: 'Stanford University',
      location: "Stanford , USA",
      description:
          'Stanford University, founded in 1885 in California, is a top-tier research institution renowned for technology innovation, entrepreneurship, and academic excellence.',
      photoUrl:
          'https://i.pinimg.com/564x/59/4f/89/594f8991cbb8147c08dc50cd2028e0a9.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/e9/0a/80/e90a806aef43ff50e45debeebf47f32b.jpg",
    ),
    University(
      name: 'MIT',
      location: "Cambridge, UK",
      description:
          'MIT (Massachusetts Institute of Technology), founded in 1861, is a world-leading research university in Cambridge, known for its STEM excellence, innovation, and influential alumni across diverse fields.',
      photoUrl:
          'https://i.pinimg.com/564x/9c/d8/87/9cd88717c5b030f0938b806fcc41e421.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://images.unsplash.com/photo-1537888692311-8a7fb3e9f374?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TUlUfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
    ),
    University(
      name: 'Caltech',
      location: "Cambridge, UK",
      description:
          'Caltech (California Institute of Technology) is a prestigious science and engineering university in Pasadena, renowned for pioneering research and Nobel laureates.',
      photoUrl:
          'https://i.pinimg.com/564x/5b/49/f8/5b49f80da12e639ff39eaadb28c3ddaa.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/46/64/e8/4664e80969aa41ed766de5544386b2de.jpg",
    ),
    University(
      name: 'Princeton University',
      location: "Cambridge, UK",
      description:
          'Princeton University, founded in 1746 in New Jersey, is an Ivy League institution acclaimed for its liberal arts education, renowned faculty, and a rich history of academic excellence.',
      photoUrl:
          'https://i.pinimg.com/564x/13/eb/ca/13ebca2182be1faa6f41905e0270fba0.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/79/f5/db/79f5db918853c4e20ee5bfdc7b830ca8.jpg",
    ),
    University(
      name: 'Caltech, Berkley',
      location: "Cambridge, UK",
      description:
          'The University of California, Berkeley, is a prominent public research university known for academic excellence, innovation, and a diverse and influential alumni network.',
      photoUrl:
          'https://i.pinimg.com/564x/a9/ed/db/a9eddb6c5a4bae68c664b4dcbd1253cb.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/a9/76/19/a97619570e357032f76d830487e07de0.jpg",
    ),
    University(
      name: 'Yale University',
      location: "Cambridge, UK",
      description:
          'Yale University, founded in 1701 in Connecticut, is an Ivy League institution celebrated for its comprehensive education, historic prestige, and influential alumni across various fields, including politics and the arts.',
      photoUrl:
          'https://i.pinimg.com/564x/1b/50/a7/1b50a759f6e60511338a889f91226db0.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/de/71/59/de71595b7f0f5c88d99dde163dad08e5.jpg",
    ),
    University(
      name: 'Imperial College of London',
      location: "Cambridge, UK",
      description:
          'Imperial College London, founded in 1907, excels in science, engineering, medicine, and business research, with a global reputation for innovation and academic excellence.',
      photoUrl:
          'https://i.pinimg.com/564x/12/a7/75/12a7758ca1b7a0b7d4c647e40dd2862c.jpg',
      coursesOffered: [
        'BSc in Computer Science',
        'BSc in Statistics and Data Science',
        'BSc in Mechanical Engineering & Materials Science',
        'Advanced Professional MPH Program',
        'School of Engineering and Applied Science Joint Degree (MS)',
        'BSc in Biomedical Engineering',
        'BSc in Chemical Engineering',
        'BSc in Applied Physics',
      ],
      duration: ['12', '18', '12', '11', '30', '12', '12', '24'],
      imageurl:
          "https://i.pinimg.com/564x/6d/f8/74/6df87494ef098e1947ddde8a6a2ae8b2.jpg",
    ),
  ];

  List<University> displayList = List.from(mainUniversityList);

  void updateList(String value) {
    final filteredList = mainUniversityList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    setState(() {
      displayList.clear();
      displayList.addAll(filteredList);
    });
  }

  void navigateToDetailPage(University? university) {
    if (university != null && university.imageurl != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(
            university: university,
          ),
      ),
    );
    } else {
      // Display an error message using a SnackBar
      const snackBar = SnackBar(
        content: Text('University details are unavailable at the moment.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search",
              style: TextStyle(
                fontSize: 22.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFf0f0f0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "e.g. Oxford",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            Expanded(
              child: displayList.isEmpty
                  ? const Center(
                      child: Text(
                        "NO RESULTS FOUND!!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => navigateToDetailPage(displayList[index]),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(
                            displayList[index].name,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            displayList[index].location,
                            style: const TextStyle(
                                color: Color.fromARGB(179, 0, 0, 0)),
                          ),
                          leading: CachedNetworkImage(
                            imageUrl: displayList[index].photoUrl,
                            placeholder: (context, url) => const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

