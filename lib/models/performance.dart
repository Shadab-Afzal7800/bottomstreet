class Performance {
  final List<Element>? element;

  Performance({
    this.element,
  });

  Performance.fromJson(Map<String, dynamic> json)
    : element = (json['element'] as List?)?.map((dynamic e) => Element.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'element' : element?.map((e) => e.toJson()).toList()
  };
}

class Element {
  final int? iD;
  final String? label;
  final String? chartPeriodCode;
  final double? changePercent;

  Element({
    this.iD,
    this.label,
    this.chartPeriodCode,
    this.changePercent,
  });

  Element.fromJson(Map<String, dynamic> json)
    : iD = json['ID'] as int?,
      label = json['Label'] as String?,
      chartPeriodCode = json['ChartPeriodCode'] as String?,
      changePercent = json['ChangePercent'] as double?;

  Map<String, dynamic> toJson() => {
    'ID' : iD,
    'Label' : label,
    'ChartPeriodCode' : chartPeriodCode,
    'ChangePercent' : changePercent
  };
}