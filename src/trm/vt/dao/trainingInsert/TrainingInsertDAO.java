package trm.vt.dao.trainingInsert;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import trm.vt.dao.employee.Employee;
import trm.vt.dao.employee.EmployeeMapper;

public class TrainingInsertDAO {

	ApplicationContext context;
	JdbcTemplate temp;
	
	public TrainingInsertDAO() {
		context = new ClassPathXmlApplicationContext("spring-config.xml");
		temp = (JdbcTemplate) context.getBean("db");
	}
	
	public void insertTrainee(int employee_id, int training_session_id, String first_name, 
			String last_name, String email, String phone_number){
		String sql = "insert into insert_training_participants values(?,?,?,?,?,?)";
		temp.update(sql, new Object[]{employee_id, training_session_id, first_name, last_name, email, phone_number});
		
	}
	
	public List<TrainingInsert> getAllInserts(){
		String sql = "select * from insert_training_participants";
		List<TrainingInsert> insertList = temp.query(sql, new TrainingInsertMapper());
		return insertList;
	}
	public List<TrainingInsert> getAllInsertsWithTrainingID(){
		String sql = "select e.employee_id, p.training_session_attended, e.first_name, e.last_name, e.email, e.phone_number from employee e inner join training_participants p on e.employee_id = p.participant_employee_id";
		List<TrainingInsert> insertList = temp.query(sql, new TrainingInsertMapper());
		return insertList;
	}
	
	public void truncate(){
		temp.execute("truncate table insert_training_participants");
	}
	
	

	public void insertTrainingRequest(int requester_id, String vertical, String request_training_type, String request_training_module, String request_training_module_scope, String request_training_mode, String request_start_date, String request_end_date, String request_location, String request_time_zone, int request_approx_participant, int request_project_spoc, String time_requested, String justification_of_request){
		
		String sql = "insert into training_request values(training_id_request_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		temp.update(sql, new Object[]{requester_id, vertical, request_training_type,request_training_module, request_training_module_scope, request_training_mode,request_start_date ,request_end_date, request_location,request_time_zone,request_approx_participant,request_project_spoc,time_requested,justification_of_request});
		
	}
}
