package javaweb;
import java.sql.Connection;
import java.sql.PreparedStatement;
public class SignupDAO {
	public static int validate(UserBean bean){
		int row=0;
		try{
			Salting st = new Salting();
			String salt =st.getSalt();
			String haspassword = st.getHasedPassword(bean.getPass(), salt);
			Connection con=DBconnect.getCon();

			PreparedStatement ps=con.prepareStatement(
					"insert into users values(?,?,?,?,?)");

			ps.setString(1,bean.getName());
			ps.setString(2, bean.getEmail());
			ps.setInt(3, 100);
			ps.setString(4, salt);
			ps.setString(5,haspassword);


			row=ps.executeUpdate();


		}catch(Exception e){}

		return row;

	}
}