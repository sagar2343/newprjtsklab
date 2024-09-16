/// ProPubEmployeeDetails : [{"ProPubStrCompanyName":"Thalappakatti Hotels Pvt Ltd.","ProPubStrEmpcd":"D027673","ProPubStrFullName":"Eswara Rao  Madugula","ProPubStrConfdt":"01 Jan 1900","ProPubStrGender":"Male","ProPubStrBirthDt":"31 Aug 1985","ProPubStrLocation":"BLR - Corporate","ProPubStrCategory":"Corporate","ProPubStrJoinDt":"16 Mar 2021","ProPubStrStaffCategory":"--","ProPubStrDepartment":"Human Resources","ProPubStrSubdepartment":"--","ProPubStrGrade":"DT 3","ProPubStrMaritalStatus":"Single","ProPubStrPresentStatus":"CONFIRMED","ProPubStrMARRDATE":"","ProPubStrDesignation":"Senior Manager HR","ProPubStrPosition":"--"}]
/// ProPubEmployeeReporting : [{"ProPubStrAName":"Moinul Ashraf","ProPubStrARollcd":"01","ProPubStrAEmpcd":"D024807","ProPubStrALocation":"BLR - Corporate","ProPubStrAPosition":"","ProPubStrADepartment":"Human Resources","ProPubStrASubDepartment":"--","ProPubStrADesgination":"GENERAL MANAGER HR","ProPubStrAGrade":"DT 4","ProPubStrFName":"Moinul Ashraf","ProPubStrFRollcd":"01","ProPubStrFEmpcd":"D024807","ProPubStrFLocation":"BLR - Corporate","ProPubStrFPosition":"","ProPubStrFDepartment":"Operations","ProPubStrFSubDepartment":"--","ProPubStrFDesgination":"CHIEF EXECUTIVE OFFICER","ProPubStrFGrade":"DT 4"}]
/// ProPubEmployeeContact : [{"ProPubStrPresentAdd":"#14/2, ashirwad nilaya, 5th cross , l.n. colony, yeshwanthpura bangalore , bangalore, karnataka, india","ProPubStrPrPinCode":"560020    ","ProPubStrPrTelephoneNo":"--","ProPubStrPermanentAdd":"#14/2, ashirwad nilaya, 5th cross , l.n. colony, yeshwanthpura bangalore , bangalore, karnataka, india","ProPubStrPePinCode":"560020    ","ProPubStrPeTelephoneNo":"--","ProPubStrEmergencyAdd":"#14/2, ashirwad nilaya, 5th cross , l.n. colony, yeshwanthpura bangalore , bangalore, karnataka, india","ProPubStrEmPinCode":"560020    ","ProPubStrEmTelephoneNo":"--","ProPubStrOfficeTelephone":"","ProPubStrResTelephone":"","ProPubStrEmailOffcial":"","ProPubStrEmailPersonal":"eswar@gmail.com","ProPubStrEmpMobile":"9035795779","ProPubStrFaxNumber":""}]
/// ProPubEmployeeEducation : [{"ProPubStrRollcd":"01","ProPubStrEmpcd":"D027673","ProPubStrQualdesc":"MBA","ProPubStrPassyear":"     ","ProPubStrDuration":"0.00","ProPubStrResult":"QUALIFIED","ProPubStrLocation":"--"}]
/// ProPubEmployeeFamily : [{"ProPubStrName":"Ammadu","ProPubStrRelation":"Mother","ProPubStrStatus":"","ProPubStrAge":"65.00","ProPubStrEmployeed":"No","ProPubStrMedical":"No"},{"ProPubStrName":"Suryanarayana","ProPubStrRelation":"Father","ProPubStrStatus":"","ProPubStrAge":"0.00","ProPubStrEmployeed":"No","ProPubStrMedical":"No"}]
/// ProPubEmployeeMyTeam : [{"ProPubStrRollcd":"","ProPubStrEmpcd":"","ProPubStrDesignation":"","ProPubStrGrade":"","ProPubStrLocation":"","ProPubStrDepartment":""}]

class EmployeeResponse {
  EmployeeResponse({
      List<ProPubEmployeeDetails>? proPubEmployeeDetails, 
      List<ProPubEmployeeReporting>? proPubEmployeeReporting, 
      List<ProPubEmployeeContact>? proPubEmployeeContact, 
      List<ProPubEmployeeEducation>? proPubEmployeeEducation, 
      List<ProPubEmployeeFamily>? proPubEmployeeFamily, 
      List<ProPubEmployeeMyTeam>? proPubEmployeeMyTeam,}){
    _proPubEmployeeDetails = proPubEmployeeDetails;
    _proPubEmployeeReporting = proPubEmployeeReporting;
    _proPubEmployeeContact = proPubEmployeeContact;
    _proPubEmployeeEducation = proPubEmployeeEducation;
    _proPubEmployeeFamily = proPubEmployeeFamily;
    _proPubEmployeeMyTeam = proPubEmployeeMyTeam;
}

