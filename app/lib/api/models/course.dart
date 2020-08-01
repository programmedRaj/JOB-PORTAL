class Course {
  final String category;
  final int courseid;
  final String description;
  final String level;
  final String postedby;
  final int price;
  final String skills;
  final String title;
  final String link;
  Course({
    this.category,
    this.courseid,
    this.description,
    this.level,
    this.postedby,
    this.price,
    this.skills,
    this.title,
    this.link,
  });
}

class CategoryCourse {
  final String category;

  CategoryCourse({
    this.category,
  });
}
