package com.allen.entity.tousu;

/**
 * Created by ad on 2017-02-07.
 * Order的第二部分
 */
public class OrderMessage2 {
    private int timeLimit;					//`timeLimit` int(11) DEFAULT NULL,		部门回复时限
    private int timeAll;
    private String chuliren;			    //`chuliren` varchar(255) DEFAULT NULL, 处理人
    private String result;			    	//`result` varchar(255) DEFAULT NULL,	事件结果

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }

    public int getTimeAll() {
        return timeAll;
    }

    public void setTimeAll(int timeAll) {
        this.timeAll = timeAll;
    }

    public String getChuliren() {
        return chuliren;
    }

    public void setChuliren(String chuliren) {
        this.chuliren = chuliren;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
