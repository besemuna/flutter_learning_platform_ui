class Course {
  String name;
  String number;
  String picture;

  Course({this.name, this.number, this.picture});
}

class CourseContent {
  int video;
  String title;
  bool favourite;
  double progress;

  CourseContent({this.video, this.title, this.favourite, this.progress});
}

List<Course> courses = [
   
  Course(name: "UX Design", number: "35 Courses", picture: "./assets/one.png"),
  Course(name: "Photoshop", number: "35 Courses", picture: "./assets/two.png"),
  Course(
      name: "Illustrator", number: "35 Courses", picture: "./assets/three.png"),
  Course(
      name: "Development", number: "35 Courses", picture: "./assets/four.png"),
];

List<CourseContent> courseContent = [
  CourseContent(
      video: 15,
      title: "01 - Adobe XD UI Design",
      progress: 0.5,
      favourite: false),
  CourseContent(
      video: 15,
      title: "02 - UX Design Fundamentals",
      progress: 0.8,
      favourite: true),
  CourseContent(
      video: 15, title: "03 - Design Thinking", progress: 0.0, favourite: false),
  CourseContent(
      video: 15, title: "04 -Learn Figma", progress: 0.5, favourite: false)
];
