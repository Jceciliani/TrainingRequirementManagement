package trm.pm.dbo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.RowMapper;

public class TrainingRequestNewMapper implements RowMapper<TrainingRequest> {

	@Override
	public TrainingRequest mapRow(ResultSet rs, int arg1) throws SQLException {
		TrainingRequest tbuf = new TrainingRequest();

		tbuf.setTraining_request_id(rs.getInt("training_request_id"));
		tbuf.setRequester_id(rs.getInt("requester_id"));
		tbuf.setVertical(rs.getString("vertical"));
		tbuf.setRequest_training_type(rs.getString("request_training_type"));
		tbuf.setRequest_training_module(rs.getString("request_training_module"));
		tbuf.setRequest_training_module_scope(rs.getString("request_training_module_scope"));
		tbuf.setRequest_training_mode(rs.getString("request_training_mode"));
		tbuf.setRequest_start_date(rs.getTimestamp("request_start_date"));
		tbuf.setRequest_end_date(rs.getTimestamp("request_end_date"));
		tbuf.setRequest_location(rs.getString("request_location"));
		tbuf.setRequest_time_zone(rs.getString("request_time_zone"));
		tbuf.setRequest_approx_participant(rs.getInt("request_approx_participant"));
		tbuf.setRequest_project_spoc(rs.getInt("request_project_spoc"));
		tbuf.setTime_requested(rs.getTimestamp("time_requested"));
		tbuf.setJustification_of_request(rs.getString("justification_of_request"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		tbuf.setStart_date(sdf.format(tbuf.getRequest_start_date()));
		tbuf.setEnd_date(sdf.format(tbuf.getRequest_end_date()));
		tbuf.setDate_requested(sdf.format(tbuf.getTime_requested()));
		
		Employee ebuf = new Employee();
		ebuf.setEmployee_id(rs.getInt("employee_id"));
		ebuf.setLast_name(rs.getString("last_name"));
		ebuf.setFirst_name(rs.getString("first_name"));
		ebuf.setUser_name(rs.getString("user_name"));
		ebuf.setPassword(rs.getString("password"));
		ebuf.setPhone_number(rs.getString("phone_number"));
		ebuf.setEmail(rs.getString("email"));
		ebuf.setStreet(rs.getString("street"));
		ebuf.setCity(rs.getString("city"));
		ebuf.setState(rs.getString("state"));
		ebuf.setCountry(rs.getString("country"));
		ebuf.setJob_title(rs.getString("job_title"));
		ebuf.setVertical(rs.getString("vertical"));
		ebuf.setProject(rs.getString("project"));
		ebuf.setPid(rs.getInt("pid"));
//		
		TrainingManagementStatus status = new TrainingManagementStatus();
		status.setTraining_management_status_id(rs.getInt("training_management_status_id"));
		status.setTraining_request_id(rs.getInt("training_request_id"));
		status.setStatus(rs.getInt("status"));
		
		tbuf.setSpoc(ebuf);
		tbuf.setStatus(status);
		
		return tbuf;
	}
}