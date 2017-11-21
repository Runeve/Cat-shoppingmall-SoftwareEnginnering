package member;

import database.DBConnection;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/* Data Access Object
 * 테이블 당 한개의 DAO를 작성한다.
 *
 * JSP_MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */
public class MemberDAO {
    private static MemberDAO instance;

    // 싱글톤 패턴
    private MemberDAO() {
    }

    public static MemberDAO getInstance() {
        if (instance == null)
            instance = new MemberDAO();
        return instance;
    }

    // 회원정보를 user 테이블에 저장하는 메서드
    public void insertMember(MemberBean member) throws SQLException, ClassNotFoundException, NamingException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        // 커넥션을 가져온다.
        conn = DBConnection.getConnection();

        // 자동 커밋을 false로 한다.
        conn.setAutoCommit(false);

        // 쿼리 생성한다.
        // 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
        StringBuffer sql = new StringBuffer();
        sql.append("insert into gomyammi.user (email,password,username,gender,phonenumber) value ");

        sql.append("(?, ?, ?, ?, ?);");
        /*
         * StringBuffer에 담긴 값을 얻으려면 toString()메서드를
         * 이용해야 한다.
         */
        pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, member.getEmail());
        pstmt.setString(2, member.getPassword());
        pstmt.setString(3, member.getName());
        pstmt.setInt(4, member.getGender());
        pstmt.setString(5, member.getPhone());
        // 쿼리 실행
        pstmt.executeUpdate();
        // 완료시 커밋
        conn.commit();
    } // end insertMember()


    // 로그인시 아이디, 비밀번호 체크 메서드
    // 아이디, 비밀번호를 인자로 받는다.
    public int loginCheck(String email, String pw) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;

        StringBuffer sql = new StringBuffer();
        sql.append("SELECT password FROM gomyammi.user WHERE email=?");

        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();

        if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
        {
            dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
            if (dbPW.equals(pw))
                x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
            else
                x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
        } else {
            x = -1; // 해당 아이디가 없을 경우
        }
        return x;
    } // end loginCheck()


    //이메일을 받아 이미 존재하는 계정인지 확인한다.
    public int joinCheck(String email) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x = -1;

        conn = DBConnection.getConnection();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT * FROM gomyammi.user WHERE email=?");

        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();
        if (rs.next()) // 입려된 이메일에 해당하는 계정이 있을경우
        {
            x = 0;
        } else {
            x = 1; // 해당 계정가 없을 경우
        }
        return x;
    }

    //이메일로 회원 이름을 알아낸다.
    public String getName(String email) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String name = "";

        StringBuffer sql = new StringBuffer();
        sql.append("SELECT username FROM gomyammi.user WHERE email=?");
        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();
        if (rs.next()) // 입려된 아이디에 계정이 있을 경우
        {
            name = rs.getString("username"); // 비번을 변수에 넣는다.
        }
        return name;
    }

    //이메일로 회원정보를 받아온다.
    public MemberBean getUserInfo(String email) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean member = null;

        // 쿼리
        StringBuffer query = new StringBuffer();
        query.append("SELECT * FROM gomyammi.user WHERE email=?");

        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(query.toString());
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();

        if (rs.next()) // 회원정보를 DTO에 담는다.
        {
            // 자바빈에 정보를 담는다.
            member = new MemberBean();
            member.setEmail(rs.getString("email"));
            member.setPassword(rs.getString("password"));
            member.setName(rs.getString("username"));
            member.setGender(rs.getInt("gender"));
            member.setPhone(rs.getString("phonenumber"));
            member.setAge(rs.getInt("age"));
            member.setProfession(rs.getString("profession"));
            member.setNumOfFamily(rs.getInt("numOfFamily"));
            member.setHousing(rs.getString("housing"));
            member.setPreparedEnviro(rs.getString("preparedEnviro"));
            member.setPastExperience(rs.getInt("pastExperience"));
        }
        return member;
    }    // end getUserInfo

    //이메일에 해당되는 계정을 삭제한다. 반환값은 삭제 성공 여부
    @SuppressWarnings("resource")
    public int deleteMember(String email, String pw) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = -1;

        // 비밀번호 조회
        StringBuffer query1 = new StringBuffer();
        query1.append("SELECT password FROM gomyammi.user WHERE email=?");

        // 회원 삭제
        StringBuffer query2 = new StringBuffer();
        query2.append("DELETE FROM gomyammi.user WHERE email=?");

        conn = DBConnection.getConnection();

        // 자동 커밋을 false로 한다.
        conn.setAutoCommit(false);

        // 1. 아이디에 해당하는 비밀번호를 조회한다.
        pstmt = conn.prepareStatement(query1.toString());
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            dbpw = rs.getString("password");
            if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
            {
                // 같을경우 회원삭제 진행
                pstmt = conn.prepareStatement(query2.toString());
                pstmt.setString(1, email);
                pstmt.executeUpdate();
                conn.commit();
                x = 1; // 삭제 성공
            } else {
                x = 0; // 비밀번호 비교결과 - 다름
            }
        }
        return x;
    }// end deleteMember

    //회원을 등록합니다.
    public void updateMember(MemberBean member) throws SQLException, NamingException, ClassNotFoundException {

        Connection conn = null;
        PreparedStatement pstmt = null;

        StringBuffer query = new StringBuffer();
        query.append("UPDATE gomyammi.user SET");
        query.append(" username=?, gender=?, phonenumber=?, age=?, profession=?, numOfFamily=?, housing=?, preparedEnviro=? , pastExperience=?");
        query.append(" WHERE email=?");

        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(query.toString());

        // 자동 커밋을 false로 한다.
        conn.setAutoCommit(false);

        pstmt.setString(1, member.getName());
        pstmt.setInt(2, member.getGender());
        pstmt.setString(3, member.getPhone());
        pstmt.setInt(4, member.getAge());
        pstmt.setString(5, member.getProfession());
        pstmt.setInt(6, member.getNumOfFamily());
        pstmt.setString(7, member.getHousing());
        pstmt.setString(8, member.getPreparedEnviro());
        pstmt.setInt(9, member.getPastExperience());

        pstmt.setString(10, member.getEmail());

        pstmt.executeUpdate();
        // 완료시 커밋
        conn.commit();
    } // end updateMember

    //비밀번호를 변경합니다
    public void changePs(String email, String ps) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        StringBuffer sql = new StringBuffer();
        sql.append("UPDATE gomyammi.user SET password=? WHERE email=?");
        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(sql.toString());

        // 자동 커밋을 false로 한다.
        conn.setAutoCommit(false);

        pstmt.setString(1, ps);
        pstmt.setString(2, email);

        pstmt.executeUpdate();
        // 완료시 커밋
        conn.commit();
    }
}