  EmployeeResponse.fromJson(dynamic json) {
    if (json['ProPubEmployeeDetails'] != null) {
      _proPubEmployeeDetails = [];
      json['ProPubEmployeeDetails'].forEach((v) {
        _proPubEmployeeDetails?.add(ProPubEmployeeDetails.fromJson(v));
      });
    }
    if (json['ProPubEmployeeReporting'] != null) {
      _proPubEmployeeReporting = [];
      json['ProPubEmployeeReporting'].forEach((v) {
        _proPubEmployeeReporting?.add(ProPubEmployeeReporting.fromJson(v));
      });
    }
    if (json['ProPubEmployeeContact'] != null) {
      _proPubEmployeeContact = [];
      json['ProPubEmployeeContact'].forEach((v) {
        _proPubEmployeeContact?.add(ProPubEmployeeContact.fromJson(v));
      });
    }
    if (json['ProPubEmployeeEducation'] != null) {
      _proPubEmployeeEducation = [];
      json['ProPubEmployeeEducation'].forEach((v) {
        _proPubEmployeeEducation?.add(ProPubEmployeeEducation.fromJson(v));
      });
    }
    if (json['ProPubEmployeeFamily'] != null) {
      _proPubEmployeeFamily = [];
      json['ProPubEmployeeFamily'].forEach((v) {
        _proPubEmployeeFamily?.add(ProPubEmployeeFamily.fromJson(v));
      });
    }
    if (json['ProPubEmployeeMyTeam'] != null) {
      _proPubEmployeeMyTeam = [];
      json['ProPubEmployeeMyTeam'].forEach((v) {
        _proPubEmployeeMyTeam?.add(ProPubEmployeeMyTeam.fromJson(v));
      });
    }
  }
  List<ProPubEmployeeDetails>? _proPubEmployeeDetails;
  List<ProPubEmployeeReporting>? _proPubEmployeeReporting;
  List<ProPubEmployeeContact>? _proPubEmployeeContact;
  List<ProPubEmployeeEducation>? _proPubEmployeeEducation;
  List<ProPubEmployeeFamily>? _proPubEmployeeFamily;
  List<ProPubEmployeeMyTeam>? _proPubEmployeeMyTeam;
EmployeeResponse copyWith({  List<ProPubEmployeeDetails>? proPubEmployeeDetails,
  List<ProPubEmployeeReporting>? proPubEmployeeReporting,
  List<ProPubEmployeeContact>? proPubEmployeeContact,
  List<ProPubEmployeeEducation>? proPubEmployeeEducation,
  List<ProPubEmployeeFamily>? proPubEmployeeFamily,
  List<ProPubEmployeeMyTeam>? proPubEmployeeMyTeam,
}) => EmployeeResponse(  proPubEmployeeDetails: proPubEmployeeDetails ?? _proPubEmployeeDetails,
  proPubEmployeeReporting: proPubEmployeeReporting ?? _proPubEmployeeReporting,
  proPubEmployeeContact: proPubEmployeeContact ?? _proPubEmployeeContact,
  proPubEmployeeEducation: proPubEmployeeEducation ?? _proPubEmployeeEducation,
  proPubEmployeeFamily: proPubEmployeeFamily ?? _proPubEmployeeFamily,
  proPubEmployeeMyTeam: proPubEmployeeMyTeam ?? _proPubEmployeeMyTeam,
);
  List<ProPubEmployeeDetails>? get proPubEmployeeDetails => _proPubEmployeeDetails;
  List<ProPubEmployeeReporting>? get proPubEmployeeReporting => _proPubEmployeeReporting;
  List<ProPubEmployeeContact>? get proPubEmployeeContact => _proPubEmployeeContact;
  List<ProPubEmployeeEducation>? get proPubEmployeeEducation => _proPubEmployeeEducation;
  List<ProPubEmployeeFamily>? get proPubEmployeeFamily => _proPubEmployeeFamily;
  List<ProPubEmployeeMyTeam>? get proPubEmployeeMyTeam => _proPubEmployeeMyTeam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_proPubEmployeeDetails != null) {
      map['ProPubEmployeeDetails'] = _proPubEmployeeDetails?.map((v) => v.toJson()).toList();
    }
    if (_proPubEmployeeReporting != null) {
      map['ProPubEmployeeReporting'] = _proPubEmployeeReporting?.map((v) => v.toJson()).toList();
    }
    if (_proPubEmployeeContact != null) {
      map['ProPubEmployeeContact'] = _proPubEmployeeContact?.map((v) => v.toJson()).toList();
    }
    if (_proPubEmployeeEducation != null) {
      map['ProPubEmployeeEducation'] = _proPubEmployeeEducation?.map((v) => v.toJson()).toList();
    }
    if (_proPubEmployeeFamily != null) {
      map['ProPubEmployeeFamily'] = _proPubEmployeeFamily?.map((v) => v.toJson()).toList();
    }
    if (_proPubEmployeeMyTeam != null) {
      map['ProPubEmployeeMyTeam'] = _proPubEmployeeMyTeam?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ProPubStrRollcd : ""
/// ProPubStrEmpcd : ""
/// ProPubStrDesignation : ""
/// ProPubStrGrade : ""
/// ProPubStrLocation : ""
/// ProPubStrDepartment : ""

class ProPubEmployeeMyTeam {
  ProPubEmployeeMyTeam({
      String? proPubStrRollcd, 
      String? proPubStrEmpcd, 
      String? proPubStrDesignation, 
      String? proPubStrGrade, 
      String? proPubStrLocation, 
      String? proPubStrDepartment,}){
    _proPubStrRollcd = proPubStrRollcd;
    _proPubStrEmpcd = proPubStrEmpcd;
    _proPubStrDesignation = proPubStrDesignation;
    _proPubStrGrade = proPubStrGrade;
    _proPubStrLocation = proPubStrLocation;
    _proPubStrDepartment = proPubStrDepartment;
}

  ProPubEmployeeMyTeam.fromJson(dynamic json) {
    _proPubStrRollcd = json['ProPubStrRollcd'];
    _proPubStrEmpcd = json['ProPubStrEmpcd'];
    _proPubStrDesignation = json['ProPubStrDesignation'];
    _proPubStrGrade = json['ProPubStrGrade'];
    _proPubStrLocation = json['ProPubStrLocation'];
    _proPubStrDepartment = json['ProPubStrDepartment'];
  }
  String? _proPubStrRollcd;
  String? _proPubStrEmpcd;
  String? _proPubStrDesignation;
  String? _proPubStrGrade;
  String? _proPubStrLocation;
  String? _proPubStrDepartment;
ProPubEmployeeMyTeam copyWith({  String? proPubStrRollcd,
  String? proPubStrEmpcd,
  String? proPubStrDesignation,
  String? proPubStrGrade,
  String? proPubStrLocation,
  String? proPubStrDepartment,
}) => ProPubEmployeeMyTeam(  proPubStrRollcd: proPubStrRollcd ?? _proPubStrRollcd,
  proPubStrEmpcd: proPubStrEmpcd ?? _proPubStrEmpcd,
  proPubStrDesignation: proPubStrDesignation ?? _proPubStrDesignation,
  proPubStrGrade: proPubStrGrade ?? _proPubStrGrade,
  proPubStrLocation: proPubStrLocation ?? _proPubStrLocation,
  proPubStrDepartment: proPubStrDepartment ?? _proPubStrDepartment,
);
  String? get proPubStrRollcd => _proPubStrRollcd;
  String? get proPubStrEmpcd => _proPubStrEmpcd;
  String? get proPubStrDesignation => _proPubStrDesignation;
  String? get proPubStrGrade => _proPubStrGrade;
  String? get proPubStrLocation => _proPubStrLocation;
  String? get proPubStrDepartment => _proPubStrDepartment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrRollcd'] = _proPubStrRollcd;
    map['ProPubStrEmpcd'] = _proPubStrEmpcd;
    map['ProPubStrDesignation'] = _proPubStrDesignation;
    map['ProPubStrGrade'] = _proPubStrGrade;
    map['ProPubStrLocation'] = _proPubStrLocation;
    map['ProPubStrDepartment'] = _proPubStrDepartment;
    return map;
  }

}

