package trm.pm.dbo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class chartPartsMapper implements RowMapper<chartParts>{

	@Override
	public chartParts mapRow(ResultSet rs, int arg1) throws SQLException {
		chartParts cp = new chartParts();
		cp.setRequest_approx_participant(rs.getInt(1));
		cp.setRequest_training_module(rs.getString(2));
		return cp;
	}

}
