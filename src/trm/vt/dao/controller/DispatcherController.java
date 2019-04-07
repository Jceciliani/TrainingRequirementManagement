package trm.vt.dao.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import javax.validation.ConstraintViolation;
//import javax.validation.Validation;
//import javax.validation.ValidatorFactory;
import javax.xml.transform.Source;
import javax.xml.validation.Validator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import trm.pm.dbo.DatabaseUpdate;
import trm.pm.dbo.Employee;
import trm.pm.dbo.EmployeeDAO;
import trm.pm.dbo.Spoc_Chart;
import trm.pm.dbo.Spoc_ChartDAO;
import trm.pm.dbo.TrainingManagementStatusDAO;
import trm.pm.dbo.TrainingRequest;
import trm.pm.dbo.TrainingRequestDAO;
import trm.pm.dbo.TrainingRequestLog;
import trm.pm.dbo.TrainingRequestLogDAO;
import trm.pm.dbo.Training_ParticipantsDAO;
import trm.pm.dbo.chartCounterClass;
import trm.pm.dbo.chartParts;
import trm.pm.dbo.chartPartsDAO;
import trm.vt.dao.trainingInsert.TrainingInsert;
import validation.CustomValidation;
import validation.RequestValidationInputs;

@Controller
@RequestMapping(value="/pm")
//@SessionAttributes ({"command", "Cards"})
public class DispatcherController {
/*	@RequestMapping(value="/")
	public String login_view() {
		return "loginpage";
	}
	@RequestMapping(value="loginpage")
	public String check_user(HttpServletRequest request, ModelMap model) {
	    HttpSession session = request.getSession();
	    String username = request.getParameter("un");
	    String password = request.getParameter("up");
	    //model.addAttribute("username", username);
	    //model.addAttribute("password", password);
	    session.setAttribute("username", username);
	    session.setAttribute("password", password);
	    boolean res = SecurityCheck.isUserValid(username, password);
	    if (res) {
	         
	        return "redirect:/alltraining";
	    }
	    else {
	        return "error";
	    }
	}*/
	///////////////////  -  - - - - - - My link -- -- ---------------------------///////////////////
	@RequestMapping(value = "/pmreport")
	public String pmChartJs(HttpServletRequest request, ModelMap map) {
		/*
		HttpSession session = request.getSession();
	    String user = (String) session.getAttribute("username");
		EmployeeDAO ES = new EmployeeDAO();
	    List<Employee> emps = ES.getTRInfo(user); 
	    int ID = 0;
		for(Employee eemp : emps) {
			ID = eemp.getEmployee_id();
		}
		chartCounterClass ccc = new chartCounterClass();
		String[] labels = {"Total Training", "Past 3 Months", "Past Year"};
		int[] yInts = new int[3];
		yInts[0] = ccc.totalTrainings(ID);
		yInts[1] = ccc.totalTrainingsMonths(ID, 3);
		yInts[2] = ccc.totalTrainingsYear(ID);
		}
		return "chart1";
		*/
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("username");
		String pass = (String) session.getAttribute("password");
		Employee pm = new EmployeeDAO().getEmployee(user, pass);
		List<Spoc_Chart> sc = new Spoc_ChartDAO().getSpoc_Chart(pm.getEmployee_id());

		map.addAttribute("spoc_chart_list",sc);

		return "chart1";
}
	
