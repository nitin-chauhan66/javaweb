package javaweb;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Salting
{
	public String getSalt() {
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[16];
		random.nextBytes(salt);
		StringBuilder sb = new StringBuilder();
		for (byte b : salt)
			sb.append(String.format("%02x", b));
		String saltstr = sb.toString();
		return saltstr;
	}
	public String getHasedPassword(String Originalpassword,String saltvalue)
	{

		String password = Originalpassword;
		String hashedpassword=null;
		String saltstr =saltvalue;
		MessageDigest md;
		try
		{
			md = MessageDigest.getInstance("SHA-256");
			byte[] salt=saltstr.getBytes(StandardCharsets.UTF_8);
			md.update(salt);

			// Generate the salted hash
			byte[] hashedPassword = md.digest(password.getBytes(StandardCharsets.UTF_8));

			StringBuilder sb = new StringBuilder();
			for (byte b : hashedPassword)
				sb.append(String.format("%02x", b));
			hashedpassword = sb.toString();
		} catch (NoSuchAlgorithmException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hashedpassword;
	}

}