
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
		//insert �û���Ϣint user_id, int user_target ,boolean user_is_friend�����Դӱ��class����ã�
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
				//���ϵĲ����Ǵ�ӡ��֮ǰ����Ϣ����Ҫ�Ļ���ɾ������
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
				//������Ϣ����ӡ����
				//System.out.println("inf:::::::::");
				
			} catch (Exception e) {
				throw e;
			} finally {
				close();
			}
		}
		//�����ݿ������ȫ����Ϣ��println����
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
		
		//search���� ����һ��id�����ҵ��й���Ϣ�������йص������뵽һ��int[] friends�����retrue int[] friends���������Դӱ��class����ã�
		//���class�����ݿ�������user_id����һ��key�ģ����Ҳ��ᶨ���user_id��user_targetһ����Ϊkey���� ������Щ�������ǲ����
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
		//�ر�
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