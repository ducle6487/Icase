package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.ColorModel;

public class ColorRowMapper implements RowMapper<ColorModel> {

    @Override
    public ColorModel mapRow(ResultSet rs, int rowNum) throws SQLException {

        ColorModel color = new ColorModel();
        color.setNamecolor(rs.getString("color"));
        return color;
    }

}
