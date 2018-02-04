package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import conn.MyConn;
import dto.User;

public class UserDao {

private MyConn mcon;
	
	public UserDao(){
		mcon = new MyConn();
	}
	
	public boolean UserRegistration(User urlogin){
		boolean i = false;
		Connection con = mcon.getConn();
		try {
			PreparedStatement ps = con.prepareStatement("insert into userlogin (firstname, lastname, username, userpass, emailid) values(?,?,?,?,?)");
			ps.setString(1, urlogin.getFname());
			ps.setString(2, urlogin.getLname());
			ps.setString(3, urlogin.getUserName());
			ps.setString(4, urlogin.getUserPass());
			ps.setString(5, urlogin.getEmailid());
			ps.executeUpdate();
			sendMail(urlogin.getEmailid());
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Username Already Exists");
		}
		return i;
	}
	
	public void sendMail(String email) {
		
		String to = email;
		final String from = "automaticloanapproval@gmail.com";
		final String password = "Loan@1234";
		//String host = "local host";
	
		
		try {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.port", "465");
       // prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.user", from);
        prop.put("mail.password", password);
		
        //prop.setProperty("mail.smtp.host", host);
		
        Authenticator auth = new Authenticator()
        {
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(from, password);
            }
        };
		Session session = Session.getDefaultInstance(prop, auth);
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject("Registration Successful");
			msg.setText("Please Login using http://localhost:8080/AutomaticLoanApprovalSystem/index.jsp");
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public boolean User(User ulogin) throws SQLException {
		boolean flag=false;
		Connection con = mcon.getConn();
		PreparedStatement ps = con.prepareStatement("select username, userpass from userlogin where username=? and userpass=?");
		ps.setString(1, ulogin.getUserName());
		ps.setString(2, ulogin.getUserPass());
		
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			flag=true;
		}
		con.close();
		return flag;
	}
	
