package member;

public class MemberBean {
    private String email;            // 이메일
    private String password;     // 비밀번호
    private String name;        // 이름
    private int gender;        // 성별
    private String phone;        // 전화

    public String getEmail(){return email;}
    public void setEmail(String email){this.email=email;}

    public String getPassword(){return password;}
    public void setPassword(String password){this.password=password;}

    public String getName(){return name;}
    public void setName(String name){this.name=name;}

    public String getGenderString()
    {
        if(gender == 1)
            return "남성";
        else if(gender == 2)
            return "여성";
        else
            return "잘못입력햇는데에에ㅔ?";
    }
    public int getGender(){return gender;}
    public void setGender(int gender){this.gender=gender;}

    public String getPhone(){return phone;}
    public void setPhone(String phone){this.phone=phone;}

}
