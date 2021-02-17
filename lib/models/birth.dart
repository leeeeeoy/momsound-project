class Birth {
  String _year;
  String _month;
  String _day;

  Birth(this._year, this._month, this._day);

  String get year => _year;
  String get month => _month;
  String get day => _day;

  void setBirth(String year, String month, String day) {
    _year = year;
    _month = month;
    _day = day;
  }
}
