package member;

public class MemberBean {
    private String email;            // 이메일
    private String email1;          //이메일 아이디 부분
    private String email2;          //이메일 도메인 부분
    private String password;     // 비밀번호
    private String name;        // 이름
    private int gender;        // 성별
    private String phone;        // 전화
    private int age;            //나이
    private String profession; //직업
    private int numOfFamily; //가족 수
    private String housing;     //주거 형태
    private String preparedEnviro; //준비된 환경
    private int pastExperience;    //과거 애완동물을 키웠던 경험 횟수

    public String getEmail() {
        if (email == null) {
            email = email1 + "@" + email2;
        }
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public int getNumOfFamily() {
        return numOfFamily;
    }

    public void setNumOfFamily(int numOfFamily) {
        this.numOfFamily = numOfFamily;
    }

    public String getHousing() {
        return housing;
    }

    public void setHousing(String housing) {
        this.housing = housing;
    }

    public String getPreparedEnviro() {
        return preparedEnviro;
    }

    public void setPreparedEnviro(String preparedEnviro) {
        this.preparedEnviro = preparedEnviro;
    }

    public int getPastExperience() {
        return pastExperience;
    }

    public void setPastExperience(int pastExperience) {
        this.pastExperience = pastExperience;
    }
}
