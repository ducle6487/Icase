package edu.hutech.Icase;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnect {
	// private String servername;
	private String port;
	private String db_name;
	private String db_user;
	private String db_pass;

	public MyConnect() {
		port = "1433";
		db_name = "Icase";
		db_user = "userz";
		db_pass = "user";
	}

	public Connection getcn() {
		Connection cn = null;
		try {
			String db_url = "jdbc:sqlserver://localhost:" + port + ";databaseName=" + db_name;
			System.out.println(db_url);
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			cn = DriverManager.getConnection(db_url, db_user, db_pass);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return cn;
	}

	public String test() {
		Connection cn = getcn();
		if (cn == null) {
			return "ket noi that bai";
		} else {
			return "ket noi thanh cong";
		}
	}

	public static void main(String[] args) {
		MyConnect m = new MyConnect();
		String me = m.test();
		System.out.println(me + " " + m.db_name);
	}
}