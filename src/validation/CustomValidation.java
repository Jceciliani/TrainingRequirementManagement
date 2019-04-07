package validation;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import trm.pm.dbo.EmployeeDAO;


public class CustomValidation {
	private String message;
	
	public String setErrorMessage(String trainingModule,
			Date startDate, Date endDate, String Scope, String spoc){
		StringBuilder s = new StringBuilder();
		
		String[] jvs = new String[5];
		String[] net = new String[5];
		String[] cisco = new String[5];
		String[] azure = new String[5];
		String[] python = new String[5];
		String[] frontend = new String[5];
		String[] mobile = new String[5];
		
		jvs[0] = "Spring MVC"; jvs[1] = "Spring Boot";
		net[0] = "Net Core"; net[1] = "Net Framework";net[2] = "MVC5";
		
		azure[0]  ="Azure";
		python[0] = "Machine Learning"; python[1] = "Numpy"; python[2] = "Tensor Flow";
		frontend[0] = "Bootstrap";
		mobile[0] = "Spring Mobile";
		
		
		
		
		EmployeeDAO ed = new EmployeeDAO();
		LocalDate dn = LocalDate.now();
		Date today = java.sql.Date.valueOf(dn);
		String pattern = "dd-MMM-yy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(today);
		boolean flag = true;
		


		Calendar cal = Calendar.getInstance(); 
		cal.add(Calendar.MONTH, 2);
		Date MonthX2 = new Date();
		MonthX2 = cal.getTime();
		


		message = "";
		if(startDate.before(today)){
			//message = "Start Date cannot be before today";
			message = message + " Start Date cannot be before today<br>\\n";
			//s.append("Start Date cannot be before today \n");
			flag = false;
		}
		if(trainingModule == null || trainingModule.equals("")){
			message = message + " Module cannot be blank<br>\\n";
			flag = false;
		}
		if(startDate.after(MonthX2)){
			message = message + " Start Date must be within 2 months<br>\\n";
			flag = false;
		}
		if(endDate.before(startDate)){
			//message = "end date cannot be before todays date";
			message = message + " End Date cannot be before Start Date<br>\\n";
			//s.append("end date cannot be before todays date\n");
			flag = false;
		}
		try{
		if(ed.checkSpoc(Integer.parseInt(spoc))==0){
			//message = "Not a valid Spoc ID, please enter -1 or enter valid ID";
			message = message + " Not a valid Spoc ID, please enter a valid ID<br>\\n";
			//s.append("Not a valid Spoc ID, please enter -1 or enter valid ID\n");
			flag = false;
		}
		}
		catch(NumberFormatException e){
			message = message + " Not a valid Spoc ID, please enter a valid ID<br>\\n";
			//s.append("Not a valid Spoc ID, please enter -1 or enter valid ID\n");
			flag = false;
		}
		if(Scope == null || Scope.equals("")){
			//message = "Scope cannot be empty!";
			message = message + " Scope cannot be blank<br>\\n";
			//s.append("Scope cannot be empty!\n");
			flag = false;
			
		}
		else{
		/*switch(trainingModule){
		case "Java FSD":
			if(!checkCases(jvs,Scope)){
				//message = "Items selected do not align with Java FSD";
				message = message + " Items selected do not align with Java FSD<br>\\n";

				//s.append("Items selected do not align with Java FSD\n");
				flag = false;
			}
			break;
		case ".Net":	
			if(!checkCases(net,Scope)){
				//message = "Items selected do not align with .Net";
				message = message + " Items selected do not align with .Net<br>\\n";
				//s.append("Items selected do not align with .Net\n");
				flag = false;
			}
			break;
		case "Cisco CCNA":
			if(!checkCases(cisco,Scope)){
				//message = "Items selected do not align with Cisco CCNA";
				message = message + " Items selected do not align with Cisco CCNA<br>\\n";
				//s.append("Items selected do not align with Cisco CCNA\n");
				flag = false;
			}
			break;
		case "Azure":
			if(!checkCases(azure,Scope)){
				//message = "Items selected do not align with Azure";
				message = message + " Items selected do not align with Azure<br>\\n";
				//s.append("Items selected do not align with Azure\n");
				flag = false;
			}
			break;
		case "Python":
			if(!checkCases(python,Scope)){
				//message = "Items selected do not align with Python";
				message = message + " Items selected do not align with Python<br>\\n";
				//s.append("Items selected do not align with Python\n");
				flag = false;
			}
			break;
		case "Front End":
			if(!checkCases(frontend,Scope)){
				//message = "Items selected do not align with Front End";
				message = message + " Items selected do not align with Front End<br>\\n";
				//s.append("Items selected do not align with Front End\n");
				flag = false;
			}
			break;
		case "Mobile":
			if(!checkCases(mobile,Scope)){
				//message = "Items selected do not align with Mobile";
				message = message + " Items selected do not align with Mobile<br>\\n";

				//s.append("Items selected do not align with Mobile\n");
				flag = false;
			}
			break;
			
			
		}*/
		}
		
		
		//message = s.toString();
		if(flag){
			message = "Your request has been submitted!";
		}
		
		//System.out.println("\n\n\n\n\n\n\n\n\\n\n\n " + message + message.getClass() +"\n\n\n\n\n\n");
		return message;
		
			
	}
	public boolean checkCases(String[] masterList, String[] toCheck){
		for(String s : toCheck){
			//System.out.println("SIze!!!!! " + toCheck.length);
			boolean flag = false;
			for(String f : masterList){
				if(s.equalsIgnoreCase(f)){
					flag = true;
				}
			}
			if(!flag){
				return false;
			}
		}
		//System.out.println("\n\n\n\n\n\n\n\n\n\n True!! \n\n\n\n");
		return true;
	}
	

}
