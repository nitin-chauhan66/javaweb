package javaweb;
import java.sql.*;
import javaweb.UserBean;
public class SignupDAO {
	public static int validate(UserBean bean){  
		int row=0;  
		try{  
		Connection con=DBconnect.getCon();  
		              
		PreparedStatement ps=con.prepareStatement(  
		    "insert into users values(?,?,?)");  
		  
		ps.setString(1,bean.getName());  
		ps.setString(2,bean.getPass());
		ps.setString(3, bean.getEmail());
		              
		row=ps.executeUpdate();  
		  
		              
		}catch(Exception e){}  
		  
		return row;  
		  
		}
}