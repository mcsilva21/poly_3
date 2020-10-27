package kr.ac.kopo.quiz.dao;

import java.util.List;

import kr.ac.kopo.quiz.model.User;
import kr.ac.kopo.quiz.util.Pager;

public interface UserDao {

	int total(Pager pager);

	List<User> list(Pager pager);

	void add(User item);

	User item(int userId);

	void update(User item);

	void delete(int userId);

	User login(User item);

	int checkId(String cid);


}
