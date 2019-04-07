package trm.pm.dbo;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class chartCounterClass {
	ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	JdbcTemplate template = (JdbcTemplate)context.getBean("db");
	
	public int totalTrainings(int ID) { // Total Training 1
		String sql = " select count(vertical) from training_request where requester_id = ?";
		@SuppressWarnings("deprecation")
		int tally  = template.queryForInt(sql,new Object[] {ID});
		System.out.println(tally);
		
		return tally;
	}
	public int totalTrainingsMonths(int ID, int month) { // Total Training 2
		int days = month*30;
		int tally = 0;
		LocalDate date = LocalDate.now().minusDays(days);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yy");
		String formattedString = date.format(formatter);
		
		String sql = "select count(vertical) from training_request where requester_id = ? and request_start_date > ?";
		 
		tally = template.queryForInt(sql,new Object[] {ID,formattedString});
	
		return tally;
	}
	public int totalTrainingsYear(int ID) { //Total Training 3
		LocalDate date = LocalDate.now().minusDays(365);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yy");
		String formattedString = date.format(formatter);
		
		 String sql = "select count(vertical) from training_request where requester_id = ? and request_start_date > ?";
		 
		int tally = 0;
		tally = template.queryForInt(sql,new Object[] {ID,formattedString});
		return tally;
	}
	public List<TrainingRequest> returnSelectedTrainings(Date date1, Date date2, int ID){
		
		String pattern = "dd-MMM-yy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String s1 = simpleDateFormat.format(date1);
		String s2 = simpleDateFormat.format(date2);
		System.out.println(s1); System.out.println(s2);	
		String sql = "select request_approx_participant, request_training_module from training_request where " +
				"requester_id = ? and request_start_date > ? and request_end_date< ?";
		List<TrainingRequest> vals = template.query(sql, new Object[] {ID,s1,s2},new TrainingRequestMapper());
		return vals; // returns # of participants, by type between dates
	}
	
	public int[] returnTrainingsByQuarter(int ID) {
		Calendar cal = Calendar.getInstance();int year = cal.get(Calendar.YEAR); // 2016
		String year2 = Integer.toString(year);
		String s1=(new StringBuilder()).append(year2.charAt(2)).append(year2.charAt(3)).toString(); 
		System.out.println(s1);
		String c1, c2, c3, c4, c5, c6, c7, c8 = null;
		c1 = "01-JAN-"+s1; c2 = "31-MAR"+s1; c3 = "01-APR"+s1;c4 = "30-JUN"+s1; c5 = "01-JUL"+s1;
		c6 = "30-SEP"+s1; c7 = "01-OCT"+s1; c8 = "13-DEC"+s1;
		int[] vals = new int[4];
		String sql = "select count(request_training_module) from training_request where requester_id = "
				+ "? and request_start_date>? and request_end_date<?";
		
		vals[0] = template.queryForInt(sql, new Object[] {ID,c1,c2});
		vals[1] = template.queryForInt(sql, new Object[] {ID,c3,c4});
		vals[2] = template.queryForInt(sql, new Object[] {ID,c5,c6});
		vals[3] = template.queryForInt(sql, new Object[] {ID,c7,c8});
		
		
		
		return vals;
	}
	public List<TrainingRequest> returnTrainingByType(int ID){
		return null;
	}
	public List<TrainingRequest> returnTrainingTypeCount(int ID){
		return null;
	}	
	public List<TrainingRequest> returnTrainingCount(int ID){
		return null;
	}
	public List<TrainingRequest> returnTrainingsType(int ID){
		return null;
	}
}

/*<li><a data-toggle="tab" href="#tab1">Training Count and startDate</a></li>
<li><a data-toggle="tab" href="#tab2">Training by requested Date</a></li>
<li><a data-toggle="tab" href="#tab3">Training per quarter</a></li>
<li><a data-toggle="tab" href="#tab4">Training by type</a></li>
<li><a data-toggle="tab" href="#tab5">Training by requested Date</a></li>*/