	public User getUserById(User ulogin) throws SQLException {
		User user =new User();
		Connection con = mcon.getConn();
		PreparedStatement ps = con.prepareStatement("select userId from userlogin where username=?");
		ps.setString(1, ulogin.getUserName());
		
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			user.setUserId(rs.getInt(1));
		}
		return user;
	}
	
	public boolean personalDetails(int userid,User rf) throws SQLException{
		boolean flag=false;
		
		Connection con=mcon.getConn();
		String query="insert into personal_details(userid,fname,mname,lname,gender,dob,address,city,pincode,state,emailid,mobileno) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, userid);
		ps.setString(2, rf.getFname());
		ps.setString(3, rf.getMname());
		ps.setString(4, rf.getLname());
		ps.setString(5, rf.getGender());
		ps.setString(6, rf.getDob());
		ps.setString(7, rf.getAddress());
		ps.setString(8, rf.getCity());
		ps.setInt(9, rf.getPincode());
		ps.setString(10, rf.getState());
		ps.setString(11, rf.getEmailid());
		ps.setString(12, rf.getMobileno());
		ps.executeUpdate();
		con.close();
		return flag;
	}
	
	
	public User getRegistrationForm(User reg) throws SQLException{
		User regForm=new User();
		Connection con=mcon.getConn();
		String query="select fname,mname,lname,gender,dob,address,city,pincode,state,emailid,mobileno from personal_details";
		PreparedStatement ps=con.prepareStatement(query);
		
		ps.setString(1, reg.getFname());
		ps.setString(2, reg.getMname());
		ps.setString(3, reg.getLname());
		ps.setString(4, reg.getGender());
		ps.setString(5, reg.getDob());
		ps.setString(6, reg.getAddress());
		ps.setString(7, reg.getCity());
		ps.setInt(8, reg.getPincode());
		ps.setString(9, reg.getState());
		ps.setString(10, reg.getEmailid());
		ps.setString(11, reg.getMobileno());
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			regForm.setFname(rs.getString(1));
			regForm.setMname(rs.getString(2));
			regForm.setLname(rs.getString(3));
			regForm.setGender(rs.getString(4));
			regForm.setDob(rs.getString(5));
			regForm.setAddress(rs.getString(6));
			regForm.setCity(rs.getString(7));
			regForm.setPincode(rs.getInt(8));
			regForm.setState(rs.getString(9));
			regForm.setEmailid(rs.getString(10));
			regForm.setMobileno(rs.getString(11));
			
		}
		return regForm;
	}
	public List<User> getAllRegistrationDetails() throws SQLException
	{
		List<User>plist=new ArrayList<>();
		
		Connection con=mcon.getConn();
		String query="select fname,mname,lname,gender,dob,address,city,pincode,state,emailid,mobileno from personal_details";
		PreparedStatement ps=con.prepareStatement(query);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			User rf=new User();
			rf.setFname(rs.getString(1));
			rf.setMname(rs.getString(2));
			rf.setLname(rs.getString(3));
			rf.setGender(rs.getString(4));
			rf.setDob(rs.getString(5));
			rf.setAddress(rs.getString(6));
			rf.setCity(rs.getString(7));
			rf.setPincode(rs.getInt(8));
			rf.setState(rs.getString(9));
			rf.setEmailid(rs.getString(10));
			rf.setMobileno(rs.getString(11));
			plist.add(rf);
		}
		return plist;
	}
	
	public boolean InsertNewLoan(int uid, User loan) throws SQLException {
		boolean i = false;
		Connection con = mcon.getConn();
		PreparedStatement ps = con.prepareStatement("insert into loan_details(userid, loanAmount, loanDuration) values(?,?,?)");
		ps.setInt(1, uid);
		ps.setFloat(2, loan.getLoanAmount());
		ps.setInt(3, loan.getLoanDuration());
		ps.executeUpdate();
		con.close();
		return i;
	}
	
	public User getLoanDetailsbyId(int uid) throws SQLException {
		Connection con = mcon.getConn();
		PreparedStatement ps = con.prepareStatement("select userid, loanType, loanAmount, loanDuration, loanRate, loanStatus from loan_details where userid = ?");
		ps.setInt(1, uid);
		ResultSet rs=ps.executeQuery();
		User lad = new User();
		while(rs.next()){
			lad.setUserId(rs.getInt(1));
			lad.setLoanType(rs.getString(2));
			lad.setLoanAmount(rs.getFloat(3));
			lad.setLoanDuration(rs.getInt(4));
			lad.setLoanRate(rs.getFloat(5));
			lad.setLoanStatus(rs.getString(6));
		}
		return lad;
	}
	
	
	public boolean addFinancialDetails(int uid, User fd)  throws SQLException{
		boolean flag = false;
		
		Connection con=mcon.getConn();
		String query="insert into financial_details(userid,nature_of_occupation,employer_name,total_Experience,designation,yearly_Income,pan_No) values (?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setInt(1, uid);
		ps.setString(2, fd.getNature_of_occupation());
		ps.setString(3, fd.getEmployer_Name());
		ps.setInt(4, fd.getTotal_Experience());
		ps.setString(5, fd.getDesignation());
		ps.setDouble(6, fd.getYearly_Income());
		ps.setString(7, fd.getPan_No());
		
		flag=ps.execute();
		
		con.close(); 
		return flag;
	}
	
	public User getFinancialDetails(User f) throws SQLException{
		User fd=new User();
		
		Connection con=mcon.getConn();
		String query="select * from financial_details where userid=?";
		PreparedStatement ps=con.prepareStatement(query);
		
		ps.setInt(1, f.getUserId());
		
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			fd.setNature_of_occupation(rs.getString(3));
			fd.setEmployer_Name(rs.getString(4));
			fd.setTotal_Experience(rs.getInt(5));
			fd.setDesignation(rs.getString(6));
			fd.setYearly_Income(rs.getDouble(7));
			fd.setPan_No(rs.getString(8));
		}
		return fd;
	}
	public List<User> getAllFinancialDetails() throws SQLException
	{
		List<User>flist=new ArrayList<>();
		
		Connection con=mcon.getConn();
		String query="select * from financial_details";
		PreparedStatement ps=con.prepareStatement(query);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			User fd=new User();

			fd.setNature_of_occupation(rs.getString(3));
			fd.setEmployer_Name(rs.getString(4));
			fd.setTotal_Experience(rs.getInt(5));
			fd.setDesignation(rs.getString(6));
			fd.setYearly_Income(rs.getDouble(7));
			fd.setPan_No(rs.getString(8));
			flist.add(fd);
		}
		return flist;
	}
	
	public boolean insertAssets(int id, User fd) throws SQLException {
		boolean flag = false;
		
		Connection con=mcon.getConn();
		String query="insert into assets(userid, house_cost, vehicle_cost, vehicle_puchase_date, fd_cost) values (?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setInt(1, id);
		ps.setFloat(2, fd.getHouse_cost());
		ps.setFloat(3, fd.getVeh_cost());
		ps.setString(4, fd.getVeh_pur_date());
		ps.setFloat(5, fd.getFd_cost());
		flag=ps.execute();
		
		con.close(); 
		return flag;
	}
	
	//To insert User ExpenditureDetails into database
	public boolean addExpenditureDetails(int uid, User ed)
	{
		boolean flag = false;
		try {
			Connection con = mcon.getConn();
			String query = "insert into expenditure_details(userid,previous_loan, previous_loan_amount,loan_duration,remaining_time_period,emi,pending_amount,yearly_expenditure )values(?,?,?,?,?,?,?,?) ";
				
			PreparedStatement ps = con.prepareStatement(query);
				
			ps.setInt(1, uid);
			ps.setString(2,ed.getPrevious_Loan());
			ps.setDouble(3, ed.getPrevious_Loan_Amount());
			ps.setInt(4, ed.getLoan_Duration());
			ps.setInt(5, ed.getRemaining_Time_Period());
			ps.setDouble(6, ed.getEmi());
			ps.setDouble(7, ed.getPending_Amount());
			ps.setDouble(8, ed.getYearly_Expenditure());
				
			ps.executeUpdate();
				
			con.close();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
		
		
		// To fetch single records
	public User getExpenditureDetails(User u) throws SQLException  {
			
		User e = new User();
			
		Connection con = mcon.getConn();
		String query = "select * from expenditure_details where userid=?";
		PreparedStatement ps = con.prepareStatement(query);
			
		ps.setInt(1, u.getUserId());
		
		ResultSet rs = ps.executeQuery();
			
		while (rs.next()) {
			e.setPrevious_Loan(rs.getString(2));
			e.setPrevious_Loan_Amount(rs.getDouble(3));
			e.setLoan_Duration(rs.getInt(4));
			e.setRemaining_Time_Period(rs.getInt(5));
			e.setEmi(rs.getDouble(6));
			e.setPending_Amount(rs.getDouble(7));				
			e.setYearly_Expenditure(rs.getDouble(8));
		}
		return e;
	}
		
		// To fetch Multiple Records 
	public ArrayList<User> selectExpenditureDetails()
	{
		//To store multiple records arraylist is used
		ArrayList<User> list = new ArrayList<User>();
			
		try {
			Connection con = mcon.getConn();
			PreparedStatement s = con.prepareStatement("select * from expenditure_details");
			ResultSet rs = s.executeQuery();
			while (rs.next()) {
				User ed = new User();
				ed.setPrevious_Loan(rs.getString(2));
				ed.setPrevious_Loan_Amount(rs.getDouble(3));
				ed.setLoan_Duration(rs.getInt(4));
				ed.setRemaining_Time_Period(rs.getInt(5));
				ed.setEmi(rs.getDouble(6));
				ed.setPending_Amount(rs.getDouble(7));
				ed.setYearly_Expenditure(rs.getDouble(8));
				list.add(ed);	
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;  //it is accessed from anywhere it contains ExpenditureDetails object
	}
	
	public User getAllDetails(User u){
		User ur = new User();
		try {
			Connection con = mcon.getConn();
			String query="select p.fname,p.mname,p.lname,p.gender,p.dob,p.address,p.city,p.pincode,p.state,p.emailid,p.mobileno, f.nature_of_occupation, f.employer_name, f.total_experience, f.designation, f.yearly_income, f.pan_no, e.previous_loan,e.previous_loan_amount,e.loan_duration, e.remaining_time_period, e.emi,e.pending_amount,e.yearly_expenditure, a.house_cost,a.vehicle_cost,a.vehicle_puchase_date,a.fd_cost, l.loanType, l.loanAmount, l.loanDuration, l.loanRate, l.loanStatus from personal_details as p INNER JOIN financial_details as f ON p.userid=f.userid INNER JOIN expenditure_details as e ON p.userid=e.userid Inner JOIN assets as a ON p.userid=a.userid INNER JOIN loan_details as l ON p.userid=l.userid where p.userid=? LIMIT 1";
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setInt(1, u.getUserId());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ur.setFname(rs.getString(1));;
				ur.setMname(rs.getString(2));
				ur.setLname(rs.getString(3));
				ur.setGender(rs.getString(4));
				ur.setDob(rs.getString(5));
				ur.setAddress(rs.getString(6));
				ur.setCity(rs.getString(7));
				ur.setPincode(rs.getInt(8));
				ur.setState(rs.getString(9));
				ur.setEmailid(rs.getString(10));
				ur.setMobileno(rs.getString(11));
				ur.setNature_of_occupation(rs.getString(12));
				ur.setEmployer_Name(rs.getString(13));
				ur.setTotal_Experience(rs.getInt(14));
				ur.setDesignation(rs.getString(15));
				ur.setYearly_Income(rs.getDouble(16));
				ur.setPan_No(rs.getString(17));
				ur.setPrevious_Loan(rs.getString(18));
				ur.setPrevious_Loan_Amount(rs.getFloat(19));
				ur.setLoan_Duration(rs.getInt(20));
				ur.setRemaining_Time_Period(rs.getInt(21));
				ur.setEmi(rs.getDouble(22));
				ur.setPending_Amount(rs.getDouble(23));
				ur.setYearly_Expenditure(rs.getDouble(24));
				ur.setHouse_cost(rs.getFloat(25));
				ur.setVeh_cost(rs.getFloat(26));
				ur.setVeh_pur_date(rs.getString(27));
				ur.setFd_cost(rs.getFloat(28));
				ur.setLoanType(rs.getString(29));
				ur.setLoanAmount(rs.getFloat(30));
				ur.setLoanDuration(rs.getInt(31));
				ur.setLoanRate(rs.getFloat(32));
				ur.setLoanStatus(rs.getString(33));
			}
			con.close();
		} catch (NullPointerException | SQLException e) {
			/*e.printStackTrace();*/
			System.out.println("Null Pointer Exception");
		}
		return ur;
	}
	
	/*public int updateUser(User upuser) throws SQLException, ClassNotFoundException
	{
		int i;
		Connection con= mcon.getConn();
		PreparedStatement ps = con.prepareStatement("update personal_details as p LEFT JOIN financial_details as f ON personal_details.userid=financial_details.userid LEFT JOIN expenditure_details as e ON personal_details.userid=expenditure_details.userid LEFT JOIN assets as a ON personal_details.userid=assets.userid LEFT JOIN loan_details as l on personal_details.userid=loan_details.userid set p.fname=?, p.mname=?, p.lname=?, p.gender=?, p.dob=?, p.address=?, p.city=?, p.pincode=?, p.state=?, p.emailid=?, p.mobileno=?, f.nature_of_occupation=?, f.employer_name=?, f.employer_name=?, f.total_experience=?, f.designation=?, f.yearly_income=?, f.pan_no=?, e.previous_loan=?, e.previous_loan_amount=?, e.loan_duration=?, e.remaining_time_period=?, e.emi=?, e.pending_amount=?, e.yearly_expenditure=?, a.house_cost=?, a.vehicle_cost=?, a.vehicle_puchase_date=?, a.fd_cost=?, l.loanType=?, l.loanAmount=?, l.loanDuration=?, l.loanRate=? WHERE p.userid=?");
			ps.setString(1, upuser.getFname());
			ps.setString(2, upuser.getMname());
			ps.setString(3, upuser.getLname());
			ps.setString(4, upuser.getGender());
			ps.setString(5, upuser.getDob());
			ps.setString(6, upuser.getAddress());
			ps.setString(7, upuser.getCity());
			ps.setInt(8, upuser.getPincode());
			ps.setString(9, upuser.getState());
			ps.setString(10, upuser.getEmailid());
			ps.setString(11, upuser.getMobileno());
			ps.setString(12, upuser.getNature_of_occupation());
			ps.setString(13, upuser.getEmployer_Name());
			ps.setInt(14, upuser.getTotal_Experience());
			ps.setString(15, upuser.getDesignation());
			ps.setDouble(16, upuser.getYearly_Income());
			ps.setString(17,upuser.getPan_No());
			ps.setString(18, upuser.getPrevious_Loan());
			ps.setFloat(19, (float) upuser.getPrevious_Loan_Amount());
			ps.setInt(20,upuser.getLoan_Duration());
			ps.setInt(21, upuser.getRemaining_Time_Period());
			ps.setDouble(22, upuser.getEmi());
			ps.setDouble(23, upuser.getPending_Amount());
			ps.setDouble(24, upuser.getYearly_Expenditure());
			ps.setDouble(25, upuser.getHouse_cost());
			ps.setFloat(26, upuser.getVeh_cost());
			ps.setString(27, upuser.getVeh_pur_date());
			ps.setFloat(28, upuser.getFd_cost());
			ps.setString(29, upuser.getLoanType());
			ps.setFloat(30, upuser.getLoanAmount());
			ps.setInt(31, upuser.getLoan_Duration());
			ps.setFloat(32, upuser.getLoanRate());
			ps.setInt(33, upuser.getUserId());
			i = ps.executeUpdate();
		con.close();
		return i;
	}*/
	
	public int updateStatus(User upuser) throws SQLException, ClassNotFoundException
	{
		int i;
		Connection con= mcon.getConn();		
		PreparedStatement ps = con.prepareStatement(" UPDATE loan_details SET loanStatus=? WHERE userid=?");
			ps.setString(1,  upuser.getLoanStatus());
			ps.setInt(2, upuser.getUserId());
/*			System.out.println(ps);*/
			i = ps.executeUpdate();
		con.close();
		return i;
	}
}