/// ProPubStrName : "Ammadu"
/// ProPubStrRelation : "Mother"
/// ProPubStrStatus : ""
/// ProPubStrAge : "65.00"
/// ProPubStrEmployeed : "No"
/// ProPubStrMedical : "No"

class ProPubEmployeeFamily {
  ProPubEmployeeFamily({
      String? proPubStrName, 
      String? proPubStrRelation, 
      String? proPubStrStatus, 
      String? proPubStrAge, 
      String? proPubStrEmployeed, 
      String? proPubStrMedical,}){
    _proPubStrName = proPubStrName;
    _proPubStrRelation = proPubStrRelation;
    _proPubStrStatus = proPubStrStatus;
    _proPubStrAge = proPubStrAge;
    _proPubStrEmployeed = proPubStrEmployeed;
    _proPubStrMedical = proPubStrMedical;
}

  ProPubEmployeeFamily.fromJson(dynamic json) {
    _proPubStrName = json['ProPubStrName'];
    _proPubStrRelation = json['ProPubStrRelation'];
    _proPubStrStatus = json['ProPubStrStatus'];
    _proPubStrAge = json['ProPubStrAge'];
    _proPubStrEmployeed = json['ProPubStrEmployeed'];
    _proPubStrMedical = json['ProPubStrMedical'];
  }
  String? _proPubStrName;
  String? _proPubStrRelation;
  String? _proPubStrStatus;
  String? _proPubStrAge;
  String? _proPubStrEmployeed;
  String? _proPubStrMedical;
ProPubEmployeeFamily copyWith({  String? proPubStrName,
  String? proPubStrRelation,
  String? proPubStrStatus,
  String? proPubStrAge,
  String? proPubStrEmployeed,
  String? proPubStrMedical,
}) => ProPubEmployeeFamily(  proPubStrName: proPubStrName ?? _proPubStrName,
  proPubStrRelation: proPubStrRelation ?? _proPubStrRelation,
  proPubStrStatus: proPubStrStatus ?? _proPubStrStatus,
  proPubStrAge: proPubStrAge ?? _proPubStrAge,
  proPubStrEmployeed: proPubStrEmployeed ?? _proPubStrEmployeed,
  proPubStrMedical: proPubStrMedical ?? _proPubStrMedical,
);
  String? get proPubStrName => _proPubStrName;
  String? get proPubStrRelation => _proPubStrRelation;
  String? get proPubStrStatus => _proPubStrStatus;
  String? get proPubStrAge => _proPubStrAge;
  String? get proPubStrEmployeed => _proPubStrEmployeed;
  String? get proPubStrMedical => _proPubStrMedical;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrName'] = _proPubStrName;
    map['ProPubStrRelation'] = _proPubStrRelation;
    map['ProPubStrStatus'] = _proPubStrStatus;
    map['ProPubStrAge'] = _proPubStrAge;
    map['ProPubStrEmployeed'] = _proPubStrEmployeed;
    map['ProPubStrMedical'] = _proPubStrMedical;
    return map;
  }

}

/// ProPubStrRollcd : "01"
/// ProPubStrEmpcd : "D027673"
/// ProPubStrQualdesc : "MBA"
/// ProPubStrPassyear : "     "
/// ProPubStrDuration : "0.00"
/// ProPubStrResult : "QUALIFIED"
/// ProPubStrLocation : "--"

class ProPubEmployeeEducation {
  ProPubEmployeeEducation({
      String? proPubStrRollcd, 
      String? proPubStrEmpcd, 
      String? proPubStrQualdesc, 
      String? proPubStrPassyear, 
      String? proPubStrDuration, 
      String? proPubStrResult, 
      String? proPubStrLocation,}){
    _proPubStrRollcd = proPubStrRollcd;
    _proPubStrEmpcd = proPubStrEmpcd;
    _proPubStrQualdesc = proPubStrQualdesc;
    _proPubStrPassyear = proPubStrPassyear;
    _proPubStrDuration = proPubStrDuration;
    _proPubStrResult = proPubStrResult;
    _proPubStrLocation = proPubStrLocation;
}

