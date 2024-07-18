class CustomerResult {
  String? message;
  bool? status;
  List<Data>? data;

  CustomerResult({this.message, this.status, this.data});

  factory CustomerResult.fromJson(Map<String, dynamic> json) {
    return CustomerResult(
      message: json['message'],
      status: json['status'],
      data: (json['data'] as List).map((i) => Data.fromJson(i)).toList(),
    );
  }
}

class Data {
  String? custID;
  String? name;
  String? address;
  String? branchCode;
  String? phoneNo;
  List<Tth>? tth;

  Data({
    this.custID,
    this.name,
    this.address,
    this.branchCode,
    this.phoneNo,
    this.tth,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      custID: json['CustID'],
      name: json['Name'],
      address: json['Address'],
      branchCode: json['BranchCode'],
      phoneNo: json['PhoneNo'],
      tth: (json['tth'] as List).map((i) => Tth.fromJson(i)).toList(),
    );
  }
}

class Tth {
  int? iD;
  String? tTHNo;
  String? salesID;
  String? tTOTTPNo;
  String? custID;
  String? docDate;
  int? received;
  String? receivedDate;
  String? failedReason;
  List<Details>? details;

  Tth({
    this.iD,
    this.tTHNo,
    this.salesID,
    this.tTOTTPNo,
    this.custID,
    this.docDate,
    this.received,
    this.receivedDate,
    this.failedReason,
    this.details,
  });

  factory Tth.fromJson(Map<String, dynamic> json) {
    return Tth(
      iD: json['ID'],
      tTHNo: json['TTHNo'],
      salesID: json['SalesID'],
      tTOTTPNo: json['TTOTTPNo'],
      custID: json['CustID'],
      docDate: json['DocDate'],
      received: json['Received'],
      receivedDate: json['ReceivedDate'],
      failedReason: json['FailedReason'],
      details: (json['details'] as List).map((i) => Details.fromJson(i)).toList(),
    );
  }
}

class Details {
  int? iD;
  String? tTHNo;
  String? tTOTTPNo;
  String? jenis;
  int? qty;
  String? unit;

  Details({
    this.iD,
    this.tTHNo,
    this.tTOTTPNo,
    this.jenis,
    this.qty,
    this.unit,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      iD: json['ID'],
      tTHNo: json['TTHNo'],
      tTOTTPNo: json['TTOTTPNo'],
      jenis: json['Jenis'],
      qty: json['Qty'],
      unit: json['Unit'],
    );
  }
}
