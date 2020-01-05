import 'dart:convert';

abstract class RecurrenceType {}

class DailyRecurrence extends RecurrenceType {}

class WeeklyRecurrence extends RecurrenceType {}

class MonthlyRecurrence extends RecurrenceType {}

class YearlyRecurrence extends RecurrenceType {}

class RecurrencePattern {
  int separationCount;
  int maxNumberOfOccurrences;
  int dayOfWeek;
  int weekOfMonth;
  int dayOfMonth;
  int monthOfYear;
  RecurrenceType recurrenceType;

  getNextOccurance() {
    // TODO: implement logic to get next recurrence of event
    return DateTime.now();
  }

  RecurrencePattern(
    this.separationCount,
    this.maxNumberOfOccurrences,
    this.dayOfWeek,
    this.weekOfMonth,
    this.dayOfMonth,
    this.monthOfYear,
    this.recurrenceType,
  );

  RecurrencePattern.daily()
      : separationCount = 0,
        maxNumberOfOccurrences = null, // infinity constant
        dayOfWeek = null,
        weekOfMonth = null,
        dayOfMonth = null,
        monthOfYear = null,
        recurrenceType = DailyRecurrence();

  factory RecurrencePattern.ofType(String recurrenceType,
      {int monthOfYear,
      int weekOfMonth,
      int dayOfMonth,
      int dayOfWeek,
      int separationCount,
      int maxNumberOfOccurrences}) {
    switch (recurrenceType) {
      case 'daily':
        return RecurrencePattern.daily();
      default:
        return RecurrencePattern.daily();
    }
  }

  static _getRecurrenceTypeFromText(String typeString) {
    switch (typeString) {
      case 'daily':
        return DailyRecurrence();
      case 'weekly':
        return WeeklyRecurrence();
      case 'monthly':
        return MonthlyRecurrence();
      case 'yearly':
        return YearlyRecurrence();
    }
  }

  _getRecurrenceTypeText() {
    if (recurrenceType is DailyRecurrence) {
      return 'daily';
    }
    if (recurrenceType is WeeklyRecurrence) {
      return 'weekly';
    }
    if (recurrenceType is MonthlyRecurrence) {
      return 'monthly';
    }
    if (recurrenceType is YearlyRecurrence) {
      return 'daily';
    }
  }

  toMap() {
    return <String, dynamic>{
      'separationCount': separationCount,
      'maxNumberOfOccurrences': maxNumberOfOccurrences,
      'dayOfWeek': dayOfWeek,
      'dayOfMonth': dayOfMonth,
      'weekOfMonth': weekOfMonth,
      'monthOfYear': monthOfYear,
      'recurrenceType': this._getRecurrenceTypeText()
    };
  }

  RecurrencePattern copyWith({
    int separationCount,
    int maxNumberOfOccurrences,
    int dayOfWeek,
    int weekOfMonth,
    int dayOfMonth,
    int monthOfYear,
    RecurrenceType recurrenceType,
  }) {
    return RecurrencePattern(
      separationCount ?? this.separationCount,
      maxNumberOfOccurrences ?? this.maxNumberOfOccurrences,
      dayOfWeek ?? this.dayOfWeek,
      weekOfMonth ?? this.weekOfMonth,
      dayOfMonth ?? this.dayOfMonth,
      monthOfYear ?? this.monthOfYear,
      recurrenceType ?? this.recurrenceType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'separationCount': separationCount,
      'maxNumberOfOccurrences': maxNumberOfOccurrences,
      'dayOfWeek': dayOfWeek,
      'weekOfMonth': weekOfMonth,
      'dayOfMonth': dayOfMonth,
      'monthOfYear': monthOfYear,
      'recurrenceType': recurrenceType.toMap(),
    };
  }

  static RecurrencePattern fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecurrencePattern(
      map['separationCount'],
      map['maxNumberOfOccurrences'],
      map['dayOfWeek'],
      map['weekOfMonth'],
      map['dayOfMonth'],
      map['monthOfYear'],
      _getRecurrenceTypeFromText(map['recurrenceType']),
    );
  }

  String toJson() => json.encode(toMap());

  static RecurrencePattern fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecurrencePattern separationCount: $separationCount, maxNumberOfOccurrences: $maxNumberOfOccurrences, dayOfWeek: $dayOfWeek, weekOfMonth: $weekOfMonth, dayOfMonth: $dayOfMonth, monthOfYear: $monthOfYear, recurrenceType: $recurrenceType';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RecurrencePattern &&
        o.separationCount == separationCount &&
        o.maxNumberOfOccurrences == maxNumberOfOccurrences &&
        o.dayOfWeek == dayOfWeek &&
        o.weekOfMonth == weekOfMonth &&
        o.dayOfMonth == dayOfMonth &&
        o.monthOfYear == monthOfYear &&
        o.recurrenceType == recurrenceType;
  }

  @override
  int get hashCode {
    return separationCount.hashCode ^
        maxNumberOfOccurrences.hashCode ^
        dayOfWeek.hashCode ^
        weekOfMonth.hashCode ^
        dayOfMonth.hashCode ^
        monthOfYear.hashCode ^
        recurrenceType.hashCode;
  }
}
