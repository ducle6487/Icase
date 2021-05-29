package edu.hutech.Icase.Mapper;

import java.sql.SQLException;
import java.sql.ResultSet;
import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.PhoneBrandModel;

public class PhoneBrandMapper implements RowMapper<PhoneBrandModel>{
    @Override
    public PhoneBrandModel mapRow(ResultSet rs, int rownum) throws SQLException {

        PhoneBrandModel pb = new PhoneBrandModel();
        pb.setIdPhoneBrand(rs.getInt("idphonebrand"));
        pb.setName(rs.getString("name"));
        return pb;
    }
}