  ProPubEmployeeEducation.fromJson(dynamic json) {
    _proPubStrRollcd = json['ProPubStrRollcd'];
    _proPubStrEmpcd = json['ProPubStrEmpcd'];
    _proPubStrQualdesc = json['ProPubStrQualdesc'];
    _proPubStrPassyear = json['ProPubStrPassyear'];
    _proPubStrDuration = json['ProPubStrDuration'];
    _proPubStrResult = json['ProPubStrResult'];
    _proPubStrLocation = json['ProPubStrLocation'];
  }
  String? _proPubStrRollcd;
  String? _proPubStrEmpcd;
  String? _proPubStrQualdesc;
  String? _proPubStrPassyear;
  String? _proPubStrDuration;
  String? _proPubStrResult;
  String? _proPubStrLocation;
ProPubEmployeeEducation copyWith({  String? proPubStrRollcd,
  String? proPubStrEmpcd,
  String? proPubStrQualdesc,
  String? proPubStrPassyear,
  String? proPubStrDuration,
  String? proPubStrResult,
  String? proPubStrLocation,
}) => ProPubEmployeeEducation(  proPubStrRollcd: proPubStrRollcd ?? _proPubStrRollcd,
  proPubStrEmpcd: proPubStrEmpcd ?? _proPubStrEmpcd,
  proPubStrQualdesc: proPubStrQualdesc ?? _proPubStrQualdesc,
  proPubStrPassyear: proPubStrPassyear ?? _proPubStrPassyear,
  proPubStrDuration: proPubStrDuration ?? _proPubStrDuration,
  proPubStrResult: proPubStrResult ?? _proPubStrResult,
  proPubStrLocation: proPubStrLocation ?? _proPubStrLocation,
);
  String? get proPubStrRollcd => _proPubStrRollcd;
  String? get proPubStrEmpcd => _proPubStrEmpcd;
  String? get proPubStrQualdesc => _proPubStrQualdesc;
  String? get proPubStrPassyear => _proPubStrPassyear;
  String? get proPubStrDuration => _proPubStrDuration;
  String? get proPubStrResult => _proPubStrResult;
  String? get proPubStrLocation => _proPubStrLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrRollcd'] = _proPubStrRollcd;
    map['ProPubStrEmpcd'] = _proPubStrEmpcd;
    map['ProPubStrQualdesc'] = _proPubStrQualdesc;
    map['ProPubStrPassyear'] = _proPubStrPassyear;
    map['ProPubStrDuration'] = _proPubStrDuration;
    map['ProPubStrResult'] = _proPubStrResult;
    map['ProPubStrLocation'] = _proPubStrLocation;
    return map;
  }

}

/// ProPubStrPresentAdd : "#14/2, ashirwad nilaya, 5th cross , l.n. colony, yeshwanthpura bangalore , bangalore, karnataka, india"
/// ProPubStrPrPinCode : "560020    "
/// ProPubStrPrTelephoneNo : "--"
/// ProPubStrPermanentAdd : "#14/2, ashirwad nilaya, 5th cross , l.n. colony, yeshwanthpura bangalore , bangalore, karnataka, india"
/// ProPubStrPePinCode : "560020    "
/// ProPubStrPeTelephoneNo : "--"
/// ProPubStrEmergencyAdd : "#14/2, ashirwad nilaya, 5th cross , l.n. colony, yeshwanthpura bangalore , bangalore, karnataka, india"
/// ProPubStrEmPinCode : "560020    "
/// ProPubStrEmTelephoneNo : "--"
/// ProPubStrOfficeTelephone : ""
/// ProPubStrResTelephone : ""
/// ProPubStrEmailOffcial : ""
/// ProPubStrEmailPersonal : "eswar@gmail.com"
/// ProPubStrEmpMobile : "9035795779"
/// ProPubStrFaxNumber : ""

class ProPubEmployeeContact {
  ProPubEmployeeContact({
      String? proPubStrPresentAdd, 
      String? proPubStrPrPinCode, 
      String? proPubStrPrTelephoneNo, 
      String? proPubStrPermanentAdd, 
      String? proPubStrPePinCode, 
      String? proPubStrPeTelephoneNo, 
      String? proPubStrEmergencyAdd, 
      String? proPubStrEmPinCode, 
      String? proPubStrEmTelephoneNo, 
      String? proPubStrOfficeTelephone, 
      String? proPubStrResTelephone, 
      String? proPubStrEmailOffcial, 
      String? proPubStrEmailPersonal, 
      String? proPubStrEmpMobile, 
      String? proPubStrFaxNumber,}){
    _proPubStrPresentAdd = proPubStrPresentAdd;
    _proPubStrPrPinCode = proPubStrPrPinCode;
    _proPubStrPrTelephoneNo = proPubStrPrTelephoneNo;
    _proPubStrPermanentAdd = proPubStrPermanentAdd;
    _proPubStrPePinCode = proPubStrPePinCode;
    _proPubStrPeTelephoneNo = proPubStrPeTelephoneNo;
    _proPubStrEmergencyAdd = proPubStrEmergencyAdd;
    _proPubStrEmPinCode = proPubStrEmPinCode;
    _proPubStrEmTelephoneNo = proPubStrEmTelephoneNo;
    _proPubStrOfficeTelephone = proPubStrOfficeTelephone;
    _proPubStrResTelephone = proPubStrResTelephone;
    _proPubStrEmailOffcial = proPubStrEmailOffcial;
    _proPubStrEmailPersonal = proPubStrEmailPersonal;
    _proPubStrEmpMobile = proPubStrEmpMobile;
    _proPubStrFaxNumber = proPubStrFaxNumber;
}

