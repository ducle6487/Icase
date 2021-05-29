package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.NewsModel;


public class NewsMapper implements RowMapper<NewsModel>{
	 @Override
	    public NewsModel mapRow(ResultSet rs, int rowNum) throws SQLException {

		 	NewsModel news = new NewsModel();
	        news.setIdNews(rs.getInt("IdNews"));
	        news.setHeader(rs.getString("Header"));
	        news.setThumnail(rs.getString("Thumnail"));
	        news.setDetail(rs.getString("Detail"));
	        return news;
	    }
}
