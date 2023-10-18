class BankInfoModel {
  final String bankName;
  final String bankCardNo;
  final String ifscCode;
  const BankInfoModel({
    required this.bankName,
    required this.bankCardNo,
    required this.ifscCode,
  });

  Map<String, dynamic> toJson() => {'bankName': bankName, 'bankCardNo': bankCardNo, 'ifscCode': ifscCode};
}
