package member2;

import java.util.Date;

public class JoinDataBean {

	private String id;
	private String name;
	private String pwd;
	private String gender;
	private String birthdate;
	private String tel;
	private String email;
	private String con_past;
	private String con_date;
	private String con_cat;
	private String position;
	private Date regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCon_past() {
		return con_past;
	}
	public void setCon_past(String con_past) {
		this.con_past = con_past;
	}
	public String getCon_date() {
		return con_date;
	}
	public void setCon_date(String con_date) {
		this.con_date = con_date;
	}
	public String getCon_cat() {
		return con_cat;
	}
	public void setCon_cat(String con_cat) {
		this.con_cat = con_cat;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public boolean matchPassword(String pwd) {
		return pwd.equals(pwd);
	}
	
	public void changePassword(String newPwd) {
		this.pwd=newPwd;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", pwd=" + pwd + ", gender=" + gender + ", birthdate="
				+ birthdate + ", tel=" + tel + ", email=" + email + ", con_past=" + con_past + ", con_date=" + con_date
				+ ", con_cat=" + con_cat + ", position=" + position + ", regdate=" + regdate + "]";
	}
	
}
