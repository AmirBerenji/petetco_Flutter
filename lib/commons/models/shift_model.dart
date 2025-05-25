class Shift {
  final int? dayOfWeek;
  final dynamic startTime;
  final List<Time>? times;

  Shift({
    this.dayOfWeek,
    this.startTime,
    this.times,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        dayOfWeek: json["day_of_week"],
        startTime: json["start_time"],
        times: json["times"] == null
            ? []
            : List<Time>.from(json["times"]!.map((x) => Time.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day_of_week": dayOfWeek,
        "start_time": startTime,
        "times": times == null
            ? []
            : List<dynamic>.from(times!.map((x) => x.toJson())),
      };
}

class Time {
  final String? startTime;
  final String? endTime;

  Time({
    this.startTime,
    this.endTime,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
      };
}
