package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.MyConn;
import dto.Admin;
import dto.User;

public class AdminDao {
	
	private MyConn mcon;
	public AdminDao() {
		mcon=new MyConn();
	}
	
	public boolean Adminlogin(Admin login) throws SQLException, ClassNotFoundException {
		boolean flag = false;
		Connection con = mcon.getConn();
		PreparedStatement ps = con.prepareStatement("select * from adminlogin where adminname = ? and adminpass = ?");
		ps.setString(1, login.getAdminName());
		ps.setString(2, login.getAdminPass());
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			flag=true;
		}
		con.close(); 
		return flag;
	}
	
	public ArrayList<User> getLoanDetails() {
		ArrayList<User> list = new ArrayList<User>();
		try {
			Connection con = mcon.getConn();
			PreparedStatement s = con.prepareStatement("select * from loan_details where loanStatus='Pending'");
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				User lad= new User();
				lad.setUserId(rs.getInt(1));
				lad.setLoanType(rs.getString(2));
				lad.setLoanAmount(rs.getFloat(3));
				lad.setLoanDuration(rs.getInt(4));
				lad.setLoanRate(rs.getFloat(5));
				lad.setLoanStatus(rs.getString(6));
				list.add(lad);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
