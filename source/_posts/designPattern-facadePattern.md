---
title: 设计模式 - 外观模式
date: 2019-05-04 14:40:27
---

### 感想 ###

外观模式：提供一个统一的接口，来访问子系统中一群功能相关接口。外观模式定义了一个高层接口，让子系统更容易使用。

> 以下例子引用了HappyCorn的例子：[设计模式总结篇系列：外观模式（Facade）](https://www.cnblogs.com/lwbqqyumidi/p/3754251.html)

行政审批接口:

```java
interface Executive{
    public void approve();
}
```

卫生局类的定义：
```java
class HealthOffice implements Executive{

    @Override
    public void approve() {
        System.out.println("卫生局通过审批");
    }
}
```

税务局类的定义：
```java
class RevenueOffice implements Executive{

    @Override
    public void approve() {
        System.out.println("税务局完成登记，定时回去收税");
    }
}
```

工商局类的定义：
```java
class SaicOffice implements Executive{

    @Override
    public void approve() {
        System.out.println("工商局完成审核，办法营业执照");
    }
}
```

客户端:
```java
public class FacadeTest {

    public static void main(String[] args) {
        System.out.println("开始办理行政手续...");

        HealthOffice ho = new HealthOffice();
        RevenueOffice ro = new RevenueOffice();
        SaicOffice so = new SaicOffice();

        ho.approve();
        ro.approve();
        so.approve();

        System.out.println("行政手续终于办完了");
    }
}
```

将改为外观设计模式如下，定义一个外观类：
```java
class ApproveFacade {

    public ApproveFacade() {

    }

    public void wholeApprove() {
        new HealthOffice().approve();
        new RevenueOffice().approve();
        new SaicOffice().approve();
    }

}
```

客户端使用：
```java
public class FacadeTest {

    public static void main(String[] args) {
        System.out.println("开始办理行政手续...");

        ApproveFacade af = new ApproveFacade();
        af.wholeApprove();

        System.out.println("行政手续终于办完了");
    }

}
```

外观模式的目的不是给予子系统添加新的功能接口，而是为了让外部减少与子系统内多个模块的交互，松散耦合，从而让外部能够更简单地使用子系统。

外观模式的本质是：封装交互，简化调用。

#### 最少知识原则

- 最少知识原则的意义：尽量减少对象之间的交互，只留几个“密友”，项目设计中就是不要让太多的类耦合在一起。
- 如何遵循最少知识原则？对象的方法调用范围：该对象本身；作为参数传进来的对象；该方法创建和实例化的对象；对象的组件。

从网上看到的一句话适合在最少知识原则下使用：

一个简单例子是，人可以命令一条狗行走（walk），但是不应该直接指挥狗的腿行走，应该由狗去指挥控制它的腿如何行走。

