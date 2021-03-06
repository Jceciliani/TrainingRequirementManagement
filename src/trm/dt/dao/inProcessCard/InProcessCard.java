
package trm.dt.dao.inProcessCard;

import trm.dt.dao.developTeamTrainerRequest.DDTTrainer;

import trm.dt.dao.developTeamTrainingRequest.DDTTraining;
import trm.dt.dao.employee.Employee;
import trm.dt.dao.trainingManagementStatus.ManagmentStatus;
import trm.dt.dao.trainingRequest.TrainingRequest;
import trm.dt.dao.trainingRequestLog.RequestLog;
import trm.dt.dao.trainingSchedule.*;

public class InProcessCard 
{
	private DDTTraining training = new DDTTraining();
	private TrainingRequest request = new TrainingRequest();
	private TrainingSchedule schedule = new TrainingSchedule();
	private	Employee projectManager = new Employee();
	private DDTTrainer trainer = new DDTTrainer();
	private Employee currentTrainer = new Employee();
	private ManagmentStatus status = new ManagmentStatus();
	private RequestLog reqLog = new RequestLog();
	
	public RequestLog getReqLog() {
		return reqLog;
	}
	public void setReqLog(RequestLog reqLog) {
		this.reqLog = reqLog;
	}
	public DDTTraining getTraining() {
		return training;
	}
	public void setTraining(DDTTraining training) {
		this.training = training;
	}
	public TrainingRequest getRequest() {
		return request;
	}
	public void setRequest(TrainingRequest request) {
		this.request = request;
	}
	public TrainingSchedule getSchedule() {
		return schedule;
	}
	public void setSchedule(TrainingSchedule schedule) {
		this.schedule = schedule;
	}
	public Employee getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(Employee projectManager) {
		this.projectManager = projectManager;
	}
	public DDTTrainer getTrainer() {
		return trainer;
	}
	public void setTrainer(DDTTrainer trainer) {
		this.trainer = trainer;
	}
	public Employee getCurrentTrainer() {
		return currentTrainer;
	}
	public void setCurrentTrainer(Employee currentTrainer) {
		this.currentTrainer = currentTrainer;
	}
	public ManagmentStatus getStatus() {
		return status;
	}
	public void setStatus(ManagmentStatus status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "InProcessCard [training=" + training + ", request=" + request + ", schedule=" + schedule
				+ ", projectManager=" + projectManager + ", trainer=" + trainer + ", currentTrainer=" + currentTrainer
				+ ", status=" + status + "]";
	}
	
}