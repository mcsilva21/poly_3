package kr.ac.kopo.quiz.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.quiz.model.User;
import kr.ac.kopo.quiz.util.Pager;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	SqlSession sql;

	@Override
	public int total(Pager pager) {
		return sql.selectOne("user.total", pager);
	}

	@Override
	public List<User> list(Pager pager) {	
		return sql.selectList("user.list", pager);
	}

	@Override
	public void add(User item) {
		sql.insert("user.add", item);
		
	}

	@Override
	public User item(int userId) {
		return sql.selectOne("user.item", userId);
	}

	@Override
	public void update(User item) {
		sql.selectOne("user.update",item);
	}

	@Override
	public void delete(int userId) {
		sql.delete("user.delete", userId);	
	}

	@Override
	public User login(User item) {
		return sql.selectOne("user.login", item);
	}

	@Override
	public int checkId(String cid) {
		return sql.selectOne("user.checkId", cid);
	}

}