  ProPubEmployeeContact.fromJson(dynamic json) {
    _proPubStrPresentAdd = json['ProPubStrPresentAdd'];
    _proPubStrPrPinCode = json['ProPubStrPrPinCode'];
    _proPubStrPrTelephoneNo = json['ProPubStrPrTelephoneNo'];
    _proPubStrPermanentAdd = json['ProPubStrPermanentAdd'];
    _proPubStrPePinCode = json['ProPubStrPePinCode'];
    _proPubStrPeTelephoneNo = json['ProPubStrPeTelephoneNo'];
    _proPubStrEmergencyAdd = json['ProPubStrEmergencyAdd'];
    _proPubStrEmPinCode = json['ProPubStrEmPinCode'];
    _proPubStrEmTelephoneNo = json['ProPubStrEmTelephoneNo'];
    _proPubStrOfficeTelephone = json['ProPubStrOfficeTelephone'];
    _proPubStrResTelephone = json['ProPubStrResTelephone'];
    _proPubStrEmailOffcial = json['ProPubStrEmailOffcial'];
    _proPubStrEmailPersonal = json['ProPubStrEmailPersonal'];
    _proPubStrEmpMobile = json['ProPubStrEmpMobile'];
    _proPubStrFaxNumber = json['ProPubStrFaxNumber'];
  }
  String? _proPubStrPresentAdd;
  String? _proPubStrPrPinCode;
  String? _proPubStrPrTelephoneNo;
  String? _proPubStrPermanentAdd;
  String? _proPubStrPePinCode;
  String? _proPubStrPeTelephoneNo;
  String? _proPubStrEmergencyAdd;
  String? _proPubStrEmPinCode;
  String? _proPubStrEmTelephoneNo;
  String? _proPubStrOfficeTelephone;
  String? _proPubStrResTelephone;
  String? _proPubStrEmailOffcial;
  String? _proPubStrEmailPersonal;
  String? _proPubStrEmpMobile;
  String? _proPubStrFaxNumber;
ProPubEmployeeContact copyWith({  String? proPubStrPresentAdd,
  String? proPubStrPrPinCode,
  String? proPubStrPrTelephoneNo,
  String? proPubStrPermanentAdd,
  String? proPubStrPePinCode,
  String? proPubStrPeTelephoneNo,
  String? proPubStrEmergencyAdd,
  String? proPubStrEmPinCode,
  String? proPubStrEmTelephoneNo,
  String? proPubStrOfficeTelephone,
  String? proPubStrResTelephone,
  String? proPubStrEmailOffcial,
  String? proPubStrEmailPersonal,
  String? proPubStrEmpMobile,
  String? proPubStrFaxNumber,
}) => ProPubEmployeeContact(  proPubStrPresentAdd: proPubStrPresentAdd ?? _proPubStrPresentAdd,
  proPubStrPrPinCode: proPubStrPrPinCode ?? _proPubStrPrPinCode,
  proPubStrPrTelephoneNo: proPubStrPrTelephoneNo ?? _proPubStrPrTelephoneNo,
  proPubStrPermanentAdd: proPubStrPermanentAdd ?? _proPubStrPermanentAdd,
  proPubStrPePinCode: proPubStrPePinCode ?? _proPubStrPePinCode,
  proPubStrPeTelephoneNo: proPubStrPeTelephoneNo ?? _proPubStrPeTelephoneNo,
  proPubStrEmergencyAdd: proPubStrEmergencyAdd ?? _proPubStrEmergencyAdd,
  proPubStrEmPinCode: proPubStrEmPinCode ?? _proPubStrEmPinCode,
  proPubStrEmTelephoneNo: proPubStrEmTelephoneNo ?? _proPubStrEmTelephoneNo,
  proPubStrOfficeTelephone: proPubStrOfficeTelephone ?? _proPubStrOfficeTelephone,
  proPubStrResTelephone: proPubStrResTelephone ?? _proPubStrResTelephone,
  proPubStrEmailOffcial: proPubStrEmailOffcial ?? _proPubStrEmailOffcial,
  proPubStrEmailPersonal: proPubStrEmailPersonal ?? _proPubStrEmailPersonal,
  proPubStrEmpMobile: proPubStrEmpMobile ?? _proPubStrEmpMobile,
  proPubStrFaxNumber: proPubStrFaxNumber ?? _proPubStrFaxNumber,
);
  String? get proPubStrPresentAdd => _proPubStrPresentAdd;
  String? get proPubStrPrPinCode => _proPubStrPrPinCode;
  String? get proPubStrPrTelephoneNo => _proPubStrPrTelephoneNo;
  String? get proPubStrPermanentAdd => _proPubStrPermanentAdd;
  String? get proPubStrPePinCode => _proPubStrPePinCode;
  String? get proPubStrPeTelephoneNo => _proPubStrPeTelephoneNo;
  String? get proPubStrEmergencyAdd => _proPubStrEmergencyAdd;
  String? get proPubStrEmPinCode => _proPubStrEmPinCode;
  String? get proPubStrEmTelephoneNo => _proPubStrEmTelephoneNo;
  String? get proPubStrOfficeTelephone => _proPubStrOfficeTelephone;
  String? get proPubStrResTelephone => _proPubStrResTelephone;
  String? get proPubStrEmailOffcial => _proPubStrEmailOffcial;
  String? get proPubStrEmailPersonal => _proPubStrEmailPersonal;
  String? get proPubStrEmpMobile => _proPubStrEmpMobile;
  String? get proPubStrFaxNumber => _proPubStrFaxNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrPresentAdd'] = _proPubStrPresentAdd;
    map['ProPubStrPrPinCode'] = _proPubStrPrPinCode;
    map['ProPubStrPrTelephoneNo'] = _proPubStrPrTelephoneNo;
    map['ProPubStrPermanentAdd'] = _proPubStrPermanentAdd;
    map['ProPubStrPePinCode'] = _proPubStrPePinCode;
    map['ProPubStrPeTelephoneNo'] = _proPubStrPeTelephoneNo;
    map['ProPubStrEmergencyAdd'] = _proPubStrEmergencyAdd;
    map['ProPubStrEmPinCode'] = _proPubStrEmPinCode;
    map['ProPubStrEmTelephoneNo'] = _proPubStrEmTelephoneNo;
    map['ProPubStrOfficeTelephone'] = _proPubStrOfficeTelephone;
    map['ProPubStrResTelephone'] = _proPubStrResTelephone;
    map['ProPubStrEmailOffcial'] = _proPubStrEmailOffcial;
    map['ProPubStrEmailPersonal'] = _proPubStrEmailPersonal;
    map['ProPubStrEmpMobile'] = _proPubStrEmpMobile;
    map['ProPubStrFaxNumber'] = _proPubStrFaxNumber;
    return map;
  }

}

/// ProPubStrAName : "Moinul Ashraf"
/// ProPubStrARollcd : "01"
/// ProPubStrAEmpcd : "D024807"
/// ProPubStrALocation : "BLR - Corporate"
/// ProPubStrAPosition : ""
/// ProPubStrADepartment : "Human Resources"
/// ProPubStrASubDepartment : "--"
/// ProPubStrADesgination : "GENERAL MANAGER HR"
/// ProPubStrAGrade : "DT 4"
/// ProPubStrFName : "Moinul Ashraf"
/// ProPubStrFRollcd : "01"
/// ProPubStrFEmpcd : "D024807"
/// ProPubStrFLocation : "BLR - Corporate"
/// ProPubStrFPosition : ""
/// ProPubStrFDepartment : "Operations"
/// ProPubStrFSubDepartment : "--"
/// ProPubStrFDesgination : "CHIEF EXECUTIVE OFFICER"
/// ProPubStrFGrade : "DT 4"

