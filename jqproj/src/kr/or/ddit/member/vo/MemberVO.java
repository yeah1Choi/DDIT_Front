package kr.or.ddit.member.vo;

public class MemberVO {
	private String MEM_ID   ;
	private String MEM_PASS ;
	private String MEM_NAME ;
	private String MEM_BIR  ;
	private String MEM_ZIP  ;
	private String MEM_ADD1 ;
	private String MEM_ADD2 ;
	private String MEM_HP   ;
	private String MEM_MAIL ;
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public String getMEM_PASS() {
		return MEM_PASS;
	}
	public void setMEM_PASS(String mEM_PASS) {
		MEM_PASS = mEM_PASS;
	}
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String mEM_NAME) {
		MEM_NAME = mEM_NAME;
	}
	public String getMEM_BIR() {
		return MEM_BIR;
	}
	public void setMEM_BIR(String mEM_BIR) {
		MEM_BIR = mEM_BIR;
	}
	public String getMEM_ZIP() {
		return MEM_ZIP;
	}
	public void setMEM_ZIP(String mEM_ZIP) {
		MEM_ZIP = mEM_ZIP;
	}
	public String getMEM_ADD1() {
		return MEM_ADD1;
	}
	public void setMEM_ADD1(String mEM_ADD1) {
		MEM_ADD1 = mEM_ADD1;
	}
	public String getMEM_ADD2() {
		return MEM_ADD2;
	}
	public void setMEM_ADD2(String mEM_ADD2) {
		MEM_ADD2 = mEM_ADD2;
	}
	public String getMEM_HP() {
		return MEM_HP;
	}
	public void setMEM_HP(String mEM_HP) {
		MEM_HP = mEM_HP;
	}
	public String getMEM_MAIL() {
		return MEM_MAIL;
	}
	public void setMEM_MAIL(String mEM_MAIL) {
		MEM_MAIL = mEM_MAIL;
	}
	
	@Override
	public String toString() {
		return "MemberVO [MEM_ID=" + MEM_ID + ", MEM_PASS=" + MEM_PASS + ", MEM_NAME=" + MEM_NAME + ", MEM_BIR="
				+ MEM_BIR + ", MEM_ZIP=" + MEM_ZIP + ", MEM_ADD1=" + MEM_ADD1 + ", MEM_ADD2=" + MEM_ADD2 + ", MEM_HP="
				+ MEM_HP + ", MEM_MAIL=" + MEM_MAIL + "]";
	}
}
