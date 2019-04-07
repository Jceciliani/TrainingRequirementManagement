package trm.pm.dbo;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import trm.pm.dbo.TrainingRequest;
import trm.pm.dbo.TrainingRequestNewMapper;

public class TrainingRequestDAO {

	ApplicationContext context;
	JdbcTemplate temp;

	public TrainingRequestDAO() {
		context = new ClassPathXmlApplicationContext("spring-config.xml");
		temp = (JdbcTemplate)context.getBean("db");
	}

	public int getReqID(int eid){//

        return temp.queryForInt("select max(training_request_id) from training_request where requester_id = ?",new Object[] {eid});
    }
	
	public boolean insertTrainingRequest(int requester_id, String vertical, String request_training_type, String request_training_module, String request_training_module_scope, String request_training_mode, Timestamp request_start_date, Timestamp request_end_date, String request_location, String request_time_zone, int request_approx_participant, int request_project_spoc, Timestamp time_requested, String justification_of_request) {
		String sql = "insert into training_request values(training_id_request_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int num = temp.update(sql, new Object[]{requester_id, vertical, request_training_type, request_training_module, request_training_module_scope, request_training_mode, request_start_date, request_end_date, request_location, request_time_zone, request_approx_participant, request_project_spoc, time_requested, justification_of_request});
		if (num == 1) {
			return true;
		}
		return false;
	}

	public boolean deleteTrainingRequest(int training_request_id) {
		String sql = "delete from training_request where training_request_id=?";
		int num = temp.update(sql, new Object[]{training_request_id});
		if (num == 1) {
			return true;
		}
		return false;
	}

	public boolean updateTrainingRequest(int training_request_id, int requester_id, String vertical, String request_training_type, String request_training_module, String request_training_module_scope, String request_training_mode, Timestamp request_start_date, Timestamp request_end_date, String request_location, String request_time_zone, int request_approx_participant, int request_project_spoc, Timestamp time_requested, String justification_of_request) {
		String sql = "update training_request set requester_id=?, vertical=?, request_training_type=?, request_training_module=?, request_training_module_scope=?, request_training_mode=?, request_start_date=?, request_end_date=?, request_location=?, request_time_zone=?, request_approx_participant=?, request_project_spoc=?, time_requested=?, justification_of_request=? where training_request_id=?";
		int num = temp.update(sql, new Object[]{requester_id, vertical, request_training_type, request_training_module, request_training_module_scope, request_training_mode, request_start_date, request_end_date, request_location, request_time_zone, request_approx_participant, request_project_spoc, time_requested, justification_of_request, training_request_id});
		if (num == 1) {
			return true;
		}
		return false;
	}

	public List<TrainingRequest> getAllTrainingRequest() {
		String sql = "select * from training_request";
		return temp.query(sql, new TrainingRequestNewMapper());
	}

	public List<TrainingRequest> getAllTrainingRequest(int username, String vertical,String trainingType,String trainingModule,String moduleScope,
			String trainingMode,Date startDate,Date endDate,String location, String timeZone,int participants,int spoc,
			Date timestamp, String justification) {
		String sql = "select * from training_request where requester_id=? and vertical=? and request_training_type=? and request_training_module=? and request_training_module_scope=? and request_training_mode=? and request_start_date=? and request_end_date=? and request_location=? and request_time_zone=? and request_approx_participant=? and request_project_spoc=? and time_requested=? and justification_of_request=?";
		return temp.query(sql, new Object[] {username,vertical,trainingType,trainingModule,moduleScope, trainingMode,
				startDate, endDate,location,timeZone, participants, spoc, timestamp,justification}, new TrainingRequestMapper());
	}
	
	public List<TrainingRequest> getTrainingRequestList(int eid) {
		String sql = "select t.*, spoc.*, m.* from employee e " + 
				"join training_request t " + 
				"on t.requester_id = e.employee_id " + 
				"join TRAINING_MANAGEMENT_STATUS m " + 
				"on m.TRAINING_REQUEST_ID = t.TRAINING_REQUEST_ID " +  
				"join employee spoc " + 
				"on spoc.employee_id = t.REQUEST_PROJECT_SPOC " + 
				"where e.employee_id = ? or t.requester_id != ? and t.request_project_spoc = ?";
		return temp.query(sql, new Object[] {eid,eid,eid}, new TrainingRequestNewMapper());
	}
	
