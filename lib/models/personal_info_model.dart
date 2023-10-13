class PersonalInfoModel {
  final String panCardImg;
  final String panNumber;
  final String panNumberPaste;
  final String job;
  final String email;
  final String emailPaste;
  final String industry;
  final String monthlySalary;
  final String? paytmAccount;
  final String bodyImg;
  const PersonalInfoModel({
    required this.panCardImg,
    required this.panNumber,
    this.panNumberPaste = '0',
    required this.job,
    required this.email,
    this.emailPaste = '0',
    required this.industry,
    required this.monthlySalary,
    this.paytmAccount,
    required this.bodyImg,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'panCardImg': panCardImg,
      'panNumber': panNumber,
      'panNumberPaste': panNumberPaste,
      'job': job,
      'email': email,
      'emailPaste': emailPaste,
      'industry': industry,
      'monthlySalary': monthlySalary,
      'bodyImg': bodyImg,
    };
    if (paytmAccount!.trim().isNotEmpty) json['paytmAccount'] = paytmAccount!;
    return json;
  }
}
