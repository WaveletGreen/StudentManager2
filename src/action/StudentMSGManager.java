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
		boolean ctl = true;
		if (studentsystem != null) {
			if (studentsystem.getName() == null) {
				addFieldError("nameError", "名字不能为空");
				ctl = false;
			} else if (studentsystem.getGrade() == null) {
				addFieldError("gradeError", "年级不能为空");
				ctl = false;
			} else if (studentsystem.getMajor() == null) {
				addFieldError("majorError", "专业不能为空");
				ctl = false;
			} else if (studentsystem.getAddress() == null) {
				addFieldError("addressError", "地址能为空");
				ctl = false;
			} else if (studentsystem.getName() == null) {
				addFieldError("nameError", "名字能为空");
				ctl = false;
			}
			if (ctl)
				return service.add(studentsystem);
			else {
				return INPUT;
			}
		}
		return ERROR;
	}

	public String delete() {
		if (studentsystem != null && studentsystem.getSid() != null) {
			studentsystem = (Studentsystem) service.getById(studentsystem, studentsystem.getSid());
			service.delet(studentsystem);
			return SUCCESS;
		}
		return ERROR;
	}

	public String update() {
		return SUCCESS;

	}

	public String getById() {
		return SUCCESS;

	}

	public String getByPage() {
		this.page.setStart(0);
		this.page.setMaxResult(5);
		studentList = service.getByPage("Studentsystem", page);
		return SUCCESS;
	}

	public String say() {
		Studentsystem studentsystem = new Studentsystem();
		this.page.setStart(0);
		this.page.setMaxResult(5);
		studentList = service.getByPage("Studentsystem", page);
		for (Studentsystem s : studentList) {
			System.out.println("---------" + s.getName());
		}
		return SUCCESS;

	}
}
