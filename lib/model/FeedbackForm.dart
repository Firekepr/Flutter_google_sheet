class FeedbackForm {
  String name;
  String email;
  String mobile_number;
  String feedBack;

  FeedbackForm({
    required this.name,
    required this.email,
    required this.mobile_number,
    required this.feedBack,
  });

  String toParams() => "?name=$name&email=$email&mobileNumber=$mobile_number&feedback=$feedBack";

  factory FeedbackForm.fromMap(List<dynamic> map) => FeedbackForm(
    name: map[0],
    email: map[1].toString(),
    mobile_number: map[2].toString(),
    feedBack: map[3].toString(),
  );
}