---
title: 设计模式 - 组合模式
date: 2019-05-05 19:39:56
---

### 感想 ###

组合模式：将对象聚合成树形结构来表现“整体/部分”的层次结构。组合模式能让客户以一致的方式来处理个别对象以及对象组合，也就是我们可以忽略对象组合和个体对象之间的差别。

> 以下例子引用了川峰的例子：[组合模式](https://blog.csdn.net/lyabc123456/article/details/80415830)

a.创建抽象组件：

```java
/**
 * Component抽象组件：为组合中所有对象提供一个接口，不管是叶子对象还是组合对象。
 */
public abstract class Component {
	protected String name;

	public Component(String name) {
		this.name = name;
	}

	public abstract void operation();

	public void add(Component c) {
		throw new UnsupportedOperationException();
	}

	public void remove(Component c) {
		throw new UnsupportedOperationException();
	}

	public Component getChild(int i) {
		throw new UnsupportedOperationException();
	}

	public List<Component> getChildren() {
		return null;
	}
}
```

b.创建组合节点对象：

```java
/**
 * Composite组合节点对象：实现了Component的所有操作，并且持有子节点对象。
 */
public class Composite extends Component {

	private List<Component> components = new ArrayList<>();

	public Composite(String name) {
		super(name);
	}

	@Override
	public void operation() {
		System.out.println("组合节点"+name+"的操作");
		//调用所有子节点的操作
		for (Component component : components) {
			component.operation();
		}
	}

	@Override
	public void add(Component c) {
		components.add(c);
	}

	@Override
	public void remove(Component c) {
		components.remove(c);
	}

	@Override
	public Component getChild(int i) {
		return components.get(i);
	}

	@Override
	public List<Component> getChildren() {
		return components;
	}
}
```

c.创建叶节点对象：

```java
/**
 * Leaf叶节点对象：叶节点对象没有任何子节点，实现了Component中的某些操作。
 */
public class Leaf extends Component {

    public Leaf(String name) {
        super(name);
    }

    @Override
    public void operation() {
        System.out.println("叶节点"+name+"的操作");
    }

}
```

d.客户端使用：

```java
public class App {
    public static void main(String[] args) {
        //创建根节点对象
        Component component = new Composite("component");

        //创建两个组合节点对象
        Component composite1 = new Composite("composite1");
        Component composite2 = new Composite("composite2");

        //将两个组合节点对象添加到根节点
        component.add(composite1);
        component.add(composite2);

        //给第一个组合节点对象添加两个叶子节点
        Component leaf1 = new Leaf("leaf1");
        Component leaf2 = new Leaf("leaf2");
        composite1.add(leaf1);
        composite1.add(leaf2);

        //给第二个组合节点对象添加一个叶子节点和一个组合节点
        Component leaf3 = new Leaf("leaf3");
        Component composite3 = new Composite("composite3");
        composite2.add(leaf3);
        composite2.add(composite3);

        //给第二个组合节点下面的组合节点添加两个叶子节点
        Component leaf4 = new Leaf("leaf4");
        Component leaf5 = new Leaf("leaf5");
        composite3.add(leaf4);
        composite3.add(leaf5);

        //执行所有节点的操作
        component.operation();
    }
}
```