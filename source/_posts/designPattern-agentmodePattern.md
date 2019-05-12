---
title: 设计模式 - 代理模式
date: 2019-05-07 09:51:31
---

### 感想 ###

代理模式：为一个对象提供一个替身，以控制对这个对象的访问。被代理的对象可以使远程对象，创建开销搭的对象或需要安全控制的对象。代理模式有很多变体，都是为了控制与管理对象访问。

常见的代理模式有：

- 虚拟代理（虚拟代理为创建开销大的对象提供代理服务，真正的对象在创建前和创建中，由虚拟代理来扮演替身）
- 动态代理（运行时动态的创建代理类，并将方法调用转发到指定类）
- 保护代理
- 几种变体（防火墙代理、缓存代理、智能引用代理、同步代理和写入是复制代理）

简单的代理模式如下：

> 以下例子引用了道IT的例子：[JAVA设计模式1——代理模式](http://baijiahao.baidu.com/s?id=1600517412535081479&wfr=spider&for=pc)

a.创建一个理财的接口：

```java
/**
 * 理财
 */
public interface ManageMoney {
	public void financing();
}
```

b.创建一个理财的场所，比如现实中的上交所：

```java
/**
 * 上交所
 */
public class TradeStock implements ManageMoney{

	@Override
	public void financing() {
		trade();
	}

	private boolean hasExperience;

	public TradeStock(){

	}

	public TradeStock(boolean hasExperience){
		this.hasExperience = hasExperience;
	}

	private void trade() {
		if(hasExperience){
			System.out.println("上交所：您可以买股票了");
		}else{
			System.out.println("上交所：请学会股票知识再来买吧");
		}
	}
}
```

c.实现一个有理财的理财经理：

```java
public class FinancialManager implements ManageMoney {

	private TradeStock tradeStock;

	public FinancialManager(){
		tradeStock = new TradeStock(true);
	}

	@Override
	public void financing() {
		System.out.println("理财经理：开始炒股");
		tradeStock.financing();
	}
}
```

d.客户端使用：

```java
public class App {
	public static void main(String[] args) {
		System.out.println("我：要理财，对炒股不太懂");
		ManageMoney manageMoney = new FinancialManager();
		System.out.println("我：找一个理财经理吧，更加方便");
		manageMoney.financing();
		System.out.println("我等着收钱就好了");
		System.out.println("=======================");
		System.out.println("我：我不懂，但是想自己炒股试试");
		TradeStock managenMoneyOwn = new TradeStock();
		managenMoneyOwn.financing();
	}
}
```

客户端的输出结果：
```
    我：要理财，对炒股不太懂
    我：找一个理财经理吧，更加方便
    理财经理：开始炒股
    上交所：您可以买股票了
    我等着收钱就好了
    =======================
    我：我不懂，但是想自己炒股试试
    上交所：请学会股票知识再来买吧
```

这里是就有一个问题，如果我是跨应用，且有可能不在本地，那怎么访问到这个代理呢？这时候，远程代理模式就能适合这个场景，Java中有RMI就能实现。

远程代理：远程对象的本地代表，通过它可以让远程对象当本地对象来调用。远程代理通过网络和真正的远程对象沟通信息。

拓展：Java的RMI

RM I远程方法调用是计算机之间通过网络实现对象调用的一种通讯机制。

使用这种机制，一台计算机上的对象可以调用另外 一台计算机上的对象来获取远
程数据。

在过去，TCP/IP通讯是远程通讯的主要手段，面向过程的开发。

而RPC使程序员更容易地调用远程程序，但在面对复杂的信息传讯时，RPC依然
未能很好的支持。

RM I被设计成一种面向对象开发方式，允许程序员使用远程对象来实现通信。

RMI的使用介绍：

制作远程接口：接口文件。

远程接口的实现：Service文件。

RM I服务端注册，开启服务。

RM I代理端通过RM I查询到服务端，建立联系，通过接口调用远程方法。

一个简单使用RMI的例子：

a.制作远程接口：接口文件：

```java
public interface MyRemote extends Remote{

	public String sayHello() throws RemoteException;

}
```
b.远程接口的实现：Service文件 & RM I服务端注册，开启服务:

```java
@SuppressWarnings("serial")
public class MyRemoteImpl extends UnicastRemoteObject implements MyRemote{

	protected MyRemoteImpl() throws RemoteException {
		super();
	}

	@Override
	public String sayHello() throws RemoteException {
		return "Hello World!";
	}

	public static void main(String[] args) {

		try {
			MyRemote service=new MyRemoteImpl();
			LocateRegistry.createRegistry(6600);
			Naming.rebind("rmi://127.0.0.1:6600/RemoteHello", service);
			System.out.println("Success.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println( e.toString());
		}
	}
}
```

c.RM I代理端通过RM I查询到服务端，建立联系，通过接口调用远程方法：

```java
public class MyRemoteClient {

	public static void main(String[] args) {
		new MyRemoteClient().go();
	}

	public void go() {
		try {
			MyRemote service = (MyRemote) Naming.lookup("rmi://127.0.0.1:6600/RemoteHello");
			String s = service.sayHello();
			System.out.println(s);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
```

d.测试结果：
```
Hello World!
```