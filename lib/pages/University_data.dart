class University {
  String name;
  String location;
  String description;
  String photoUrl; // URL of the college photo
  List<String> coursesOffered;
  Map<String, int> courseDurations; // Course name to duration in months
  Map<String, List<String>>
      acceptedExamsByCourse; // Course name to accepted exams
  Map<String, double>
      tuitionFeesByCourse; // Course name to tuition fees in lakhs

  University({
    required this.name,
    required this.location,
    required this.description,
    required this.photoUrl,
    required this.coursesOffered,
    required this.courseDurations,
    required this.acceptedExamsByCourse,
    required this.tuitionFeesByCourse,
  });
}

void main() {
  final List<University> yalePrograms = [
    University(
      name: 'Yale University',
      location: 'New Haven, Connecticut',
      description: 'A prestigious Ivy League university...',
      photoUrl: 'https://example.com/yale.jpg',
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
      courseDurations: {
        'MS in Computer Science': 12, // 12 months (1 year)
        'M.S. in Statistics and Data Science': 18, // 18 months (1.5 years)
        'M.S. in Mechanical Engineering & Materials Science':
            12, // 12 months (1 year)
        'Advanced Professional MPH Program': 11, // 11 months
        'School of Engineering and Applied Science Joint Degree (MS)':
            30, // 30 months (2.5 years)
        'M.S. in Biomedical Engineering': 12, // 12 months (1 year)
        'M.S. in Chemical Engineering': 12, // 12 months (1 year)
        'M.S. in Applied Physics': 24, // 24 months (2 years)
      },
      acceptedExamsByCourse: {
        'MS in Computer Science': ['GRE', 'TOEFL'],
        'M.S. in Statistics and Data Science': ['TOEFL', 'IELTS'],
        'M.S. in Mechanical Engineering & Materials Science': [
          'TOEFL',
          'IELTS'
        ],
        'Advanced Professional MPH Program': ['TOEFL'],
        'School of Engineering and Applied Science Joint Degree (MS)': [
          'TOEFL'
        ],
        'M.S. in Biomedical Engineering': ['TOEFL', 'IELTS'],
        'M.S. in Chemical Engineering': ['TOEFL', 'IELTS'],
        'M.S. in Applied Physics': ['TOEFL', 'IELTS'],
      },
      tuitionFeesByCourse: {
        'MS in Computer Science': 40.1,
        'M.S. in Statistics and Data Science': 38.9,
        'M.S. in Mechanical Engineering & Materials Science': 35.9,
        'Advanced Professional MPH Program': 40.9,
        'School of Engineering and Applied Science Joint Degree (MS)': 38.3,
        'M.S. in Biomedical Engineering': 35.9,
        'M.S. in Chemical Engineering': 35.9,
        'M.S. in Applied Physics': 35.9,
      },
    ),
  ];
}
