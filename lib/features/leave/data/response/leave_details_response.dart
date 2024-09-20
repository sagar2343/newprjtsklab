/// ProPubStrLeaveDesc : "Earned Leave"
/// ProPubStrLeaveSDesc : "EL"
/// ProPubStrOpenBal : "0.000"
/// ProPubStrEarnInYr : "19.500"
/// ProPubStrCreaditedInYr : "1.500"
/// ProPubStrAdusted : "0.000"
/// ProPubStrEncashed : "0.000"
/// ProPubStrElapsed : "0.000"
/// ProPubStrAvailableBalance : "21.000"
/// ProPubStrTknInYr : "0.000"

class LeaveDetails {
  LeaveDetails({
      String? proPubStrLeaveDesc, 
      String? proPubStrLeaveSDesc, 
      String? proPubStrOpenBal, 
      String? proPubStrEarnInYr, 
      String? proPubStrCreaditedInYr, 
      String? proPubStrAdusted, 
      String? proPubStrEncashed, 
      String? proPubStrElapsed, 
      String? proPubStrAvailableBalance, 
      String? proPubStrTknInYr,}){
    _proPubStrLeaveDesc = proPubStrLeaveDesc;
    _proPubStrLeaveSDesc = proPubStrLeaveSDesc;
    _proPubStrOpenBal = proPubStrOpenBal;
    _proPubStrEarnInYr = proPubStrEarnInYr;
    _proPubStrCreaditedInYr = proPubStrCreaditedInYr;
    _proPubStrAdusted = proPubStrAdusted;
    _proPubStrEncashed = proPubStrEncashed;
    _proPubStrElapsed = proPubStrElapsed;
    _proPubStrAvailableBalance = proPubStrAvailableBalance;
    _proPubStrTknInYr = proPubStrTknInYr;
}

  LeaveDetails.fromJson(dynamic json) {
    _proPubStrLeaveDesc = json['ProPubStrLeaveDesc'];
    _proPubStrLeaveSDesc = json['ProPubStrLeaveSDesc'];
    _proPubStrOpenBal = json['ProPubStrOpenBal'];
    _proPubStrEarnInYr = json['ProPubStrEarnInYr'];
    _proPubStrCreaditedInYr = json['ProPubStrCreaditedInYr'];
    _proPubStrAdusted = json['ProPubStrAdusted'];
    _proPubStrEncashed = json['ProPubStrEncashed'];
    _proPubStrElapsed = json['ProPubStrElapsed'];
    _proPubStrAvailableBalance = json['ProPubStrAvailableBalance'];
    _proPubStrTknInYr = json['ProPubStrTknInYr'];
  }
  String? _proPubStrLeaveDesc;
  String? _proPubStrLeaveSDesc;
  String? _proPubStrOpenBal;
  String? _proPubStrEarnInYr;
  String? _proPubStrCreaditedInYr;
  String? _proPubStrAdusted;
  String? _proPubStrEncashed;
  String? _proPubStrElapsed;
  String? _proPubStrAvailableBalance;
  String? _proPubStrTknInYr;
LeaveDetails copyWith({  String? proPubStrLeaveDesc,
  String? proPubStrLeaveSDesc,
  String? proPubStrOpenBal,
  String? proPubStrEarnInYr,
  String? proPubStrCreaditedInYr,
  String? proPubStrAdusted,
  String? proPubStrEncashed,
  String? proPubStrElapsed,
  String? proPubStrAvailableBalance,
  String? proPubStrTknInYr,
}) => LeaveDetails(  proPubStrLeaveDesc: proPubStrLeaveDesc ?? _proPubStrLeaveDesc,
  proPubStrLeaveSDesc: proPubStrLeaveSDesc ?? _proPubStrLeaveSDesc,
  proPubStrOpenBal: proPubStrOpenBal ?? _proPubStrOpenBal,
  proPubStrEarnInYr: proPubStrEarnInYr ?? _proPubStrEarnInYr,
  proPubStrCreaditedInYr: proPubStrCreaditedInYr ?? _proPubStrCreaditedInYr,
  proPubStrAdusted: proPubStrAdusted ?? _proPubStrAdusted,
  proPubStrEncashed: proPubStrEncashed ?? _proPubStrEncashed,
  proPubStrElapsed: proPubStrElapsed ?? _proPubStrElapsed,
  proPubStrAvailableBalance: proPubStrAvailableBalance ?? _proPubStrAvailableBalance,
  proPubStrTknInYr: proPubStrTknInYr ?? _proPubStrTknInYr,
);
  String? get proPubStrLeaveDesc => _proPubStrLeaveDesc;
  String? get proPubStrLeaveSDesc => _proPubStrLeaveSDesc;
  String? get proPubStrOpenBal => _proPubStrOpenBal;
  String? get proPubStrEarnInYr => _proPubStrEarnInYr;
  String? get proPubStrCreaditedInYr => _proPubStrCreaditedInYr;
  String? get proPubStrAdusted => _proPubStrAdusted;
  String? get proPubStrEncashed => _proPubStrEncashed;
  String? get proPubStrElapsed => _proPubStrElapsed;
  String? get proPubStrAvailableBalance => _proPubStrAvailableBalance;
  String? get proPubStrTknInYr => _proPubStrTknInYr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProPubStrLeaveDesc'] = _proPubStrLeaveDesc;
    map['ProPubStrLeaveSDesc'] = _proPubStrLeaveSDesc;
    map['ProPubStrOpenBal'] = _proPubStrOpenBal;
    map['ProPubStrEarnInYr'] = _proPubStrEarnInYr;
    map['ProPubStrCreaditedInYr'] = _proPubStrCreaditedInYr;
    map['ProPubStrAdusted'] = _proPubStrAdusted;
    map['ProPubStrEncashed'] = _proPubStrEncashed;
    map['ProPubStrElapsed'] = _proPubStrElapsed;
    map['ProPubStrAvailableBalance'] = _proPubStrAvailableBalance;
    map['ProPubStrTknInYr'] = _proPubStrTknInYr;
    return map;
  }

}