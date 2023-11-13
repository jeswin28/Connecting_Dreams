import 'package:flutter/material.dart';

class University {
  final String name;
  final String location;
  final String description;
  final String photoUrl;
  final String imageurl;
  final List<String> coursesOffered;
  final List<String> duration;

  University({
    required this.name,
    required this.location,
    required this.description,
    required this.photoUrl,
    required this.coursesOffered,
    required this.duration,
    required this.imageurl,
  });
}

class DetailPage extends StatelessWidget {
  final University university;

  const DetailPage({Key? key, required this.university}) : super(key: key);

  Future<void> _showMoreInfoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Accepted Examinations'),
          content: const SingleChildScrollView(
            child: Text(
              '''- MS in Computer Science: GRE, TOEFL
- M.S. in Statistics and Data Science: TOEFL, IELTS
- M.S. in Mechanical Engineering & Materials Science: TOEFL, IELTS
- Advanced Professional MPH Program: TOEFL
- School of Engineering and Applied Science Joint Degree (MS): TOEFL
- M.S. in Biomedical Engineering: TOEFL, IELTS
- M.S. in Chemical Engineering: TOEFL, IELTS
- M.S. in Applied Physics: TOEFL, IELTS''',
              style: TextStyle(fontSize: 13.0),
              textAlign: TextAlign.left,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          university.name,
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: SizedBox(
              width: 350.0,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    university.imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              university.description,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showMoreInfoDialog(context);
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('More Info'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 10.0),
          const Text(
            'Courses Offered:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: university.coursesOffered.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.bookmark_border,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  title: Text(
                    '${university.coursesOffered[index]} - ${university.duration[index]} (in months)',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
