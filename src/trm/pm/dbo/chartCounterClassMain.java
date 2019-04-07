package trm.pm.dbo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import sun.security.timestamp.Timestamper;

public class chartCounterClassMain {
	Date date = new Date();  
	Timestamp ts=new Timestamp(date.getTime());   
	public static void main(String[] s) {
		Calendar cal = Calendar.getInstance();int year = cal.get(Calendar.YEAR); // 2016
		String year2 = Integer.toString(year);
		String s1=(new StringBuilder()).append(year2.charAt(2)).append(year2.charAt(3)).toString(); 
		System.out.println(s1);
	}
}

