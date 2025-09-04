package dao;

import java.util.List;

import entity.Category;

public interface ICategoryDAO {
	Category findById(int id);
	List<Category> findAll();
	void update(Category category);
	void delete(int id);
	void create(Category category);
}
