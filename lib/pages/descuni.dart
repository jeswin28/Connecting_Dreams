import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;
  final String imgName;
  final String description;
  final List<String> coursesOffered;
  final List<String> duration;

  const DetailPage({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.imgName,
    required this.coursesOffered,
    required this.duration,
  }) : super(key: key);

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
              style: TextStyle(fontSize: 16.0),
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text(imgName),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButtonWithIcon(
                  'More Info',
                  Icons.info,
                  Colors.black,
                  onPressed: () {
                    _showMoreInfoDialog(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Courses Offered',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: coursesOffered.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                    ),
                    title: Text(
                      '${coursesOffered[index]} - ${duration[index]} months',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonWithIcon(
    String label,
    IconData icon,
    Color buttonColor, {
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}