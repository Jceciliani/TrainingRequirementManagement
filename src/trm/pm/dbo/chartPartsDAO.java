package trm.pm.dbo;

import java.util.List;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class chartPartsDAO {
	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	JdbcTemplate temp = (JdbcTemplate)context.getBean("db");	
	
	public List<chartParts> partsDetails(int ID){
	String sql = "select request_approx_participant, request_training_module from training_request where requester_id = ?";
	List<chartParts> cp = temp.query(sql,new Object[]{ID},new chartPartsMapper());
	System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
	for(chartParts a: cp){
		System.out.println(a.getRequest_approx_participant());
		System.out.println(a.getRequest_training_module());
	}
	return cp;
	}
}
