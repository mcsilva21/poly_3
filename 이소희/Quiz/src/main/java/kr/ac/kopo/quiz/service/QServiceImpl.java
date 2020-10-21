package kr.ac.kopo.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.quiz.dao.QDao;
import kr.ac.kopo.quiz.model.Q;
import kr.ac.kopo.quiz.util.Pager;

@Service
public class QServiceImpl implements QService {
	
	@Autowired
	QDao dao;

	@Override
	public List<Q> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Q item) {
		dao.add(item);
	}
	
	@Override
	public Q item(int quizId) {
		return dao.item(quizId);
	}


	@Override
	public void update(Q item) {
		dao.update(item);

	}

	@Override
	public void delete(int quizId) {
		dao.delete(quizId);

	}

}
