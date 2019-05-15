---
title: 设计模式 - 中介者模式
date: 2019-05-15 09:21:21
---

### 感想 ###

中介者模式：用一个中介对象来封装一系列的对象交互。

中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以对立地改变它们之间的交互。

中介者模式的优点：
- 通过将对象彼此解耦，可以增加对象的复合性。
- 通过将控制逻辑集中，可以简化系统维护。
- 可以让对象之间所传递的消息变得简单而且大幅减少。
- 提高系统的灵活性，使得系统易于扩展和维护。

中介者模式的缺点：
- 中介者承当了较多的责任，一旦中介者出现了问题，整个系统就会受到影响。
- 如果设计不当，中介者对象变得过于复杂。

以下例子以智慧房屋公司的产品为例子：

a.定义抽象的调度者：

```java
public abstract class Colleague {
	private Mediator mediator;
	public String name;

	public Colleague(Mediator mediator, String name) {

		this.mediator = mediator;
		this.name = name;

	}

	public Mediator GetMediator() {
		return this.mediator;
	}

	public abstract void SendMessage(int stateChange);
}
```

b1.实现调度者的警告器：

```java
public class Alarm extends Colleague {

    public Alarm(Mediator mediator, String name) {
        super(mediator, name);
        mediator.Register(name, this);
    }

    public void SendAlarm(int stateChange) {
        SendMessage(stateChange);
    }

    @Override
    public void SendMessage(int stateChange) {
        this.GetMediator().GetMessage(stateChange, this.name);
    }
}
```

b2.实现调度者的咖啡机：

```java
public class CoffeeMachine extends Colleague {

	public CoffeeMachine(Mediator mediator, String name) {
		super(mediator, name);
		mediator.Register(name, this);
	}

	@Override
	public void SendMessage(int stateChange) {
		this.GetMediator().GetMessage(stateChange, this.name);
	}

	public void StartCoffee() {
		System.out.println("It's time to startcoffee!");
	}

	public void FinishCoffee() {

		System.out.println("After 5 minutes!");
		System.out.println("Coffee is ok!");
		SendMessage(0);
	}
}
```

b3.实现调度者的窗帘：

```java
public class Curtains extends Colleague {

	public Curtains(Mediator mediator, String name) {
		super(mediator, name);
		mediator.Register(name, this);
	}

	@Override
	public void SendMessage(int stateChange) {
		this.GetMediator().GetMessage(stateChange, this.name);
	}

	public void UpCurtains() {
		System.out.println("I am holding Up Curtains!");
	}
}
```

b4.实现调度者的电视：

```java
public class TV extends Colleague {

    public TV(Mediator mediator, String name) {
        super(mediator, name);
        mediator.Register(name, this);
    }

    @Override
    public void SendMessage(int stateChange) {
        this.GetMediator().GetMessage(stateChange, this.name);
    }

    public void StartTv() {
        System.out.println("It's time to StartTv!");
    }

    public void StopTv() {
        System.out.println("StopTv!");
    }
}
```

c.定义一个抽象的调度中心：

```java
public interface Mediator {
	public abstract void Register(String colleagueName, Colleague colleague);

	public abstract void GetMessage(int stateChange, String colleagueName);

	public abstract void SendMessage();
}
```

d.实现调度中心：

```java
public class ConcreteMediator implements Mediator {
    private HashMap<String, Colleague> colleagueMap;
    private HashMap<String, String> interMap;

    public ConcreteMediator() {
        colleagueMap = new HashMap<String, Colleague>();
        interMap = new HashMap<String, String>();
    }

    @Override
    public void Register(String colleagueName, Colleague colleague) {

        colleagueMap.put(colleagueName, colleague);

        if (colleague instanceof Alarm) {
            interMap.put("Alarm", colleagueName);
        } else if (colleague instanceof CoffeeMachine) {
            interMap.put("CoffeeMachine", colleagueName);
        } else if (colleague instanceof TV) {
            interMap.put("TV", colleagueName);
        } else if (colleague instanceof Curtains) {
            interMap.put("Curtains", colleagueName);
        }

    }

    @Override
    public void GetMessage(int stateChange, String colleagueName) {

        if (colleagueMap.get(colleagueName) instanceof Alarm) {
            if (stateChange == 0) {
                ((CoffeeMachine) (colleagueMap.get(interMap.get("CoffeeMachine")))).StartCoffee();
                ((TV) (colleagueMap.get(interMap.get("TV")))).StartTv();
            } else if (stateChange == 1) {
                ((TV) (colleagueMap.get(interMap.get("TV")))).StopTv();
            }

        } else if (colleagueMap.get(colleagueName) instanceof CoffeeMachine) {
            ((Curtains) (colleagueMap.get(interMap.get("Curtains")))).UpCurtains();
        } else if (colleagueMap.get(colleagueName) instanceof TV) {

        } else if (colleagueMap.get(colleagueName) instanceof Curtains) {

        }

    }

    @Override
    public void SendMessage() {

    }
}
```

e.客户端测试：

```java
public class App {

	public static void main(String[] args) {
		Mediator mediator = new ConcreteMediator();

		Alarm mAlarm = new Alarm(mediator, "mAlarm");
		CoffeeMachine mCoffeeMachine = new CoffeeMachine(mediator,"mCoffeeMachine");
		Curtains mCurtains = new Curtains(mediator,"mCurtains");
		TV mTV = new TV(mediator, "mTV");

		mAlarm.SendAlarm(0);
		mCoffeeMachine.FinishCoffee();
		mAlarm.SendAlarm(1);
	}

}
```