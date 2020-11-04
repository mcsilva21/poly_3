package kr.ac.kopo.polycms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.BoardMaster;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<BoardMaster> list() {
		return sql.selectList("board_master.list");
	}
	


	@Override
	public void add(BoardMaster item) {
		sql.insert("board_master.add",item);


	}

	@Override
	public void createBoard(BoardMaster item) {
		sql.update("board_master.create_board", item);


	}

	@Override
	public BoardMaster item(int board_id) {

		return sql.selectOne("board_master.item", board_id);
	}

	@Override
	public void update(BoardMaster item) {
		sql.update("board_master.update", item);


	}

	@Override
	public void delete(int board_id) {
		sql.delete("board_master.delete", board_id);


	}

	@Override
	public void removeBoard(int board_id) {
		sql.update("board_master.remove_board", board_id);


	}



}
