package kr.ac.kopo.bookshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.bookshop.model.Review;

@Repository
public class ReivewDaoImpl implements ReviewDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Review> list(int bookid) {
		return sql.selectList("review.list", bookid);
	}

	@Override
	public void add(Review item) {
		sql.insert("review.add", item);
	}

	@Override
	public Review item(int reviewid) {
		return sql.selectOne("review.item", reviewid);
	}

	@Override
	public void update(Review item) {
		sql.update("review.update", item);

	}

	@Override
	public void delete(int reviewid, int custid) {
		/*
		Review review = new Review();
		
		review.setReviewid(reviewid);
		review.setReviewid(custid);
		
		sql.delete("review.delete",custid);

	}*/
		HashMap<String, Integer> map = new HashMap<>();
		map.put("revieid", reviewid);
		map.put("custid", custid);
		
		map.get("reviewid");
		
		sql.delete("review.delete", map);
	}
}
