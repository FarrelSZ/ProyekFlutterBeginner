class Lessons {
  String duration;
  bool isCompleted;
  bool isPlaying;
  String name;

  Lessons({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
  });
}

var lessonsList = [
  Lessons(
    duration: '7:30',
    isCompleted: true,
    isPlaying: true,
    name: 'Why',
  ),
  Lessons(
    duration: '4:27',
    isCompleted: false,
    isPlaying: false,
    name: 'Setup on Windows',
  ),
  Lessons(
    duration: '2:39',
    isCompleted: false,
    isPlaying: false,
    name: 'Setup on MacOS',
  ),
  Lessons(
    duration: '11:30',
    isCompleted: false,
    isPlaying: false,
    name: 'Introduction',
  ),
  Lessons(
    duration: '12:22',
    isCompleted: false,
    isPlaying: false,
    name: 'What...',
  ),
  Lessons(
    duration: '15:44',
    isCompleted: false,
    isPlaying: false,
    name: 'What...',
  ),
];
