package trm.pm.dbo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Spoc_ChartMapper implements RowMapper<Spoc_Chart>{

	
	@Override
		public Spoc_Chart mapRow(ResultSet rs, int arg1) throws SQLException {
			Spoc_Chart sc = new Spoc_Chart();
			
			sc.setFirstname(rs.getString(1));
			sc.setNo_trng(rs.getInt(2));
			return sc;
		
	}
	
}