	@RequestMapping(value= "TheCharter") // i need the mapping
	public void getChartData(HttpServletRequest request, ModelMap map) throws ParseException {
	
	    HttpSession session = request.getSession();
	    String chartData = request.getParameter("ChartDataReq");
	    String startDate2 = request.getParameter("startDate");
		String endDate2 = request.getParameter("endDate");
		SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = in.parse(startDate2);
		Date endDate = in.parse(endDate2);
		
	    String user = (String) session.getAttribute("username");
		EmployeeDAO ES = new EmployeeDAO();
	    List<Employee> emps = ES.getTRInfo(user); 
	    int ID = 0;
		for(Employee eemp : emps) {
			ID = eemp.getEmployee_id();
		}
		
	        
			
	    
	    switch(chartData) {
	    case "Total Training":System.out.println("\n\n\n\n\n\n Type 1\n\n\n\n\n\n\n\n\n\n");
	    chartPartsDAO cp = new chartPartsDAO();
	    List<chartParts> totalT = cp.partsDetails(ID);
	    map.addAttribute("chartParts",totalT);
	    break;
        
	    case "Trainings2":System.out.println("\n\n\n\n\n\n Type 2\n\n\n\n\n\n\n\n\n\n");break;
	    
	    
	    case "Trainings3":System.out.println("\n\n\n\n\n\n Type 3\n\n\n\n\n\n\n\n\n\n");break;
	    
	    case "Trainngs4":System.out.println("\n\n\n\n\n\n Type 4\n\n\n\n\n\n\n\n\n\n");break;

	    
	    		
	    }
	}

	
	 @RequestMapping(value="alltraining")
	    public String alltraining_view(HttpServletRequest request, ModelMap model) throws IOException {
	        HttpSession session = request.getSession();
	        String user = (String) session.getAttribute("username");
	        String pass = (String) session.getAttribute("password");
	        //System.out.println(user + pass);
	        Employee pm = new EmployeeDAO().getEmployee(user, pass);
	        session.setAttribute("manager", pm);
	        
	        List<TrainingInsert> loti = new trm.vt.dao.trainingInsert.TrainingInsertDAO().getAllInsertsWithTrainingID();
	        model.addAttribute("participants", loti);
	        
			session.setAttribute("employees", trm.vt.dao.employee.EmployeeDAO.listOfEmployees());
	        System.out.println(pm.testEmployee());
	        List<TrainingRequest> reqList = new TrainingRequestDAO().getTrainingRequestList(pm.getEmployee_id());
	        Collections.sort(reqList, new TrainingRequest());
	        for(TrainingRequest req: reqList){req.setLog(new TrainingRequestLogDAO().getTrainingRequestLog(req.getTraining_request_id()));}
	        //System.out.println(reqList.toString());
	        System.out.println(reqList.size());
	        model.addAttribute("manager", pm);
	        model.addAttribute("Cards", reqList);
	        //If the session attribute does not exists you get null from the getAttribute method, you need to guard for the null return like this:
	        String errMesTrainReqSession = (String) session.getAttribute ("errMesTrainReq");
	        //if (v != null && v.equals (1) { /* ... */ }
	        if(errMesTrainReqSession == null){
	        	model.addAttribute("errMesTrainReqModel", "Your request has been submitted!");
	        }
	        else{
	        	model.addAttribute("errMesTrainReqModel", errMesTrainReqSession);
	        }
	        //System.out.println(model.get("cards").getClass());
	        return "firstpage";
	    }
	 @RequestMapping(value="insertNewTRequest")
	    public String insertNewTRequest(HttpServletRequest request, ModelMap model) {
	        
	        int participant_employee_id = Integer.parseInt(request.getParameter("participant_employee_id"));
	        int training_session_attended = Integer.parseInt(request.getParameter("training_session_attended"));
	        //trm.vt.dao.employee.Employee newEmployee;
	        
	        
	        //newEmployee = new trm.vt.dao.employee.EmployeeDAO().getEmployee(participant_employee_id);
	        //new TrainingParticipantsDAO().insertTrainingRequest(trainingrequest.getParticipant_employee_id(), trainingrequest.getTraining_session_attended());
	        //new trm.vt.dao.trainingInsert.TrainingInsertDAO().insertTrainee(participant_employee_id, training_session_attended, newEmployee.getFirst_name(), newEmployee.getLast_name(), newEmployee.getEmail(), newEmployee.getPhone_number());
	        new trm.pm.dbo.Training_ParticipantsDAO().insertTraining_Participants(participant_employee_id, training_session_attended);
	        
	        //model.addAttribute("manager", pm);
	        return "redirect:/pm/alltraining#participants"+training_session_attended; 
	    }
	 
