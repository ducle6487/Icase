package edu.hutech.Icase.Mapper;

import java.sql.SQLException;
import java.sql.ResultSet;
import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.ImageModel;

public class ImageMapper implements RowMapper<ImageModel>{
	@Override
    public ImageModel mapRow(ResultSet rs, int rownum) throws SQLException {

		ImageModel img = new ImageModel();
		img.setIdimage(rs.getInt("idimage"));
		img.setName(rs.getString("name"));
		img.setIdproduct(rs.getInt("idproduct"));
        return img;
    }
}