class ProPubEmployeeReporting {
  ProPubEmployeeReporting({
      String? proPubStrAName, 
      String? proPubStrARollcd, 
      String? proPubStrAEmpcd, 
      String? proPubStrALocation, 
      String? proPubStrAPosition, 
      String? proPubStrADepartment, 
      String? proPubStrASubDepartment, 
      String? proPubStrADesgination, 
      String? proPubStrAGrade, 
      String? proPubStrFName, 
      String? proPubStrFRollcd, 
      String? proPubStrFEmpcd, 
      String? proPubStrFLocation, 
      String? proPubStrFPosition, 
      String? proPubStrFDepartment, 
      String? proPubStrFSubDepartment, 
      String? proPubStrFDesgination, 
      String? proPubStrFGrade,}){
    _proPubStrAName = proPubStrAName;
    _proPubStrARollcd = proPubStrARollcd;
    _proPubStrAEmpcd = proPubStrAEmpcd;
    _proPubStrALocation = proPubStrALocation;
    _proPubStrAPosition = proPubStrAPosition;
    _proPubStrADepartment = proPubStrADepartment;
    _proPubStrASubDepartment = proPubStrASubDepartment;
    _proPubStrADesgination = proPubStrADesgination;
    _proPubStrAGrade = proPubStrAGrade;
    _proPubStrFName = proPubStrFName;
    _proPubStrFRollcd = proPubStrFRollcd;
    _proPubStrFEmpcd = proPubStrFEmpcd;
    _proPubStrFLocation = proPubStrFLocation;
    _proPubStrFPosition = proPubStrFPosition;
    _proPubStrFDepartment = proPubStrFDepartment;
    _proPubStrFSubDepartment = proPubStrFSubDepartment;
    _proPubStrFDesgination = proPubStrFDesgination;
    _proPubStrFGrade = proPubStrFGrade;
}

  ProPubEmployeeReporting.fromJson(dynamic json) {
    _proPubStrAName = json['ProPubStrAName'];
    _proPubStrARollcd = json['ProPubStrARollcd'];
    _proPubStrAEmpcd = json['ProPubStrAEmpcd'];
    _proPubStrALocation = json['ProPubStrALocation'];
    _proPubStrAPosition = json['ProPubStrAPosition'];
    _proPubStrADepartment = json['ProPubStrADepartment'];
    _proPubStrASubDepartment = json['ProPubStrASubDepartment'];
    _proPubStrADesgination = json['ProPubStrADesgination'];
    _proPubStrAGrade = json['ProPubStrAGrade'];
    _proPubStrFName = json['ProPubStrFName'];
    _proPubStrFRollcd = json['ProPubStrFRollcd'];
    _proPubStrFEmpcd = json['ProPubStrFEmpcd'];
    _proPubStrFLocation = json['ProPubStrFLocation'];
    _proPubStrFPosition = json['ProPubStrFPosition'];
    _proPubStrFDepartment = json['ProPubStrFDepartment'];
    _proPubStrFSubDepartment = json['ProPubStrFSubDepartment'];
    _proPubStrFDesgination = json['ProPubStrFDesgination'];
    _proPubStrFGrade = json['ProPubStrFGrade'];
  }
  String? _proPubStrAName;
  String? _proPubStrARollcd;
  String? _proPubStrAEmpcd;
  String? _proPubStrALocation;
  String? _proPubStrAPosition;
  String? _proPubStrADepartment;
  String? _proPubStrASubDepartment;
  String? _proPubStrADesgination;
  String? _proPubStrAGrade;
  String? _proPubStrFName;
  String? _proPubStrFRollcd;
  String? _proPubStrFEmpcd;
  String? _proPubStrFLocation;
  String? _proPubStrFPosition;
  String? _proPubStrFDepartment;
  String? _proPubStrFSubDepartment;
  String? _proPubStrFDesgination;
  String? _proPubStrFGrade;
ProPubEmployeeReporting copyWith({  String? proPubStrAName,
  String? proPubStrARollcd,
  String? proPubStrAEmpcd,
  String? proPubStrALocation,
  String? proPubStrAPosition,
  String? proPubStrADepartment,
  String? proPubStrASubDepartment,
  String? proPubStrADesgination,
  String? proPubStrAGrade,
  String? proPubStrFName,
  String? proPubStrFRollcd,
  String? proPubStrFEmpcd,
  String? proPubStrFLocation,
  String? proPubStrFPosition,
  String? proPubStrFDepartment,
  String? proPubStrFSubDepartment,
  String? proPubStrFDesgination,
  String? proPubStrFGrade,
}) => ProPubEmployeeReporting(  proPubStrAName: proPubStrAName ?? _proPubStrAName,
  proPubStrARollcd: proPubStrARollcd ?? _proPubStrARollcd,
  proPubStrAEmpcd: proPubStrAEmpcd ?? _proPubStrAEmpcd,
  proPubStrALocation: proPubStrALocation ?? _proPubStrALocation,
  proPubStrAPosition: proPubStrAPosition ?? _proPubStrAPosition,
  proPubStrADepartment: proPubStrADepartment ?? _proPubStrADepartment,
  proPubStrASubDepartment: proPubStrASubDepartment ?? _proPubStrASubDepartment,
  proPubStrADesgination: proPubStrADesgination ?? _proPubStrADesgination,
  proPubStrAGrade: proPubStrAGrade ?? _proPubStrAGrade,
  proPubStrFName: proPubStrFName ?? _proPubStrFName,
  proPubStrFRollcd: proPubStrFRollcd ?? _proPubStrFRollcd,
  proPubStrFEmpcd: proPubStrFEmpcd ?? _proPubStrFEmpcd,
  proPubStrFLocation: proPubStrFLocation ?? _proPubStrFLocation,
  proPubStrFPosition: proPubStrFPosition ?? _proPubStrFPosition,
  proPubStrFDepartment: proPubStrFDepartment ?? _proPubStrFDepartment,
  proPubStrFSubDepartment: proPubStrFSubDepartment ?? _proPubStrFSubDepartment,
  proPubStrFDesgination: proPubStrFDesgination ?? _proPubStrFDesgination,
  proPubStrFGrade: proPubStrFGrade ?? _proPubStrFGrade,
);
  String? get proPubStrAName => _proPubStrAName;
  String? get proPubStrARollcd => _proPubStrARollcd;
  String? get proPubStrAEmpcd => _proPubStrAEmpcd;
  String? get proPubStrALocation => _proPubStrALocation;
  String? get proPubStrAPosition => _proPubStrAPosition;
  String? get proPubStrADepartment => _proPubStrADepartment;
  String? get proPubStrASubDepartment => _proPubStrASubDepartment;
  String? get proPubStrADesgination => _proPubStrADesgination;
  String? get proPubStrAGrade => _proPubStrAGrade;
  String? get proPubStrFName => _proPubStrFName;
  String? get proPubStrFRollcd => _proPubStrFRollcd;
  String? get proPubStrFEmpcd => _proPubStrFEmpcd;
  String? get proPubStrFLocation => _proPubStrFLocation;
  String? get proPubStrFPosition => _proPubStrFPosition;
  String? get proPubStrFDepartment => _proPubStrFDepartment;
  String? get proPubStrFSubDepartment => _proPubStrFSubDepartment;
  String? get proPubStrFDesgination => _proPubStrFDesgination;
  String? get proPubStrFGrade => _proPubStrFGrade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrAName'] = _proPubStrAName;
    map['ProPubStrARollcd'] = _proPubStrARollcd;
    map['ProPubStrAEmpcd'] = _proPubStrAEmpcd;
    map['ProPubStrALocation'] = _proPubStrALocation;
    map['ProPubStrAPosition'] = _proPubStrAPosition;
    map['ProPubStrADepartment'] = _proPubStrADepartment;
    map['ProPubStrASubDepartment'] = _proPubStrASubDepartment;
    map['ProPubStrADesgination'] = _proPubStrADesgination;
    map['ProPubStrAGrade'] = _proPubStrAGrade;
    map['ProPubStrFName'] = _proPubStrFName;
    map['ProPubStrFRollcd'] = _proPubStrFRollcd;
    map['ProPubStrFEmpcd'] = _proPubStrFEmpcd;
    map['ProPubStrFLocation'] = _proPubStrFLocation;
    map['ProPubStrFPosition'] = _proPubStrFPosition;
    map['ProPubStrFDepartment'] = _proPubStrFDepartment;
    map['ProPubStrFSubDepartment'] = _proPubStrFSubDepartment;
    map['ProPubStrFDesgination'] = _proPubStrFDesgination;
    map['ProPubStrFGrade'] = _proPubStrFGrade;
    return map;
  }

}

