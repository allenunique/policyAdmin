package com.allen.entity.tousu;

/**
 * Created by ad on 2017-02-07.
 * Order的第三部分
 */
public class OrderMessage3 {
    private String confirm;		           //  投诉回访确认
    private String isclose;		           //  问题是否关闭
    private String realReason1;			   //  实际投诉原因的一级分类
    private String realReason2;			   //  实际投诉原因的二级分类
    private String judge;			       //  有理判定
    private String _level;			       //  有理级别
    private String isrepeat;			       //  是否重复
    private String aBP;			 	       //  是否为总部回访
    private String recordPerson;	       //  记录人

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getIsclose() {
        return isclose;
    }

    public void setIsclose(String isclose) {
        this.isclose = isclose;
    }

    public String getRealReason1() {
        return realReason1;
    }

    public void setRealReason1(String realReason1) {
        this.realReason1 = realReason1;
    }

    public String getRealReason2() {
        return realReason2;
    }

    public void setRealReason2(String realReason2) {
        this.realReason2 = realReason2;
    }

    public String getJudge() {
        return judge;
    }

    public void setJudge(String judge) {
        this.judge = judge;
    }

    public String get_level() {
        return _level;
    }

    public void set_level(String _level) {
        this._level = _level;
    }

    public String getIsrepeat() {
        return isrepeat;
    }

    public void setIsrepeat(String isrepeat) {
        this.isrepeat = isrepeat;
    }

    public String getaBP() {
        return aBP;
    }

    public void setaBP(String aBP) {
        this.aBP = aBP;
    }

    public String getRecordPerson() {
        return recordPerson;
    }

    public void setRecordPerson(String recordPerson) {
        this.recordPerson = recordPerson;
    }
}
