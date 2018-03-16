package garbage;

public class HospitalDataBean {
	private int num;
	private String local;
	private String hos_name;
	private String address;
	private String tel;
	private String hp;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getHos_name() {
		return hos_name;
	}
	public void setHos_name(String hos_name) {
		this.hos_name = hos_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	@Override
	public String toString() {
		return "HospitalDataBean [num=" + num + ", local=" + local + ", hos_name=" + hos_name + ", address=" + address
				+ ", tel=" + tel + ", hp=" + hp + "]";
	}
	
	
}
