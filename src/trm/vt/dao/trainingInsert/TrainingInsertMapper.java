package trm.vt.dao.trainingInsert;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class TrainingInsertMapper implements RowMapper<TrainingInsert>{
	
	@Override
	public TrainingInsert mapRow(ResultSet result, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		TrainingInsert ti = new TrainingInsert();
		ti.setEmployee_id(result.getInt(1));
		ti.setTraining_session_id(result.getInt(2));
		ti.setFirst_name(result.getString(3));
		ti.setLast_name(result.getString(4));
		ti.setEmail(result.getString(5));
		ti.setPhone_number(result.getString(6));
		return ti;
	}

}