	public List<TrainingRequest> getAllTrainingRequest(int eid) {
		String sql = "select * from training_request where requester_id=?";
		return temp.query(sql, new Object[] {eid}, new TrainingRequestNewMapper());
	}
	
	public List<TrainingRequest> getTrainingRequest(int training_request_id) {
		String sql = "select * from training_request where training_request_id=?";
		List<TrainingRequest> trainingRequest = temp.query(sql, new Object[]{training_request_id},new TrainingRequestNewMapper());
		return trainingRequest;
	}
	
	public static void main(String s[]) {
		List<TrainingRequest> rlist = new TrainingRequestDAO().getAllTrainingRequest(1000058);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(rlist.get(0).getRequest_start_date());
		System.out.println(time);
	}

	//updateNewDetail
	public boolean updateTrainingRequest(int training_request_id, int request_approx_participant,
			String justification_of_request) {
		// TODO Auto-generated method stub
		String sql = "update training_request set request_approx_participant=?, justification_of_request=? where training_request_id = ?"; 
		System.out.println("TEST=============================================");
		int num = temp.update(sql, new Object[]{request_approx_participant, justification_of_request, training_request_id});
		if (num == 1) {
			return true;
		}
		return false;
	}
	public boolean updateNewDetail(int training_request_id, int status, int request_approx_participant,
			String justification_of_request) {
		// TODO Auto-generated method stub
		String sql = "update training_request set request_approx_participant=?, justification_of_request=? where training_request_id = ?"; 
		System.out.println("TEST=============================================");
		int num = temp.update(sql, new Object[]{request_approx_participant, justification_of_request, training_request_id});
		boolean res = new TrainingRequestLogDAO().insertTrainingRequestLog(training_request_id, status,
				String.format("Update Details -> New Participants Number: %d, Justification: %s", request_approx_participant, justification_of_request));
		if (num == 1 && res) {
			return true;
		}
		return false;
	}
	
	//updateModule
	public boolean updateTrainingRequest(int status, int training_request_id, String request_training_type,
			String request_training_module, String request_training_module_scope, String request_training_mode) {
		// TODO Auto-generated method stub
		String sql = "update training_request set request_training_type = ?, request_training_module=?, request_training_module_scope=?,request_training_mode=? where training_request_id =?";
		int num = temp.update(sql, new Object[]{ request_training_type, request_training_module, request_training_module_scope, request_training_mode, training_request_id});
		boolean res = new TrainingRequestLogDAO().insertTrainingRequestLog(training_request_id, status, 
				String.format("Update Module -> New Type: %s, New Module: %s, New Scope: %s, New Mode: %s", 
						request_training_type, request_training_module, request_training_module_scope, 
						request_training_mode));
		if (num == 1 && res) {
			return true;
		}
		return false;
	}

	public boolean updateTrainingRequest(int training_request_id, Timestamp request_start_date, Timestamp request_end_date,
			String request_location, String request_time_zone) {
		// TODO Auto-generated method stub	
		String sql = "update training_request set request_start_date=?, request_end_date=?, request_location=?, request_time_zone=? where training_request_id=?";
		int num = temp.update(sql, new Object[]{request_start_date, request_end_date, request_location, request_time_zone, training_request_id});
		if (num == 1) {
			return true;
		}
		return false;
		
	}
	//updateNewDate
	public boolean updateTrainingRequestDate(int status, int training_request_id, String request_start_date, String request_end_date,
			String request_location, String request_time_zone) throws ParseException, SQLException{
		// TODO Auto-generated method stub	
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp start_date = new Timestamp(((java.util.Date)df.parse(request_start_date)).getTime());
		Timestamp end_date = new Timestamp(((java.util.Date)df.parse(request_end_date)).getTime());
		String sql = "update training_request set request_start_date=?, request_end_date=?, request_location=?, request_time_zone=? where training_request_id=?";
		int num = temp.update(sql, new Object[]{start_date, end_date, request_location, request_time_zone, training_request_id});
		boolean res = new TrainingRequestLogDAO().insertTrainingRequestLog(training_request_id, status, 
				String.format("Update Request Date -> New Start Date: %s, New End Date: %s, New Location: "
				+ "%s, New Time Zone: %s", request_start_date, request_end_date, request_location, 
				request_time_zone));
		if (num == 1 && res) {
			return true;
		}
		return false;
		
	}
}