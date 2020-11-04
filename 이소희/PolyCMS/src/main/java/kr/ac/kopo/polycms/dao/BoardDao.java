package kr.ac.kopo.polycms.dao;

import java.util.List;

import kr.ac.kopo.polycms.model.BoardMaster;

public interface BoardDao {

	void add(BoardMaster item);

	void createBoard(BoardMaster item);

	BoardMaster item(int board_id);

	void update(BoardMaster item);

	void delete(int board_id);

	void removeBoard(int board_id);

	List<BoardMaster> list();


}
