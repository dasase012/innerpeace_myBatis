package member2;

public class ApptDataBean {
	private int num;
	private String id;
	private String boardid;
	private String tel2;
	private String con_past;
	private String con_cat;
	private String doc;
	private String appt_date1;
	private String appt_date2;
	private String medication;
	private String med_name;
	private String text;
		
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getCon_past() {
		return con_past;
	}
	public void setCon_past(String con_past) {
		this.con_past = con_past;
	}
	public String getCon_cat() {
		return con_cat;
	}
	public void setCon_cat(String con_cat) {
		this.con_cat = con_cat;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getAppt_date1() {
		return appt_date1;
	}
	public void setAppt_date1(String appt_date1) {
		this.appt_date1 = appt_date1;
	}
	public String getAppt_date2() {
		return appt_date2;
	}
	public void setAppt_date2(String appt_date2) {
		this.appt_date2 = appt_date2;
	}
	public String getMedication() {
		return medication;
	}
	public void setMedication(String medication) {
		this.medication = medication;
	}
	public String getMed_name() {
		return med_name;
	}
	public void setMed_name(String med_name) {
		this.med_name = med_name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "ApptDataBean [num=" + num + ", id=" + id + ", boardid=" + boardid + ", tel2=" + tel2 + ", con_past="
				+ con_past + ", con_cat=" + con_cat + ", doc=" + doc + ", appt_date1=" + appt_date1 + ", appt_date2="
				+ appt_date2 + ", medication=" + medication + ", med_name=" + med_name + ", text=" + text + "]";
	}
	

}
