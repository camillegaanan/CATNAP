

class ComputeSleepingTime {

  String _hourFinal = '';
  String _minFinal = '';
  String _ampm = '';
  List<String> _time = [];

  void computeSleepingTime(int hour, int min) {
    int actualMin = (hour*60)+min;
    int convertedMin = 0;
    int computedHr = 0;
    int computedMin = 0;
    for (int i = 0; i < 6; i++) {
      actualMin = actualMin - 90;
      if (actualMin < 0) {
        convertedMin = actualMin + 720;
        computedHr = convertedMin % 60;
        computedMin = convertedMin - (computedHr*60);
        actualMin = ((computedHr+12)*60) + computedMin;
      }
      int finalMin = (actualMin-15)%60;
      double finalHr = (actualMin - finalMin) / 60;
      int finalHour = finalHr.toInt();
      if (finalHour > 12) {
        _ampm = 'PM';
        _hourFinal = (finalHour - 12).toString();
      } else if(finalHour == 0) {
        _hourFinal = (finalHour+12).toString();
        _ampm = 'AM';
      }else {
        _hourFinal = finalHour.toString();
        _ampm= 'AM';
      }
      if (finalMin < 10) {
        _minFinal = finalMin.toString();
        _minFinal = '0$_minFinal';
      } else {
        _minFinal = finalMin.toString();
      }
      String word = '$_hourFinal $_minFinal $_ampm';
      _time.add(word);
    }
    print(_time[_time.length-1]);
    print('time to sleep hour $_hourFinal');
    print('time to sleep min $_minFinal');
    print(_ampm);
  }

  String getTime(int count) {
    return _time[_time.length-count];
  }


}