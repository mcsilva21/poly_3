package kr.ac.kopo.quiz.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.quiz.model.Q;
import kr.ac.kopo.quiz.util.Pager;

@Repository
public class QDaoImpl implements QDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public int total(Pager pager) {
		return sql.selectOne("q.total", pager);
	}

	@Override
	public List<Q> list(Pager pager) {
		return sql.selectList("q.list", pager);
	}

	@Override
	public void add(Q item) {
		sql.insert("q.add", item);
	}
	
	@Override
	public Q item(int quizId) {
		return sql.selectOne("q.item",quizId);
	}

	@Override
	public void update(Q item) {
		sql.selectOne("q.update",item);

	}

	@Override
	public void delete(int quizId) {
		sql.delete("q.delete", quizId);

	}

}
