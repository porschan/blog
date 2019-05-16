---
title: 设计模式 - 访问者模式
date: 2019-05-16 11:15:38
---

### 感想

访问者模式：对于一组对象，在不改变数据结构的前提下，增加作用于这些数据元素新的功能。

访问者模式适用于数据结构相对稳定，它把数据结构和作用与其上的操作解耦，使得操作集合可以相对自由地演化。

访问者模式的优点：
- 复合单一职责原则。
- 扩展性良好。
- 有益于系统的管理和维护。

访问者模式的缺点：
- 增加新的元素类变得很困难。
- 破坏封装性。

a.创建一个访问者的接口，编写访问者需要做的动作，如统计补偿金：

```java
public interface Visitor {
	abstract public void Visit(Element element);
}
```

b.创建一个抽象对象并定义一个抽象的方法，传入的参数为上一接口对象：

```java
public abstract class Element {
	abstract public void Accept(Visitor visitor);
}
```

c.实现抽象对象：

```java
public class Employee extends Element {

	private String name;
	private float income;
	private int vacationDays;
	private int degree;

	public Employee(String name, float income, int vacationDays, int degree) {
		this.name = name;
		this.income = income;
		this.vacationDays = vacationDays;
		this.degree = degree;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setIncome(float income) {
		this.income = income;
	}

	public float getIncome() {
		return income;
	}

	public void setVacationDays(int vacationDays) {
		this.vacationDays = vacationDays;
	}

	public int getVacationDays() {
		return vacationDays;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public int getDegree() {
		return degree;
	}

	@Override
	public void Accept(Visitor visitor) {
		//计算补偿金
		visitor.Visit(this);
	}

}
```

d.实现这个访问者接口的对象：

```java
public class CompensationVisitor implements Visitor {

	@Override
	public void Visit(Element element) {
		Employee employee = ((Employee) element);

		System.out.println(employee.getName() + "'s Compensation is " + (employee.getDegree() * employee.getVacationDays() * 10));
	}

}
```

e.实现一个存储雇员的类：

```java
import java.util.HashMap;

public class Employees {
	private HashMap<String, Employee> employees;

	public Employees() {
		employees = new HashMap();
	}

	public void Attach(Employee employee) {
		employees.put(employee.getName(), employee);
	}

	public void Detach(Employee employee) {
		employees.remove(employee);
	}

	public Employee getEmployee(String name) {
		return employees.get(name);
	}

	public void Accept(Visitor visitor) {
		for (Employee e : employees.values()) {
			e.Accept(visitor);
		}
	}
}
```

f.客户端使用：

```java
public class MainTest {
	public static void main(String[] args) {
		Employees mEmployees = new Employees();

		mEmployees.Attach(new Employee("Tom", 4500, 8, 1));
		mEmployees.Attach(new Employee("Jerry", 6500, 10, 2));
		mEmployees.Attach(new Employee("Jack", 9600, 12, 3));

		mEmployees.Accept(new CompensationVisitor());

	}
}
```

*.将已经提前实现完成的接口内的方法的对象传入超类中的方法，并能将继承超类的实体对象强制转化为目标对象，从而将接口内的方法抽离出来。