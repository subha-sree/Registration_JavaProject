package Data_program;
import java.sql.*;
public class tabel_Data {


		// TODO Auto-generated method stub

		public ResultSet rs;
		public Connection conn;
		
		public tabel_Data(Connection conn)
		{
			this.conn=conn;
		}
		
		public ResultSet reload()
		{
			
			try
			{
		    Statement st=conn.createStatement();
			rs=st.executeQuery("select * from  Customer_details");
			
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
			return rs;
			
		}
	}


