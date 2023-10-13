class KYCModel {
  final String frontImg;
  final String backImg;
  final String firstName;
  final String aadharNumber;
  final String adNumberPaste;
  final String gender;
  final String dateOfBirth;
  final String education;
  final String marriageStatus;
  final String residenceDetailAddress;
  final String residenceDetailAddressPaste;
  const KYCModel({
    required this.frontImg,
    required this.backImg,
    required this.firstName,
    required this.aadharNumber,
    this.adNumberPaste = '0',
    required this.gender,
    required this.dateOfBirth,
    required this.education,
    required this.marriageStatus,
    required this.residenceDetailAddress,
    this.residenceDetailAddressPaste = '0',
  });

  Map<String, dynamic> toJson() {
    return {
      'frontImg': frontImg,
      'backImg': backImg,
      'firstName': firstName,
      'aadharNumber': aadharNumber,
      'adNumberPaste': adNumberPaste,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'education': education,
      'marriageStatus': marriageStatus,
      'residenceDetailAddress': residenceDetailAddress,
      'residenceDetailAddressPaste': residenceDetailAddressPaste,
    };
  }
}
