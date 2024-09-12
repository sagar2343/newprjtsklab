import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../data/company_code_source.dart';

class CompanyCodeController {

  final GetCompanyCodeData _getCompanyCodeData = GetCompanyCodeData();
  Timer? _debounce;

  Future<String> fetchCompanyName(String companyCode) async{
    final companyCodeResponse = await _getCompanyCodeData.getCompanyCode(companyCode);
    if (companyCodeResponse != null && companyCodeResponse.isNotEmpty) {
      return companyCodeResponse.first.proPubStrClientDesc;
    } else{
      return "Company not found";
    }
  }

  void onCompanyCodeChanged(TextEditingController companyCodeController, Function(String?) onFetchSuccess) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 1), () async {
      if (companyCodeController.text.isNotEmpty){
        final companyName = await fetchCompanyName(companyCodeController.text);
        onFetchSuccess(companyName);
      }
    });
  }

  void dispose() {
    _debounce?.cancel();
  }
}
