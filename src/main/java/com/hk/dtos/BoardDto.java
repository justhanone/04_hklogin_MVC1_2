package com.hk.dtos;

import java.io.Serializable;
import java.util.Date;

public class BoardDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private int Tseq;
	private String Tid;
	private String Ttitle;
	private String Tcontent;
	private Date Tregdate;
	private String delflag;
	
	public BoardDto() {
		
	}

	public BoardDto(int tseq, String tid, String ttitle, String tcontent, Date tregdate, String delflag) {
		super();
		this.Tseq = tseq;
		this.Tid = tid;
		this.Ttitle = ttitle;
		this.Tcontent = tcontent;
		this.Tregdate = tregdate;
		this.delflag = delflag;
	}
	
	//TSEQ, TID, TTITLE, TCONTENT, TREGDATE
	public BoardDto(int tseq, String tid, String ttitle, String tcontent, Date tregdate) {
		super();
		this.Tseq = tseq;
		this.Tid = tid;
		this.Ttitle = ttitle;
		this.Tcontent = tcontent;
		this.Tregdate = tregdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public int getTseq() {
		return Tseq;
	}

	public void setTseq(int tseq) {
		Tseq = tseq;
	}

	public String getTid() {
		return Tid;
	}

	public void setTid(String tid) {
		Tid = tid;
	}

	public String getTtitle() {
		return Ttitle;
	}

	public void setTtitle(String ttitle) {
		Ttitle = ttitle;
	}

	public String getTcontent() {
		return Tcontent;
	}

	public void setTcontent(String tcontent) {
		Tcontent = tcontent;
	}

	public Date getTregdate() {
		return Tregdate;
	}

	public void setTregdate(Date tregdate) {
		Tregdate = tregdate;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	@Override
	public String toString() {
		return "BoardDto [Tseq=" + Tseq + ", Tid=" + Tid + ", Ttitle=" + Ttitle + ", Tcontent=" + Tcontent
				+ ", Tregdate=" + Tregdate + ", delflag=" + delflag + "]";
	}
	
	

}
