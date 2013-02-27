package com.hyacinth.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    private static final String DB_DRIVER="com.mysql.jdbc.Driver";
    private static final String DB_URL="jdbc:mysql://localhost/";
    private static final String DB_NAME="hyacinth";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";
    
    private Connection conn = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	public DatabaseConnection() throws Exception {
		try {
			Class.forName(DB_DRIVER);
			this.conn = DriverManager.getConnection(DB_URL+DB_NAME, DB_USER,DB_PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			throw e;
		}
	}

	public Connection getConnection(){
	        return this.conn;
	}

	public void close() throws Exception{
		if(this.conn != null){
			try {
				this.conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw e;
			}
		}
	}
	
    
}
