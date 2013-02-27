
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
import java.sql.Statement;

	public class Access_friendship {
		private Connection connect = null;
		private Statement statement = null;
		private PreparedStatement preparedStatement = null;
		private ResultSet resultSet = null;
		//insert 用户信息int user_id, int user_target ,boolean user_is_friend（可以从别的class里调用）
		public void readDataBase(int user_id, int user_target ,boolean user_is_friend) throws Exception {
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				connect = DriverManager
						.getConnection("jdbc:mysql://localhost/feedback?"
								+ "user=sqluser&password=sqluserpw");
				statement = connect.createStatement();
				resultSet = statement
						.executeQuery("select * from FEEDBACK.USER_RELATIONSHIP");
				writeResultSet(resultSet);
				//以上的部分是打印出之前的信息，不要的话你删掉好了
				preparedStatement = connect
						.prepareStatement("insert into  FEEDBACK.USER_RELATIONSHIP values (?, ?,?)");
				preparedStatement.setInt(1, user_id );
				preparedStatement.setInt(2, user_target  );
				preparedStatement.setBoolean(3, user_is_friend   );
				preparedStatement.executeUpdate();
				preparedStatement = connect
						.prepareStatement("SELECT * from FEEDBACK.USER_RELATIONSHIP");
				resultSet = preparedStatement.executeQuery();
				writeResultSet(resultSet);
				//插入信息并打印出来
				//System.out.println("inf:::::::::");
				
			} catch (Exception e) {
				throw e;
			} finally {
				close();
			}
		}
		//从数据库里调用全部信息并println出来
		private void writeResultSet(ResultSet resultSet) throws SQLException {
			
			while (resultSet.next()) {
				int user_id = resultSet.getInt("user_id");
				int user_target = resultSet.getInt("user_target");
				boolean user_is_friend = resultSet.getBoolean("user_is_friend");	
				System.out.println("user relationship inf");
				System.out.println("user_id: " + user_id);
				System.out.println("user_target: " + user_target);
				System.out.println("user_is_friend: " + user_is_friend);
				System.out.println("user relationship inf end-------");
			}
		}
		
		//search函数 输入一个id，，找到有关信息，，将有关的人输入到一个int[] friends里，，再retrue int[] friends，，（可以从别的class里调用）
		//这个class的数据库我是用user_id来做一个key的，，我不会定义把user_id和user_target一起定义为key，， 不过这些函数还是不变的
		public int[] search(int id) throws SQLException, ClassNotFoundException {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/feedback?"
							+ "user=sqluser&password=sqluserpw");
			statement = connect.createStatement();
			resultSet = statement
					.executeQuery("select * from FEEDBACK.USER_RELATIONSHIP");
			int[] friends = new int[10];
			int n=0;
			System.out.println("user relationship earch inf");
			while (resultSet.next()) {
				int user_id = resultSet.getInt("user_id");
				int user_target = resultSet.getInt("user_target");
				boolean user_is_friend = resultSet.getBoolean("user_is_friend");
				if(id==user_id&&user_is_friend==true){
					System.out.println("user_target: " + user_target);
					friends[n]=user_target;
					n++;
				}
			}
			System.out.println("user relationship earch inf end--------");
			return friends;
		}
		//关闭
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