


public class Main {
	public static void main(String[] args) throws Exception {
		MySQLAccess dao = new MySQLAccess();
		int user_id =124352;
		String user_login_id="1as3d"; 
		String user_name="asd"; 
		String user_password ="asd";
		String user_email ="asd";
		String user_qq_num ="asd";
		String user_credit ="ads";
		int user_security =123;
		dao.writeDataBase(user_id,
				user_login_id,
				user_name,
				user_password,
				user_email,
				user_qq_num,
				user_credit,
				user_security);
		
		/*Access_friendship fri=new Access_friendship();
		int user_id2=10;
		int user_target=10;
		boolean user_is_friend=true;
		//.readDataBase(user_id2, user_target, user_is_friend);
*/	}


}
