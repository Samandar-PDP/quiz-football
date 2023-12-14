class Question {
  int id;
  String option1;
  String option2;
  String option3;
  String option4;
  String logo;
  int correctAnswer;

  Question(this.id, this.option1, this.option2, this.option3, this.option4,
      this.correctAnswer,
      this.logo);
}
final questionList = [
  Question(0, 'Liverpool', 'Bayern M', 'Real Madrid', 'Chelsea', 2 , 'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png'),
  Question(1, 'Tottenham', 'Milan', 'Man UTD', 'Anjan FC', 0, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/367.png'),
  Question(2, 'Man City', 'Galatasaray', 'Union Berlin', 'Chelsea', 3, 'https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png'),
  Question(3, 'Sevilla', 'Westham', 'Fulham', 'Barcelona', 3, 'https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/190px-FC_Barcelona_%28crest%29.svg.png'),
  Question(4, 'Al Nasr', 'West ham', 'Al Ayn', 'PSG', 0, 'https://seeklogo.com/images/A/al-nassr-fc-al-nassr-club-alnassr-nassr-logo-EFC8743AA9-seeklogo.com.png'),
];