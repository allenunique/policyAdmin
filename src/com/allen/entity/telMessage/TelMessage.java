package com.allen.entity.telMessage;

/**
 * Created by ad on 2017-02-22.
 */
public class TelMessage {
      private int telMessageId;
      private String telNum;
      private int countAll;
      private String allTime;
      private int countOutAll;
      private String outAllTime;
      private int count_1out;
      private String _1outTime;
      private int count$1out;
      private String $1outTime;
      private int count$3out;
      private String $3outTime;
      private int countInAll;
      private String inAllTime;
      private int count_1in;
      private String _1inTime;
      private int count$1in;
      private String $1inTime;
      private int count$3in;
      private String $3inTime;
      private String date;
      private Person person;
    public int getTelMessageId() {
        return telMessageId;
    }

    public void setTelMessageId(int telMessageId) {
        this.telMessageId = telMessageId;
    }

    public String getTelNum() {
        return telNum;
    }

    public void setTelNum(String telNum) {
        this.telNum = telNum;
    }

    public int getCountAll() {
        return countAll;
    }

    public void setCountAll(int countAll) {
        this.countAll = countAll;
    }

    public String getAllTime() {
        return allTime;
    }

    public void setAllTime(String allTime) {
        this.allTime = allTime;
    }

    public int getCountOutAll() {
        return countOutAll;
    }

    public void setCountOutAll(int countOutAll) {
        this.countOutAll = countOutAll;
    }

    public String getOutAllTime() {
        return outAllTime;
    }

    public void setOutAllTime(String outAllTime) {
        this.outAllTime = outAllTime;
    }

    public int getCount_1out() {
        return count_1out;
    }

    public void setCount_1out(int count_1out) {
        this.count_1out = count_1out;
    }

    public String get_1outTime() {
        return _1outTime;
    }

    public void set_1outTime(String _1outTime) {
        this._1outTime = _1outTime;
    }

    public int getCount$1out() {
        return count$1out;
    }

    public void setCount$1out(int count$1out) {
        this.count$1out = count$1out;
    }

    public String get$1outTime() {
        return $1outTime;
    }

    public void set$1outTime(String $1outTime) {
        this.$1outTime = $1outTime;
    }

    public int getCount$3out() {
        return count$3out;
    }

    public void setCount$3out(int count$3out) {
        this.count$3out = count$3out;
    }

    public String get$3outTime() {
        return $3outTime;
    }

    public void set$3outTime(String $3outTime) {
        this.$3outTime = $3outTime;
    }

    public int getCountInAll() {
        return countInAll;
    }

    public void setCountInAll(int countInAll) {
        this.countInAll = countInAll;
    }

    public String getInAllTime() {
        return inAllTime;
    }

    public void setInAllTime(String inAllTime) {
        this.inAllTime = inAllTime;
    }

    public int getCount_1in() {
        return count_1in;
    }

    public void setCount_1in(int count_1in) {
        this.count_1in = count_1in;
    }

    public String get_1inTime() {
        return _1inTime;
    }

    public void set_1inTime(String _1inTime) {
        this._1inTime = _1inTime;
    }

    public int getCount$1in() {
        return count$1in;
    }

    public void setCount$1in(int count$1in) {
        this.count$1in = count$1in;
    }

    public String get$1inTime() {
        return $1inTime;
    }

    public void set$1inTime(String $1inTime) {
        this.$1inTime = $1inTime;
    }

    public int getCount$3in() {
        return count$3in;
    }

    public void setCount$3in(int count$3in) {
        this.count$3in = count$3in;
    }

    public String get$3inTime() {
        return $3inTime;
    }

    public void set$3inTime(String $3inTime) {
        this.$3inTime = $3inTime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    @Override
    public String toString() {
        return "TelMessage{" +
                "telMessageId=" + telMessageId +
                ", telNum=" + telNum +
                ", countAll=" + countAll +
                ", allTime='" + allTime + '\'' +
                ", countOutAll=" + countOutAll +
                ", outAllTime='" + outAllTime + '\'' +
                ", count_1out=" + count_1out +
                ", _1outTime='" + _1outTime + '\'' +
                ", count$1out=" + count$1out +
                ", $1outTime='" + $1outTime + '\'' +
                ", count$3out=" + count$3out +
                ", $3outTime='" + $3outTime + '\'' +
                ", countInAll=" + countInAll +
                ", inAllTime='" + inAllTime + '\'' +
                ", count_1in=" + count_1in +
                ", _1inTime='" + _1inTime + '\'' +
                ", count$1in=" + count$1in +
                ", $1inTime='" + $1inTime + '\'' +
                ", count$3in=" + count$3in +
                ", $3inTime='" + $3inTime + '\'' +
                ", Date='" + date + '\'' +
                ", person=" + person +
                '}';
    }
}
