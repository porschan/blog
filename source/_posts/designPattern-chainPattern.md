---
title: 设计模式 - 责任链模式
date: 2019-05-12 11:24:51
---

### 感想 ###

责任链模式：如果有多个对象都有机会处理请求，责任链可使请求的发送者和接收者解耦，请求沿着责任链传递，直到有一个对象处理了它为止。

责任链模式的优点：

- 将请求的发送者和接收者解耦，使多个对象都有机会处理这个请求。
- 可以简化对象，因为它无须知道链的结构。
- 可以动态地添加或删减处理请求的链结构。

责任链模式的缺点：

- 请求从链的开头进行遍历，对性能有一定的损耗。
- 并不保证请求一定被处理。

> 以下例子引用了磊_lei的例子：[Java 设计模式(17) —— 责任链模式](https://www.jianshu.com/p/6b427ec25dcb)

a.定义采购对象：

```java
public class PurchaseRequest {
    private int Type = 0;
    private int Number = 0;
    private float Price = 0;
    private int ID = 0;

    public PurchaseRequest(int Type, int Number, float Price) {
        this.Type = Type;
        this.Number = Number;
        this.Price = Price;
    }

    public int GetType() {
        return Type;
    }

    public float GetSum() {
        return Number * Price;
    }

    public int GetID() {
        return (int) (Math.random() * 1000);
    }
}
```

b.定义决策者的抽象类：

```java
public abstract class Approver {
    Approver successor;
    String Name;

    public Approver(String Name) {
        this.Name = Name;
    }

    public abstract void ProcessRequest(PurchaseRequest request);

    public void SetSuccessor(Approver successor) {
        this.successor = successor;
    }
}
```

c1.各决策者在自己的责任范围内实现责任方法，组长：

```java
public class GroupApprover extends Approver {

    public GroupApprover(String Name) {
        super(Name + " GroupLeader");
    }

    @Override
    public void ProcessRequest(PurchaseRequest request) {

        if (request.GetSum() < 5000) {
            System.out.println("**This request " + request.GetID()
                    + " will be handled by "
                    + this.Name + " **");
        } else {
            successor.ProcessRequest(request);
        }
    }

}
```
c2.部门经理：

```java
public class DepartmentApprover extends Approver {

    public DepartmentApprover(String Name) {
        super(Name + " DepartmentLeader");

    }

    @Override
    public void ProcessRequest(PurchaseRequest request) {

        if ((5000 <= request.GetSum()) && (request.GetSum() < 10000)) {
            System.out.println("**This request " + request.GetID() + " will be handled by " + this.Name + " **");
        } else {
            successor.ProcessRequest(request);
        }

    }

}
```
c3.副经理：

```java
public class VicePresidentApprover extends Approver {

    public VicePresidentApprover(String Name) {
        super(Name + " Vice President");
    }

    @Override
    public void ProcessRequest(PurchaseRequest request) {
        if ((10000 <= request.GetSum()) && (request.GetSum() < 50000)) {
            System.out.println("**This request " + request.GetID()
                    + " will be handled by " + this.Name + " **");
        } else {
            successor.ProcessRequest(request);
        }
    }

}
```

c4.经理：

```java
public class PurchaseRequest {
    private int Type = 0;
    private int Number = 0;
    private float Price = 0;
    private int ID = 0;

    public PurchaseRequest(int Type, int Number, float Price) {
        this.Type = Type;
        this.Number = Number;
        this.Price = Price;
    }

    public int GetType() {
        return Type;
    }

    public float GetSum() {
        return Number * Price;
    }

    public int GetID() {
        return (int) (Math.random() * 1000);
    }
}
```

d.定义一个客户：

```java
public class Client {

    public Client() {

    }

    public PurchaseRequest sendRequst(int Type, int Number, float Price) {
        return new PurchaseRequest(Type, Number, Price);
    }

}
```

e.客户端使用：
```java
public class App {

    public static void main(String[] args) {

        Client mClient = new Client();
        Approver GroupLeader = new GroupApprover("Tom");
        Approver DepartmentLeader = new DepartmentApprover("Jerry");
        Approver VicePresident = new VicePresidentApprover("Kate");
        Approver President = new PresidentApprover("Bush");

        //形成一个责任链的闭环
        GroupLeader.SetSuccessor(DepartmentLeader);
        DepartmentLeader.SetSuccessor(VicePresident);
        VicePresident.SetSuccessor(President);
        President.SetSuccessor(GroupLeader);

        GroupLeader.ProcessRequest(mClient.sendRequst(1, 100, 40));
        GroupLeader.ProcessRequest(mClient.sendRequst(2, 200, 40));
        GroupLeader.ProcessRequest(mClient.sendRequst(3, 300, 40));
        GroupLeader.ProcessRequest(mClient.sendRequst(4, 400, 140));

    }
}
```