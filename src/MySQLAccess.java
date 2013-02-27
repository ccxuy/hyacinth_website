import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLAccess {
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	public void writeDataBase(int user_id, String user_login_id,String user_name,
							String user_password,String user_email,String user_qq_num,
							String user_credit,int user_security) throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/hyacinth?"
							+ "user=root&password=admin");
			statement = connect.createStatement();
			resultSet = statement
					.executeQuery("select * from hyacinth.USER");
			showResultSet(resultSet);
			preparedStatement = connect
					.prepareStatement("insert into  hyacinth.USER values (?,?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, user_id );
			preparedStatement.setString(2, user_login_id );
			preparedStatement.setString(3, user_name  );
			preparedStatement.setString(4, user_password   );
			preparedStatement.setString(5, user_email   );
			preparedStatement.setString(6, user_qq_num   );
			preparedStatement.setString(7, user_credit   );
			preparedStatement.setInt(8, user_security   );
			preparedStatement.executeUpdate();
			preparedStatement = connect
					.prepareStatement("SELECT * from hyacinth.USER");
			resultSet = preparedStatement.executeQuery();
			showResultSet(resultSet);;			
		} catch (Exception e) {
			throw e;
		} finally {
			close();
		}

	}

	private void showResultSet(ResultSet resultSet) throws SQLException {
		while (resultSet.next()) {
			int user_id = resultSet.getInt("user_id");
			String user_login_id = resultSet.getString("user_login_id");
			String user_name = resultSet.getString("user_name");
			String user_password = resultSet.getString("user_password");
			String user_email = resultSet.getString("user_email");
			String user_qq_num = resultSet.getString("user_qq_num");
			String user_credit = resultSet.getString("user_credit");
			int user_security = resultSet.getInt("user_security");
			
			System.out.println("user_id: " + user_id);
			System.out.println("user_login_id: " + user_login_id);
			System.out.println("user_name: " + user_name);
			System.out.println("user_password: " + user_password);
			System.out.println("user_email: " + user_email);
			System.out.println("user_qq_num: " + user_qq_num);
			System.out.println("user_credit: " + user_credit);
			System.out.println("user_security: " + user_security);
		}
	}

	private void close() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}

			if (statement != null) {
				statement.close();
			}

			if (connect != null) {
				connect.close();
			}
		} catch (Exception e) {

		}
	}

}
