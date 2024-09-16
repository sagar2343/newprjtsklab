class HomeGridModule {
  final String moduleName;
  final String isActive;

  HomeGridModule({
    required this.moduleName,
    required this.isActive,
  });

  factory HomeGridModule.fromJson(Map<String, dynamic> json) {
    return HomeGridModule(
      moduleName: json['ProPubStrModuleName'] as String,
      isActive: json['ProPubStrIsActive'] as String,
    );
  }
}

class HomeGridModuleResponse {
  final List<HomeGridModule> modules;

  HomeGridModuleResponse({required this.modules});

  factory HomeGridModuleResponse.fromJson(Map<String, dynamic> json) {
    var moduleList = json['ProPubModule'] as List;
    List<HomeGridModule> modules =
    moduleList.map((module) => HomeGridModule.fromJson(module)).toList();
    return HomeGridModuleResponse(modules: modules);
  }
}
