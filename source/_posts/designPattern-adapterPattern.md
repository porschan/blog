---
title: 设计模式 - 设配器模式
date: 2019-04-29 19:59:17
---

### 感想 ###

这里主要有2种适配器模式：

1. 类适配器模式
2. 对象适配器模式

适配器模式：将一个类的接口转换成另一种接口，让原本接口不兼容的类可以兼容。

> 以下例子引用了ai-exception在csdn上面的例子：[适配器模式之类适配器与对象适配器的区别及代码实现](https://blog.csdn.net/qq_36982160/article/details/79965027)

#### 类适配器模式

类适配器模式：通过多重继承目标接口和被适配者类方法来实现适配。

多重继承，其中继承的目标接口部分达到适配目的，而继承被适配者类的部分达到通过调用被适配者里面的方法来实现目标接口的功能。

```java
// 已存在的、具有特殊功能、但不符合我们既有的标准接口的类
class Adaptee {
	public void specificRequest() {
		System.out.println("被适配类 具有特殊功能...");
	}
}

// 目标接口，或称为标准接口
interface Target {
	public void request();
}

// 具体目标类，只提供普通功能
class ConcreteTarget implements Target {
	public void request() {
		System.out.println("普通类 具有普通功能...");
	}
}

// 适配器类，继承了被适配类，同时实现标准接口
class Adapter extends Adaptee implements Target{
	public void request() {
		super.specificRequest();
	}
}

// 测试类
public class Client {
	public static void main(String[] args) {
		// 使用普通功能类
		Target concreteTarget = new ConcreteTarget();//实例化一个普通类
		concreteTarget.request();

		// 使用特殊功能类，即适配类
		Target adapter = new Adapter();
		adapter.request();
	}
}
```

虽然Java不支持多重继承，但是使用接口的方式能实现类似多重继承的功能。

#### 对象适配器模式

不使用多继承或继承的方式，而是使用直接关联，或者称为委托的方式。

```java
// 适配器类，直接关联被适配类，同时实现标准接口
class Adapter implements Target{
	// 直接关联被适配类
	private Adaptee adaptee;

	// 可以通过构造函数传入具体需要适配的被适配类对象
	public Adapter (Adaptee adaptee) {
		this.adaptee = adaptee;
	}

	public void request() {
		// 这里是使用委托的方式完成特殊功能
		this.adaptee.specificRequest();
	}
}

// 测试类
public class Client {
	public static void main(String[] args) {
		// 使用普通功能类
		Target concreteTarget = new ConcreteTarget();
		concreteTarget.request();

		// 使用特殊功能类，即适配类，
		// 需要先创建一个被适配类的对象作为参数
		Target adapter = new Adapter(new Adaptee());
		adapter.request();
	}
}
```

对象适配器和类适配器使用了不同的方法实现适配，对象适配器使用组合，类适配器使用了继承。

实际开发中，使用对象适配器模式较多。