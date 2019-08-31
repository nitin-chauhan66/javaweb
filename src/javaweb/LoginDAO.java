package javaweb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class LoginDAO {
	public static boolean validate(UserBean bean){
		boolean status=false;
		try{
			String salt=null;
			Connection con=DBconnect.getCon();
			Salting st = new Salting();
			PreparedStatement ps=con.prepareStatement(
					"select * from users where email= ?");
			ps.setString(1, bean.getEmail());
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				salt = rs.getString(4);
			}
			String hashedpassword = st.getHasedPassword(bean.getPass(), salt);


			ps=con.prepareStatement(
					"select * from users where email= ?   and password= ?");
			ps.setString(1, bean.getEmail());
			ps.setString(2,hashedpassword);
			rs=ps.executeQuery();
			status=rs.next();

		}catch(Exception e){}

		return status;

	}
}
