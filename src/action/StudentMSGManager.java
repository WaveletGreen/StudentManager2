package action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;
import dao.impl.BaseDaoImpl;
import entity.Studentsystem;
import service.BaseService;
import util.Page;

@Service
public class StudentMSGManager extends ActionSupport {
	private Page page;
	private Studentsystem studentsystem;
	private BaseService service = null;
	private List<Studentsystem> studentList;

	public void setService(BaseService service) {
		this.service = service;
	}

	public BaseService getService() {
		return service;
	}

	public Studentsystem getStudentsystem() {
		return studentsystem;
	}

	public void setStudentsystem(Studentsystem studentsystem) {
		this.studentsystem = studentsystem;
	}

	public List<Studentsystem> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Studentsystem> studentList) {
		this.studentList = studentList;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String add() {
		return SUCCESS;
	}

	public String delete() {
		return SUCCESS;

	}

	public String update() {
		return SUCCESS;

	}

	public String getById() {
		return SUCCESS;

	}

	public String getByPage() {
		return SUCCESS;

	}
	public String say() {
		Studentsystem studentsystem = new Studentsystem();
		Studentsystem studentsystem2 = (Studentsystem) service.getById("Studentsystem", 2017020101);
		System.out.println("---------" + studentsystem2.getName());
		return SUCCESS;

	}
}
