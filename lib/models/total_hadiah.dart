class TotalHadiahResult {
  String message;
  bool status;
  Data data;

  TotalHadiahResult({
    required this.message,
    required this.status,
    required this.data,
  });

  factory TotalHadiahResult.fromJson(Map<String, dynamic> json) {
    return TotalHadiahResult(
      message: json['message'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<Summary> summary;
  int totalHadiah;

  Data({
    required this.summary,
    required this.totalHadiah,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      summary: List<Summary>.from(json['summary'].map((x) => Summary.fromJson(x))),
      totalHadiah: json['total_hadiah'],
    );
  }
}

class Summary {
  String jenis;
  List<Detail> details;
  int sumQty;

  Summary({
    required this.jenis,
    required this.details,
    required this.sumQty,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      jenis: json['jenis'],
      details: List<Detail>.from(json['details'].map((x) => Detail.fromJson(x))),
      sumQty: json['sum_qty'],
    );
  }
}

class Detail {
  int id;
  String tthNo;
  String ttottpNo;
  String jenis;
  int qty;
  String unit;

  Detail({
    required this.id,
    required this.tthNo,
    required this.ttottpNo,
    required this.jenis,
    required this.qty,
    required this.unit,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json['ID'],
      tthNo: json['TTHNo'],
      ttottpNo: json['TTOTTPNo'],
      jenis: json['Jenis'],
      qty: json['Qty'],
      unit: json['Unit'],
    );
  }
}