/// ProPubStrCompanyName : "Thalappakatti Hotels Pvt Ltd."
/// ProPubStrEmpcd : "D027673"
/// ProPubStrFullName : "Eswara Rao  Madugula"
/// ProPubStrConfdt : "01 Jan 1900"
/// ProPubStrGender : "Male"
/// ProPubStrBirthDt : "31 Aug 1985"
/// ProPubStrLocation : "BLR - Corporate"
/// ProPubStrCategory : "Corporate"
/// ProPubStrJoinDt : "16 Mar 2021"
/// ProPubStrStaffCategory : "--"
/// ProPubStrDepartment : "Human Resources"
/// ProPubStrSubdepartment : "--"
/// ProPubStrGrade : "DT 3"
/// ProPubStrMaritalStatus : "Single"
/// ProPubStrPresentStatus : "CONFIRMED"
/// ProPubStrMARRDATE : ""
/// ProPubStrDesignation : "Senior Manager HR"
/// ProPubStrPosition : "--"

class ProPubEmployeeDetails {
  ProPubEmployeeDetails({
      String? proPubStrCompanyName, 
      String? proPubStrEmpcd, 
      String? proPubStrFullName, 
      String? proPubStrConfdt, 
      String? proPubStrGender, 
      String? proPubStrBirthDt, 
      String? proPubStrLocation, 
      String? proPubStrCategory, 
      String? proPubStrJoinDt, 
      String? proPubStrStaffCategory, 
      String? proPubStrDepartment, 
      String? proPubStrSubdepartment, 
      String? proPubStrGrade, 
      String? proPubStrMaritalStatus, 
      String? proPubStrPresentStatus, 
      String? proPubStrMARRDATE, 
      String? proPubStrDesignation, 
      String? proPubStrPosition,}){
    _proPubStrCompanyName = proPubStrCompanyName;
    _proPubStrEmpcd = proPubStrEmpcd;
    _proPubStrFullName = proPubStrFullName;
    _proPubStrConfdt = proPubStrConfdt;
    _proPubStrGender = proPubStrGender;
    _proPubStrBirthDt = proPubStrBirthDt;
    _proPubStrLocation = proPubStrLocation;
    _proPubStrCategory = proPubStrCategory;
    _proPubStrJoinDt = proPubStrJoinDt;
    _proPubStrStaffCategory = proPubStrStaffCategory;
    _proPubStrDepartment = proPubStrDepartment;
    _proPubStrSubdepartment = proPubStrSubdepartment;
    _proPubStrGrade = proPubStrGrade;
    _proPubStrMaritalStatus = proPubStrMaritalStatus;
    _proPubStrPresentStatus = proPubStrPresentStatus;
    _proPubStrMARRDATE = proPubStrMARRDATE;
    _proPubStrDesignation = proPubStrDesignation;
    _proPubStrPosition = proPubStrPosition;
}

