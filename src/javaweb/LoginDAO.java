package javaweb;

import java.sql.*;
import javaweb.UserBean;
public class LoginDAO {
	public static boolean validate(UserBean bean){  
		boolean status=false;  
		try{  
		Connection con=DBconnect.getCon();  
		              
		PreparedStatement ps=con.prepareStatement(  
		    "select * from users where email= ?   and password= ?");  
		  
		ps.setString(1,bean.getEmail());  
		ps.setString(2,bean.getPass());  
		              
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		              
		}catch(Exception e){}  
		  
		return status;  
		  
		}
}
