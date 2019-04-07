package trm.vt.dao.trainingRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
public class TrainingRequestDAO {
    ApplicationContext context;
    static JdbcTemplate temp;
    
    public TrainingRequestDAO() {
        context = new ClassPathXmlApplicationContext("spring-config.xml");
        temp = (JdbcTemplate) context.getBean("db");
    }
    
    public int getTrainingRequestIdWithInternalTrainingRequestId(int internal_training_request_id) {
        
        String sql = "select itr.training_request_id from INTERNAL_TRAINING_REQUEST itr where itr.INTERNAL_TRAINING_ID = ?";
        
        int training_request_id = temp.queryForInt(sql, new Object[] {internal_training_request_id});
        
        return training_request_id;
    }
    
    public int getTrainingRequestIdWithDevelopTrainingRequestId(int dtt_training_id) {
        
        String sql = "select dttr.training_request_id from DEVELOP_TEAM_TRAINING_REQUEST dttr where dttr.DTT_TRAINING_ID = ?";
        
        int training_request_id = temp.queryForInt(sql, new Object[] {dtt_training_id});
        
        return training_request_id;
    }
    
    public int getTrainingRequestIdWithVendorTrainingRequestId(int vendor_training_request_id) {
        
        String sql = "select vtr.training_request_id from vendor_training_request vtr where vendor_training_request_id = ?";
        
        int training_request_id = temp.queryForInt(sql, new Object[] {vendor_training_request_id});
        
        return training_request_id;
    }
    
    public List<TrainingRequest> getAllTrainerDetail() {
        String sql = "select * from training_request";
        List<TrainingRequest> TrainingRequestList = temp.query(sql, new TrainingRequestMapper());
        return TrainingRequestList; 
    }
    public void insertTrainingRequest(int requester_id, String vertical, String request_training_type, String request_training_module, String request_training_module_scope, String request_training_mode, String request_start_date, String request_end_date, String request_location, String request_time_zone, int request_approx_participant, int request_project_spoc, String time_requested, String justification_of_request){
        
        String sql = "insert into training_request values(training_id_request_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        temp.update(sql, new Object[]{requester_id, vertical, request_training_type,request_training_module, request_training_module_scope, request_training_mode,request_start_date ,request_end_date, request_location,request_time_zone,request_approx_participant,request_project_spoc,time_requested,justification_of_request});
    }
    
    public void deleteTrainingRequest(int training_request_id){
        
        String sql = "delete from training_request where training_request_id = ?";
        
        temp.update(sql, new Object[]{training_request_id});
    }
    
    public void updateTrainingRequest(int training_request_id,int requester_id, String vertical, String request_training_type, String request_training_module, String request_training_module_scope, String request_training_mode, String request_start_date, String request_end_date, String request_location, String request_time_zone, int request_approx_participant, int request_project_spoc, String time_requested, String justification_of_request){
        
        String sql = "update training_request set requester_id = ?, vertical = ?, request_training_type = ?, request_training_module = ?, request_training_module_scope = ?, request_training_mode = ?, request_start_date = ?, request_end_date = ?, request_location = ?, request_time_zone = ?, request_approx_participant = ?, request_project_spoc = ?, time_requested = ?, justification_of_request = ? where training_request_id = ?";
        
        temp.update(sql, new Object[]{requester_id, vertical, request_training_type,request_training_module, request_training_module_scope, request_training_mode,request_start_date ,request_end_date, request_location,request_time_zone,request_approx_participant,request_project_spoc,time_requested,justification_of_request, training_request_id});
    }
    
    public TrainingRequest getTrainingRequest(int training_request_id){
        
        String sql = "select * from training_request where training_request_id = ?";
        
        List<TrainingRequest> tr = temp.query(sql, new Object[]{training_request_id}, new TrainingRequestMapper());
        
        return tr.get(0);
    }
    public static List<String> allTrainingRequestIdstring(List<TrainingRequest> trainingList){
        List<String> trainingList2 = new ArrayList<String>();
        for(int i =0; i < trainingList.size(); i++){
            trainingList2.add(Integer.toString(trainingList.get(i).getTraining_request_id()));
        }
        return trainingList2;
    }
    
    public static String[] arrayListToList(List<String> list){
        String[] trainList = list.toArray(new String[list.size()]);
        return trainList;
    }
    
    public static String[] arrayOfTrainingReqID(){
        String sql = "select * from training_request";
        List<TrainingRequest> data; 
        data = temp.query(sql, 
                new TrainingRequestMapper());
        
        return arrayListToList(allTrainingRequestIdstring(data)); 
    }
    
    
    public static String toJavascriptArray(String[] arr){
        
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        for(int i=0; i<arr.length; i++){
            sb.append("\"").append(arr[i]).append("\"");
            if(i+1 < arr.length){
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
    
    public static void insertTrainingToFiles(){
        File file = new File("C:/Users/syntel/workspace/StringMVCCore/src/allTrainingReq.txt");
        try {
            String strToWrite = toJavascriptArray(arrayOfTrainingReqID());
            FileWriter fileWriter = new FileWriter(file);
            fileWriter.write(strToWrite);
            fileWriter.flush();
            fileWriter.close();
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    
    public static String readAndReturn() throws IOException{
         FileReader fileReader;
        try {
            fileReader = new FileReader("C:\\Users\\syntel\\git\\Vendor_Training_Management_repo\\src");
              String fileContents = "";
              int i ;
              while((i =  fileReader.read())!=-1){
                  char ch = (char)i;
                  fileContents = fileContents + ch; 
              }
              System.out.println(fileContents);
              return fileContents;
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
            
        }
}