	 @RequestMapping(value= "TrainingReq/")
		public String NewTraining(HttpServletRequest request, ModelMap model) {
			return "trainingrequest";
		}
		
		public class spocValue {
			public int spocVal(String spocString) {
		        if(spocString.equals(null)) {return -1;}
		        return Integer.parseInt(spocString);
		    }
		}
		
		
		
		
		
		
		
		
		
		
		@RequestMapping(value= "TrainingReq/trainingrequest")
		public String addNewTraining(HttpServletRequest request, ModelMap model, 
				chartParts cp, BindingResult result) throws java.text.ParseException{
	        HttpSession session = request.getSession();
	        String user = (String) session.getAttribute("username");
	        Employee emp = (Employee) session.getAttribute("manager");
			EmployeeDAO ES = new EmployeeDAO();
			List<Employee> emps = ES.getTRInfo(user); // fix this
			String vertical = null, location = null, state = null; int ID = 0; String timeZone=null;
			for(Employee eemp : emps) {
				vertical = eemp.getVertical();
				location = eemp.getCity();
				state = eemp.getState();
				ID = eemp.getEmployee_id();
			}
			
			timeZone = ES.getTimeZone(state);
		
			String trainingModule = request.getParameter("trainingModule");
			String trainingModuleOther = request.getParameter("other");
			if (trainingModule.equalsIgnoreCase("Other")) {
				trainingModule = trainingModuleOther;
			}
			
			String moduleScopeString = request.getParameter("trainingModuleScope");
			//String[] moduleScopeString = request.getParameterValues("trainingModuleScope");
//			StringBuilder s = new StringBuilder();
//			String moduleScope = null;
//			if(moduleScopeString != null){
//			for (int i = 0; i<moduleScopeString.length; i++){
//				if(i == moduleScopeString.length - 1){
//					s.append(moduleScopeString[i]);
//					}
//				else{
//					s.append(moduleScopeString[i] + "; ");
//				}
//			}moduleScope = s.toString();
//			}
//			else{moduleScope = "!";}

			String trainingMode = request.getParameter("trainingModuleMode");
			String trainingType = request.getParameter("trainingType");
			String spoc = request.getParameter("spoc");
			if(spoc.equals("-1") || spoc.equals("0")){
				spoc = "" + emp.getEmployee_id();
			}
			
			String startDate2 = request.getParameter("startDate");
			String endDate2 = request.getParameter("endDate");
			SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = in.parse(startDate2);
			Date endDate = in.parse(endDate2);
			
			System.out.println("\n\n\n\n\n" + startDate.toString());
			System.out.println(endDate.toString() + " \n\n\n\n\n\n");
			
			String participants = request.getParameter("participants");
			String justification = request.getParameter("justification");
			
			DatabaseUpdate DU = new DatabaseUpdate();
			
			Timestamp timeNow = new Timestamp(System.currentTimeMillis());
			spocValue sv = new spocValue();
			
			
			
            
			//ScanValidations SV = new ScanValidations();
			//SV.run(Integer.parseInt(participants), Integer.parseInt(spoc), startDate, endDate);
			
			
			
			
			//cp.setParticipants(Integer.parseInt(participants));
			CustomValidation cv = new CustomValidation();
			
			
					
					
					
			String message = cv.setErrorMessage(trainingModule,startDate,endDate,moduleScopeString,spoc);
	        session.setAttribute("errMesTrainReq",message);
	        //System.out.println("\n\n\n\n\n\n" + message + "  \n\n\n\n\n");
			if(message.equals("Your request has been submitted!")){
					DU.insertTraining(ID,vertical,trainingType,trainingModule,moduleScopeString,trainingMode,startDate,endDate,location,
					timeZone,Integer.parseInt(participants),sv.spocVal(spoc),timeNow,justification);
					TrainingRequestDAO tr = new TrainingRequestDAO();
			        int val = tr.getReqID(ID);
			        TrainingManagementStatusDAO TMSD = new TrainingManagementStatusDAO();
			        TMSD.insertTrainingManagementStatus(val,100);
					return "redirect:/pm/alltraining"; 

					
			}else{
				//return "redirect:/pm/alltraining"; 
				return "redirect:/pm/alltraining#CreateRequestModal"; 
			}
	        
			
			
			
			
			
			/*TrainingRequestDAO tr = new TrainingRequestDAO();
	        int val = tr.getReqID(ID);
	        TrainingManagementStatusDAO TMSD = new TrainingManagementStatusDAO();
	        TMSD.insertTrainingManagementStatus(val,100);
			return "redirect:/pm/alltraining";*/
		}
		
