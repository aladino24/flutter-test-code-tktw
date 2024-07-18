class Customer {
  String? custID;
  String? name;
  String? address;
  String? branchCode;
  String? phoneNo;

  Customer({
    this.custID,
    this.name,
    this.address,
    this.branchCode,
    this.phoneNo,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      custID: json['CustID'],
      name: json['Name'],
      address: json['Address'],
      branchCode: json['BranchCode'],
      phoneNo: json['PhoneNo'],
    );
  }
}
