class Data {
  final int? iD;
  final String? security;
  final int? industryID;
  final String? industry;
  final int? sectorID;
  final String? sector;
  final double? mCAP;
  final dynamic eV;
  final dynamic eVDateEnd;
  final double? bookNavPerShare;
  final double? tTMPE;
  final int? tTMYearEnd;
  final double? ield;
  final int? yearEnd;
  final String? sectorSlug;
  final String? industrySlug;
  final String? securitySlug;
  final double? pEGRatio;

  Data({
    this.iD,
    this.security,
    this.industryID,
    this.industry,
    this.sectorID,
    this.sector,
    this.mCAP,
    this.eV,
    this.eVDateEnd,
    this.bookNavPerShare,
    this.tTMPE,
    this.tTMYearEnd,
    this.ield,
    this.yearEnd,
    this.sectorSlug,
    this.industrySlug,
    this.securitySlug,
    this.pEGRatio,
  });

  Data.fromJson(Map<String, dynamic> json)
      : iD = json['ID'] as int?,
        security = json['Security'] as String?,
        industryID = json['IndustryID'] as int?,
        industry = json['Industry'] as String?,
        sectorID = json['SectorID'] as int?,
        sector = json['Sector'] as String?,
        mCAP = json['MCAP'] as double?,
        eV = json['EV'],
        eVDateEnd = json['EVDateEnd'],
        bookNavPerShare = json['BookNavPerShare'] as double?,
        tTMPE = json['TTMPE'] as double?,
        tTMYearEnd = json['TTMYearEnd'] as int?,
        ield = json['Yield'] as double?,
        yearEnd = json['YearEnd'] as int?,
        sectorSlug = json['SectorSlug'] as String?,
        industrySlug = json['IndustrySlug'] as String?,
        securitySlug = json['SecuritySlug'] as String?,
        pEGRatio = json['PEGRatio'] as double?;

  Map<String, dynamic> toJson() => {
        'ID': iD,
        'Security': security,
        'IndustryID': industryID,
        'Industry': industry,
        'SectorID': sectorID,
        'Sector': sector,
        'MCAP': mCAP,
        'EV': eV,
        'EVDateEnd': eVDateEnd,
        'BookNavPerShare': bookNavPerShare,
        'TTMPE': tTMPE,
        'TTMYearEnd': tTMYearEnd,
        'Yield': ield,
        'YearEnd': yearEnd,
        'SectorSlug': sectorSlug,
        'IndustrySlug': industrySlug,
        'SecuritySlug': securitySlug,
        'PEGRatio': pEGRatio
      };
}
