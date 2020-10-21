package kr.ac.kopo.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.quiz.dao.UserDao;
import kr.ac.kopo.quiz.model.User;
import kr.ac.kopo.quiz.util.Pager;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao dao;
	
	@Override
	public List<User> list(Pager pager){
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}
	
	@Override
	public void add(User item) {
		dao.add(item);
	}
	
	@Override
	public User item(int userId) {
		return dao.item(userId);
	}
	
	@Override
	public void update(User item) {
		dao.update(item);
	}
	
	@Override
	public void delete(int userId) {
		dao.delete(userId);
	}	
		
	@Override
	public boolean login(User item) {
		User user = dao.login(item);
		if(user == null)
			return false;
		
		
		item.setId(user.getId());
		item.setPw(user.getPw());
		
		return true;
	}
	@Override
	public int checkId(String cid) {
		return dao.checkId(cid);
	
	}

}
