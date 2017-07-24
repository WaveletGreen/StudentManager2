package service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import dao.BaseDao;
import service.BaseService;
import util.Page;

/**
 * 基础服务层
 * 
 * @author Administrator
 *
 */
@Service
@SuppressWarnings(value = { "rawtypes", "unchecked" })
public class BaseServiceImpl<T> implements BaseService<T> {
	// dao实例使用注入方式
	private BaseDao dao;

	// 用于注入使用
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public String add(T t) {
		return dao.add(t);
	}

	@Override
	public String delet(T t) {
		return dao.delet(t);
	}

	@Override
	public String update(T t) {
		return dao.update(t);
	}

	@Override
	public T getById(T t, int id) {
		return (T) dao.getById(t, id);
	}

	@Override
	public List<T> getByPage(T t, Page page) {
		return dao.getByPage(t, page);
	}

}
