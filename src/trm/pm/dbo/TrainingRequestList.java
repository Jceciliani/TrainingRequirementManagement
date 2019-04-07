package trm.pm.dbo;

import java.util.List;

public class TrainingRequestList {

	public TrainingRequestList() {
		// TODO Auto-generated constructor stub
	}
	
	public List<TrainingRequest> getTrainingRequestList(int eid) {
        List<TrainingRequest> reqList = new TrainingRequestDAO().getTrainingRequestList(eid);
        for (TrainingRequest req: reqList) {
        	req.setSchedule(new TrainingScheduleDAO().getTrainingSchedule(req.getTraining_request_id(), req.getStatus().getStatus()).get(0));
        	req.setLog(new TrainingRequestLogDAO().getTrainingRequestLog(req.getTraining_request_id()));
            req.setParticipantList(new Training_ParticipantsDAO().getAllTraining_ParticipantsBySession(req.getTraining_request_id()));
        }
        return reqList;
	}

	public static void main(String s[]) {
		List<TrainingRequest> reqlist = new TrainingRequestList().getTrainingRequestList(1000058);
		for (TrainingRequest req : reqlist) {
			System.out.println(req.getSpoc().getEmployee_id() + " " + req.getSchedule().getTraining_location());
		}
	}
}
