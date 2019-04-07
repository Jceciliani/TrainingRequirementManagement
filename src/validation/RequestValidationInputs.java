package validation;

import java.util.Date;

import javax.validation.constraints.Future;
import javax.validation.constraints.Size;

public class RequestValidationInputs {
		 
	    @Size(min = 20, max = 200, message = "Must be between 10 and 200 characters")
	    private String justification;
	    
	    @Size(min = 5, max = 50, message = "Must be between 5 and 50 trainees")
	    private int participants;
	    
	    @Size
	    private int spoc;
	   
	    @Future(message = "Date must be in the future")
	    private Date startDate;
	    // less than 2 months from today
	    // endstart greater than startdate
	    @Future(message = "Date must be after startDate")
	    private Date endDate;
	     
	    
		
		public void setJustification(String justification) {
			this.justification = justification;
		}
		public int getParticipants() {
			return participants;
		}
		public void setParticipants(int participants) {
			this.participants = participants;
		}
		public int getSpoc() {
			return spoc;
		}
		public void setSpoc(int spoc) {
			this.spoc = spoc;
		}
		public Date getStartDate() {
			return startDate;
		}
		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}
		public Date getEndDate() {
			return endDate;
		}
		public void setEndDate(Date endDate) {
			this.endDate = endDate;
		}
	    
}

