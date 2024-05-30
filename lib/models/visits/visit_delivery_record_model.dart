class VisitDeliveryRecord {
  String docNumber;
  String failedReason;

  VisitDeliveryRecord({
    required this.docNumber,
    required this.failedReason,
  });

  factory VisitDeliveryRecord.fromJson(Map<String, dynamic> json) => VisitDeliveryRecord(
    docNumber: json['doc_number'],
    failedReason: json['failed_reason'],
  );

  Map<String, dynamic> toJson() => {
    'doc_number': docNumber,
    'failed_reason': failedReason,
  };

  VisitDeliveryRecord copyWith({
    String? docNumber,
    String? failedReason,
  }) {
    return VisitDeliveryRecord(
      docNumber: docNumber ?? this.docNumber,
      failedReason: failedReason ?? this.failedReason,
    );
  }
}
