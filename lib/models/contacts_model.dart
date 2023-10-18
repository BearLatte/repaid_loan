class ContactsModel {
  final String familyName;
  final String familyNumber;
  final String colleagueName;
  final String colleagueNumber;
  final String brotherOrSisterName;
  final String brotherOrSisterNumber;
  const ContactsModel({
    required this.familyName,
    required this.familyNumber,
    required this.colleagueName,
    required this.colleagueNumber,
    required this.brotherOrSisterName,
    required this.brotherOrSisterNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'familyName': familyName,
      'familyNumber': familyNumber,
      'colleagueName': colleagueName,
      'colleagueNumber': colleagueNumber,
      'brotherOrSisterName': brotherOrSisterName,
      'brotherOrSisterNumber': brotherOrSisterNumber,
    };
  }
}