  ProPubEmployeeDetails.fromJson(dynamic json) {
    _proPubStrCompanyName = json['ProPubStrCompanyName'];
    _proPubStrEmpcd = json['ProPubStrEmpcd'];
    _proPubStrFullName = json['ProPubStrFullName'];
    _proPubStrConfdt = json['ProPubStrConfdt'];
    _proPubStrGender = json['ProPubStrGender'];
    _proPubStrBirthDt = json['ProPubStrBirthDt'];
    _proPubStrLocation = json['ProPubStrLocation'];
    _proPubStrCategory = json['ProPubStrCategory'];
    _proPubStrJoinDt = json['ProPubStrJoinDt'];
    _proPubStrStaffCategory = json['ProPubStrStaffCategory'];
    _proPubStrDepartment = json['ProPubStrDepartment'];
    _proPubStrSubdepartment = json['ProPubStrSubdepartment'];
    _proPubStrGrade = json['ProPubStrGrade'];
    _proPubStrMaritalStatus = json['ProPubStrMaritalStatus'];
    _proPubStrPresentStatus = json['ProPubStrPresentStatus'];
    _proPubStrMARRDATE = json['ProPubStrMARRDATE'];
    _proPubStrDesignation = json['ProPubStrDesignation'];
    _proPubStrPosition = json['ProPubStrPosition'];
  }
  String? _proPubStrCompanyName;
  String? _proPubStrEmpcd;
  String? _proPubStrFullName;
  String? _proPubStrConfdt;
  String? _proPubStrGender;
  String? _proPubStrBirthDt;
  String? _proPubStrLocation;
  String? _proPubStrCategory;
  String? _proPubStrJoinDt;
  String? _proPubStrStaffCategory;
  String? _proPubStrDepartment;
  String? _proPubStrSubdepartment;
  String? _proPubStrGrade;
  String? _proPubStrMaritalStatus;
  String? _proPubStrPresentStatus;
  String? _proPubStrMARRDATE;
  String? _proPubStrDesignation;
  String? _proPubStrPosition;
ProPubEmployeeDetails copyWith({  String? proPubStrCompanyName,
  String? proPubStrEmpcd,
  String? proPubStrFullName,
  String? proPubStrConfdt,
  String? proPubStrGender,
  String? proPubStrBirthDt,
  String? proPubStrLocation,
  String? proPubStrCategory,
  String? proPubStrJoinDt,
  String? proPubStrStaffCategory,
  String? proPubStrDepartment,
  String? proPubStrSubdepartment,
  String? proPubStrGrade,
  String? proPubStrMaritalStatus,
  String? proPubStrPresentStatus,
  String? proPubStrMARRDATE,
  String? proPubStrDesignation,
  String? proPubStrPosition,
}) => ProPubEmployeeDetails(  proPubStrCompanyName: proPubStrCompanyName ?? _proPubStrCompanyName,
  proPubStrEmpcd: proPubStrEmpcd ?? _proPubStrEmpcd,
  proPubStrFullName: proPubStrFullName ?? _proPubStrFullName,
  proPubStrConfdt: proPubStrConfdt ?? _proPubStrConfdt,
  proPubStrGender: proPubStrGender ?? _proPubStrGender,
  proPubStrBirthDt: proPubStrBirthDt ?? _proPubStrBirthDt,
  proPubStrLocation: proPubStrLocation ?? _proPubStrLocation,
  proPubStrCategory: proPubStrCategory ?? _proPubStrCategory,
  proPubStrJoinDt: proPubStrJoinDt ?? _proPubStrJoinDt,
  proPubStrStaffCategory: proPubStrStaffCategory ?? _proPubStrStaffCategory,
  proPubStrDepartment: proPubStrDepartment ?? _proPubStrDepartment,
  proPubStrSubdepartment: proPubStrSubdepartment ?? _proPubStrSubdepartment,
  proPubStrGrade: proPubStrGrade ?? _proPubStrGrade,
  proPubStrMaritalStatus: proPubStrMaritalStatus ?? _proPubStrMaritalStatus,
  proPubStrPresentStatus: proPubStrPresentStatus ?? _proPubStrPresentStatus,
  proPubStrMARRDATE: proPubStrMARRDATE ?? _proPubStrMARRDATE,
  proPubStrDesignation: proPubStrDesignation ?? _proPubStrDesignation,
  proPubStrPosition: proPubStrPosition ?? _proPubStrPosition,
);
  String? get proPubStrCompanyName => _proPubStrCompanyName;
  String? get proPubStrEmpcd => _proPubStrEmpcd;
  String? get proPubStrFullName => _proPubStrFullName;
  String? get proPubStrConfdt => _proPubStrConfdt;
  String? get proPubStrGender => _proPubStrGender;
  String? get proPubStrBirthDt => _proPubStrBirthDt;
  String? get proPubStrLocation => _proPubStrLocation;
  String? get proPubStrCategory => _proPubStrCategory;
  String? get proPubStrJoinDt => _proPubStrJoinDt;
  String? get proPubStrStaffCategory => _proPubStrStaffCategory;
  String? get proPubStrDepartment => _proPubStrDepartment;
  String? get proPubStrSubdepartment => _proPubStrSubdepartment;
  String? get proPubStrGrade => _proPubStrGrade;
  String? get proPubStrMaritalStatus => _proPubStrMaritalStatus;
  String? get proPubStrPresentStatus => _proPubStrPresentStatus;
  String? get proPubStrMARRDATE => _proPubStrMARRDATE;
  String? get proPubStrDesignation => _proPubStrDesignation;
  String? get proPubStrPosition => _proPubStrPosition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrCompanyName'] = _proPubStrCompanyName;
    map['ProPubStrEmpcd'] = _proPubStrEmpcd;
    map['ProPubStrFullName'] = _proPubStrFullName;
    map['ProPubStrConfdt'] = _proPubStrConfdt;
    map['ProPubStrGender'] = _proPubStrGender;
    map['ProPubStrBirthDt'] = _proPubStrBirthDt;
    map['ProPubStrLocation'] = _proPubStrLocation;
    map['ProPubStrCategory'] = _proPubStrCategory;
    map['ProPubStrJoinDt'] = _proPubStrJoinDt;
    map['ProPubStrStaffCategory'] = _proPubStrStaffCategory;
    map['ProPubStrDepartment'] = _proPubStrDepartment;
    map['ProPubStrSubdepartment'] = _proPubStrSubdepartment;
    map['ProPubStrGrade'] = _proPubStrGrade;
    map['ProPubStrMaritalStatus'] = _proPubStrMaritalStatus;
    map['ProPubStrPresentStatus'] = _proPubStrPresentStatus;
    map['ProPubStrMARRDATE'] = _proPubStrMARRDATE;
    map['ProPubStrDesignation'] = _proPubStrDesignation;
    map['ProPubStrPosition'] = _proPubStrPosition;
    return map;
  }

}