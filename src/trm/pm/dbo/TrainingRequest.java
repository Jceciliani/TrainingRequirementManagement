package trm.pm.dbo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class TrainingRequest implements Comparator<TrainingRequest>{
	
	private int training_request_id;
	private int requester_id;
	private String vertical;
	private String request_training_type;
	private String request_training_module;
	private String request_training_module_scope;
	private String request_training_mode;
	private Timestamp request_start_date;
	private Timestamp request_end_date;
	private String request_location;
	private String request_time_zone;
	private int request_approx_participant;
	private int request_project_spoc;
	private Timestamp time_requested;
	private String justification_of_request;
	
	private String start_date;
	private String end_date;
	private String date_requested;
	
	private Employee spoc;
	private TrainingManagementStatus status;
	private List<TrainingRequestLog> log;
	private TrainingSchedule schedule;
	private List<Training_Participants> participantList;
	
	public TrainingRequest() {
		this.participantList = new ArrayList<>();
		this.log = new ArrayList<>();
	}

	public String testTrainingRequest(){
		return training_request_id + " | " + requester_id + " | " + vertical + " | " + request_training_type + " | " + request_training_module + " | " + request_training_module_scope + " | " + request_training_mode + " | " + request_start_date + " | " + request_end_date + " | " + request_location + " | " + request_time_zone + " | " + request_approx_participant + " | " + request_project_spoc + " | " + time_requested + " | " + justification_of_request;
	}

	
	public String getDate_requested() {
		return date_requested;
	}

	public void setDate_requested(String date_requested) {
		this.date_requested = date_requested;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Employee getSpoc() {
		return spoc;
	}

	public void setSpoc(Employee spoc) {
		this.spoc = spoc;
	}

	public TrainingManagementStatus getStatus() {
		return status;
	}

	public void setStatus(TrainingManagementStatus status) {
		this.status = status;
	}

	public List<TrainingRequestLog> getLog() {
		return log;
	}

	public void setLog(List<TrainingRequestLog> log) {
		this.log = log;
	}

	public TrainingSchedule getSchedule() {
		return schedule;
	}

	public void setSchedule(TrainingSchedule schedule) {
		this.schedule = schedule;
	}

	public List<Training_Participants> getParticipantList() {
		return participantList;
	}

	public void setParticipantList(List<Training_Participants> participantList) {
		this.participantList = participantList;
	}

	public int getTraining_request_id() {
		return training_request_id;
	}
	public void setTraining_request_id(int training_request_id) {
		this.training_request_id = training_request_id;
	}
	public int getRequester_id() {
		return requester_id;
	}
	public void setRequester_id(int requester_id) {
		this.requester_id = requester_id;
	}
	public String getVertical() {
		return vertical;
	}
	public void setVertical(String vertical) {
		this.vertical = vertical;
	}
	public String getRequest_training_type() {
		return request_training_type;
	}
	public void setRequest_training_type(String request_training_type) {
		this.request_training_type = request_training_type;
	}
	public String getRequest_training_module() {
		return request_training_module;
	}
	public void setRequest_training_module(String request_training_module) {
		this.request_training_module = request_training_module;
	}
	public String getRequest_training_module_scope() {
		return request_training_module_scope;
	}
	public void setRequest_training_module_scope(
			String request_training_module_scope) {
		this.request_training_module_scope = request_training_module_scope;
	}
	public String getRequest_training_mode() {
		return request_training_mode;
	}
	public void setRequest_training_mode(String request_training_mode) {
		this.request_training_mode = request_training_mode;
	}
	public String getRequest_location() {
		return request_location;
	}
	public void setRequest_location(String request_location) {
		this.request_location = request_location;
	}
	public String getRequest_time_zone() {
		return request_time_zone;
	}
	public void setRequest_time_zone(String request_time_zone) {
		this.request_time_zone = request_time_zone;
	}
	public int getRequest_approx_participant() {
		return request_approx_participant;
	}
	public void setRequest_approx_participant(int request_approx_participant) {
		this.request_approx_participant = request_approx_participant;
	}
	public int getRequest_project_spoc() {
		return request_project_spoc;
	}
	public void setRequest_project_spoc(int request_project_spoc) {
		this.request_project_spoc = request_project_spoc;
	}
	public String getJustification_of_request() {
		return justification_of_request;
	}
	public void setJustification_of_request(String justification_of_request) {
		this.justification_of_request = justification_of_request;
	}
	public Timestamp getRequest_start_date() {
		return request_start_date;
	}
	public void setRequest_start_date(Timestamp request_start_date) {
		this.request_start_date = request_start_date;
	}
	public Timestamp getRequest_end_date() {
		return request_end_date;
	}
	public void setRequest_end_date(Timestamp request_end_date) {
		this.request_end_date = request_end_date;
	}
	public Timestamp getTime_requested() {
		return time_requested;
	}
	public void setTime_requested(Timestamp time_requested) {
		this.time_requested = time_requested;
	}

	@Override
	public String toString() {
		return "\nTrainingRequest [training_request_id=" + training_request_id + ", requester_id=" + requester_id
				+ ", vertical=" + vertical + ", request_training_type=" + request_training_type
				+ ", request_training_module=" + request_training_module + ", request_training_module_scope="
				+ request_training_module_scope + ", request_training_mode=" + request_training_mode
				+ ", request_start_date=" + request_start_date + ", request_end_date=" + request_end_date
				+ ", request_location=" + request_location + ", request_time_zone=" + request_time_zone
				+ ", request_approx_participant=" + request_approx_participant + ", request_project_spoc="
				+ request_project_spoc + ", time_requested=" + time_requested + ", justification_of_request="
				+ justification_of_request + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", date_requested=" + date_requested + ", spoc=" + spoc + ", status=" + status + ", log=" + log
				+ ", schedule=" + schedule + ", participantList=" + participantList + "]";
	}

	@Override
	public int compare(TrainingRequest o1, TrainingRequest o2) {
		// TODO Auto-generated method stub
		return o2.getTraining_request_id() - o1.getTraining_request_id();
	}
	

}