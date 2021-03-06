
package trm.dt.dao.inProcessCard;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import trm.dt.dao.summary.Summary;
import trm.dt.dao.summary.SummaryDAO;

public class InProcessCardDAO 
{
	ApplicationContext context;
	public JdbcTemplate temp;
	public InProcessCardDAO()
	{
		context = new ClassPathXmlApplicationContext("spring-config.xml");
		temp = (JdbcTemplate)context.getBean("db");
	}
	public List<InProcessCard> getInProcessCardList(String vertical)
	{
		System.out.println(vertical);
		List<InProcessCard> InProcessCardList =  temp.query("select distinct tr.training_request_id, dtr.schedule_id, tr.request_training_type, tr.request_training_mode, tr.request_location, tr.request_approx_participant, tr.request_start_date, tr.request_end_date, tr.request_training_module_scope, tr.request_training_module,pm.first_name,pm.last_name, ct.first_name as ctfn, ct.last_name as ctln, dttr.dtt_trainer_request_id, dttr.request_sent_date,dttr.response,dttr.active_status, ts.*,s.status,dtr.dtt_training_id from DEVELOP_TEAM_TRAINING_REQUEST dtr join TRAINING_REQUEST tr on dtr.training_request_id = tr.training_request_id join TRAINING_SCHEDULE ts on dtr.schedule_id = ts.training_schedule_id join TRAINING_MANAGEMENT_STATUS s on tr.training_request_id = s.training_request_id join EMPLOYEE pm on pm.employee_id = tr.requester_id join DEVELOP_TEAM_TRAINER_REQUEST dttr on dtr.trainer_request_id = dttr.dtt_trainer_request_id join EMPLOYEE ct on ct.employee_id = dttr.trainer_id  join TRAINING_REQUEST_LOG trl on trl.TRAINING_REQUEST_ID = tr.training_request_id  where s.status in (203,220,222,221,210) and tr.vertical = ?",
				new Object[]{vertical},new InProcessCardMapper());
//		select distinct d.dtt_training_id, t.training_request_id, e.first_name, e.last_name,t.request_training_module, t.request_training_module_scope,t.request_training_type, t.request_start_date, t.request_location, t.request_approx_participant from employee e inner join training_request t on e.employee_id = t.requester_id inner join develop_team_training_request d on t.training_request_id = d.training_request_id inner join training_management_status tms on t.training_request_id = tms.training_request_id where tms.status = 203 and t.vertical = ?

		// where s.status = 203 and tr.vertical = ?
		return InProcessCardList;
		
//		List<InProcessCard> InProcessCardList =  temp.query("select tr.training_request_id,e.first_name,"
//				+ "e.last_name,tr.request_training_module,"
//				+ "tr.request_training_type,ts.training_start_date,ts.training_end_date,tr.request_approx_participant,"
//				+ "ts.training_city,s.status,dtr.dtt_training_id "
//				+ "from DEVELOP_TEAM_TRAINING_REQUEST dtr "
//				+ "join TRAINING_REQUEST tr on dtr.training_request_id = tr.training_request_id "
//				+ "join TRAINING_SCHEDULE ts on dtr.schedule_id = ts.training_schedule_id "
//				+ "join TRAINING_MANAGEMENT_STATUS s on tr.training_request_id = s.training_request_id "
//				+ "join EMPLOYEE e on e.employee_id = tr.requester_id "
//				+ "where s.status=203 or s.status=204 or s.status=205 or s.status=206 or s.status=207 "
//				+ "or s.status=208 or s.status=209 ", 
//				new Object[]{},new InProcessCardMapper());
//		return InProcessCardList;
	}

	public static void main(String s[])
	{
		InProcessCardDAO sld = new InProcessCardDAO();
		List<InProcessCard> sls = sld.getInProcessCardList("INS");
		for(InProcessCard a : sls)
		System.out.println(a);
	}
	
}

