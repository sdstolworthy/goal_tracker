import 'package:faker/faker.dart';
import 'package:spencerstolworthy_goals/src/models/Recurrence.dart';

/// What kind of goals do users want to reach?
/// - Meet more people
/// - Save more money
/// - Exercise
/// - Sleep more
/// Basically, I want to do something x number of times per unit of time
/// See also https://www.vertabelo.com/blog/again-and-again-managing-recurring-events-in-a-data-model/

class Goal {
  String id;
  String title;
  String description;
  DateTime createdAt;
  DateTime deletedAt;
  RecurrencePattern recurrencePattern;
  int goalPerRecurrence;

  Goal(this.title, {this.description, this.recurrencePattern}) {
    this.title = title;
  }

  Goal.faked()
      : title = faker.lorem.sentence(),
        description = faker.lorem.sentence(),
        goalPerRecurrence = 1;

  Goal.fromMap(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
  }
}
