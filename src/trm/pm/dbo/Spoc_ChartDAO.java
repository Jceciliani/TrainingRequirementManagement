package trm.pm.dbo;

import java.sql.Timestamp;
import java.util.List;



import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class Spoc_ChartDAO {

	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	JdbcTemplate temp = (JdbcTemplate)context.getBean("db");
	
	
	//selecting from the database
	public List<Spoc_Chart> getSpoc_Chart(int eid){
		
		System.out.println("-------------------------------------------------------");
		String sql = "select request_training_module, count(request_approx_participant)from training_request where requester_id=? group by request_training_module";
		//String sql = "select first_name, count(training_completed) as no_trng from training_request r, spoc_master m, executive_workflow_status s, employee e where m.spoc_vertical = r.vertical and s.training_request_id = r.training_request_id and e.employee_id = m.spoc_emp_id group by spoc_master_id, first_name";
		return temp.query(sql, new Object[]{eid}, new Spoc_ChartMapper());
	}
	public static void main(String s[])
	{
		//System.out.println(new Spoc_ChartDAO().getSpoc_Chart(eid).size());
	}
}
