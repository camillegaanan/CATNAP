class ComputeWakingTime {
  List<String> _time = [];

  void computeWakingTime(int hour, int min) {

    int startHrs = (hour + 5) % 24;
    int startMin = (min + 45) % 60;

    int tempHrs = startHrs;
    int tempMin = startMin;

    String ampm = "";
    String strHrs = "";
    String strMin = "";

    for (int i = 1; i <= 4; i++) {
      strHrs = tempHrs.toString();
      if(tempHrs < 10) {
        strHrs = '0$strHrs';
      }
      if(tempHrs == 0) {
        strHrs = '12';
      }
      strMin = tempMin.toString();
      if(tempMin < 10) {
        strMin = '0$strMin';
      }
      if(tempHrs > 12) {
        strHrs = (tempHrs-12).toString();
        ampm = 'PM';
      } else if (tempHrs == 0) {
        strHrs = (tempHrs+12).toString();
        ampm = 'AM';
      }
      else {
        ampm = 'AM';
      }

      String word = '$strHrs $strMin $ampm';
      _time.add(word);

      print('$word');
      tempHrs = (tempHrs + 1) % 24;
      if (tempMin + 30 >= 60) {
        tempHrs = (tempHrs + 1) % 24;
      }
      tempMin = (tempMin + 30) % 60;
    }
  }

  String getTime(int count) {
    return _time[_time.length-count];
  }

}