		@RequestMapping(value="updateNewDate/{card.status.status}")
		public String updatewithNewDate(@PathVariable ("card.status.status") int status, @ModelAttribute("trainingrequest") TrainingRequest request)
		{
			try {
				if (false==new TrainingRequestDAO().updateTrainingRequestDate(status, request.getTraining_request_id(), request.getStart_date(), request.getEnd_date(), request.getRequest_location(), request.getRequest_time_zone())){
					return "error";
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "redirect:/pm/alltraining";

			}
			return "redirect:/pm/alltraining";
		}
		@RequestMapping(value="updateNewDetail/{card.status.status}")
		public String updatewithNewDetail(@PathVariable("card.status.status") int status, @ModelAttribute("trainingrequest") TrainingRequest request, HttpServletRequest request2)
		{
			boolean res = new TrainingRequestDAO().updateNewDetail(request.getTraining_request_id(), status, request.getRequest_approx_participant(), request.getJustification_of_request());
			if (!res) {
				return "error";
			}
			return "redirect:/pm/alltraining";
		}
		
		
		@RequestMapping(value="updateModule/{card.status.status}")
		public String updatewithNewModule(@PathVariable ("card.status.status") int status, HttpServletRequest request)
		{
			int tid = Integer.parseInt(request.getParameter("training_id"));
			String type = request.getParameter("type");
			String module = request.getParameter("module");
			String trainingModuleOther = request.getParameter("updateother");
			if (module.equalsIgnoreCase("Other")) {
				module = trainingModuleOther;
			}
			String scope = request.getParameter("scope");
			String mode = request.getParameter("mode");
			if(false==new TrainingRequestDAO().updateTrainingRequest(status, tid, type, module, scope, mode)){
				return "error";
			}
			return "redirect:/pm/alltraining";
		}
		@RequestMapping(value="RemoveParticipant")
		public String RemoveParticipant(HttpServletRequest request)
		{
			//System.out.println("hell1o\n\n\n");
			int trid = Integer.parseInt(request.getParameter("trid"));
			int eid = Integer.parseInt(request.getParameter("eid"));
			new Training_ParticipantsDAO().deleteTraining_Participants(trid, eid);
			//return "redirect:/pm/alltraining";
			return "redirect:/pm/alltraining#participants"+trid; 
		}
		
	 	@RequestMapping(value="approval/{training_request_id}")
		public String approval_view(@PathVariable("training_request_id") int tid, ModelMap map) {
			map.addAttribute("tid", tid);
			return "approve";
		}
		
		@RequestMapping(value="sendApproval/{card.training_request_id}")
		public String sendApproval_view(@PathVariable("card.training_request_id") int tid, HttpServletRequest request) {
			String choice = request.getParameter("selection");
			String just = request.getParameter("justification");
			//System.out.println("\n\n\n\n\n" + tid + "\n\n\n\n\n");
			//System.out.println("test test");
			//System.out.println(choice + "   " + just);
			if (choice.equalsIgnoreCase("approve")) {
				new TrainingManagementStatusDAO().updateTrainingManagementStatus(tid);
			}
			else {
				new TrainingManagementStatusDAO().updateTrainingManagementStatus(tid, just);
			}
			return "redirect:/pm/alltraining";
		}
	 
	 	/*
	    
	    @RequestMapping(value="home")
	    public String main_view() {
	        return "redirect:/alltraining";
	    }
	    
	    @RequestMapping(value="report")
	    public String report_view(HttpServletRequest request, ModelMap model) {
	        HttpSession session = request.getSession();
	        Employee emp = (Employee) session.getAttribute("manager");
	        model.addAttribute("manager", emp);
	        return "reportPage";
	    }
	    
	    @RequestMapping(value="signout")
	    public String signout_view() {
	        return "loginpage";
	    }

		@RequestMapping(value= "update/module/{trid}")
		public String updateModule(@PathVariable("trid") int trid,ModelMap map)
		{
			TrainingRequest request = new TrainingRequestDAO().getTrainingRequest(trid).get(0);
			map.addAttribute("command",request);
			String[] arr= {"herro","plswork","Java FSD"};
			map.put("trainingmodule",arr);
			return "updateModule";
		}
		@RequestMapping(value= "update/details/{trid}")
		public String updateDetails(@PathVariable("trid") int trid,ModelMap map)
		{
			TrainingRequest request = new TrainingRequestDAO().getTrainingRequest(trid).get(0);
			System.out.println(request.getTraining_request_id());

			map.addAttribute("command",request);
			return "updateDetails";
		}
		@RequestMapping(value= "update/date/{trid}")
		public String updateDate(@PathVariable("trid") int trid,ModelMap map)
		{
			TrainingRequest request = new TrainingRequestDAO().getTrainingRequest(trid).get(0);
			System.out.println(request.getTraining_request_id());

			map.addAttribute("command",request);
			return "updateDate";
		}
		@RequestMapping(value="updateNewDetail")
		public String updatewithNewModule(@ModelAttribute("trainingrequest") TrainingRequest request)
		{
			System.out.println(request.getTraining_request_id());
			new TrainingRequestDAO().updateTrainingRequest(request.getTraining_request_id(), request.getRequest_approx_participant(), request.getJustification_of_request());
			return "redirect:/alltraining";
		}
		@RequestMapping(value="updateNewModule")
		public String updatewithNewDate(@ModelAttribute("trainingrequest") TrainingRequest request)
		{
			System.out.println(request.getTraining_request_id());
			if(false==new TrainingRequestDAO().updateTrainingRequest(request.getTraining_request_id(), request.getRequest_training_type(), request.getRequest_training_module(), request.getRequest_training_module_scope(), request.getRequest_training_mode())){
				return "error";
			}
			return "redirect:/alltraining";
		}
		@RequestMapping(value="updateNewDate")
		public String updatewithNewDetail(@ModelAttribute("trainingrequest") TrainingRequest request)
		{
			System.out.println(request.getTraining_request_id());
			if (false==new TrainingRequestDAO().updateTrainingRequest(request.getTraining_request_id(), request.getRequest_start_date(), request.getRequest_end_date(), request.getRequest_location(), request.getRequest_time_zone())){
				return "error";
			}
			return "redirect:/alltraining";
		}
	    
	    
	@RequestMapping(value= "TrainingReq/")
	public String NewTraining(HttpServletRequest request, ModelMap model) {
		return "trainingrequest";
	}
	

	@RequestMapping(value= "TheChanger") // i need the mapping
	
	public String ChangePassword(HttpServletRequest request, ModelMap model) {
	
	    HttpSession session = request.getSession();
	    
	    String currpass = request.getParameter("currpass");
	    String storedpass = (String) session.getAttribute("password");
	    String pass1 = request.getParameter("password1");
	    String pass2 = request.getParameter("password2");
	
	    if (currpass.equals(storedpass)) {
		    SecurityCheck sc = new SecurityCheck();
		    sc.checkNewPassword((String)session.getAttribute("username"), pass1, pass2);
		
		    session.setAttribute("password", pass1);
		    return "redirect:/alltraining";
	    }
	    else {
	    	return "error";
	    }
	}*/
}
	
	