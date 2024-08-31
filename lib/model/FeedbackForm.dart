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
}