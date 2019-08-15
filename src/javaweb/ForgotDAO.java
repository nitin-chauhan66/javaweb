package javaweb;
import java.sql.Connection;
import java.sql.PreparedStatement;
public class ForgotDAO {
	public static int reset(UserBean bean){
		int row=0;
		try{
			Connection con=DBconnect.getCon();

			PreparedStatement ps=con.prepareStatement(
					"update users set password=? where email=?");


			ps.setString(1,bean.getPass());
			ps.setString(2, bean.getEmail());
			row=ps.executeUpdate();


		}catch(Exception e){}

		return row;

	}
}
