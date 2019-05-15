---
title: 设计模式 - 备忘录模式
date: 2019-05-15 09:57:02
---

### 感想

备忘录模式：在不破坏封装的前提下，存储构建对象的重要状态，从而可以在将来把对象还原到存储的那个状态。

备忘录模式的优点：
- 状态存储在外面，不和关键对象混在一起，者可以帮助维护内聚。
- 提供容易实现的恢复能力。
- 保持了关键对象的数据封装。

备忘录模式的缺点：
- 资源消耗上面备忘录对象会很昂贵。
- 存储和恢复状态的过程比较耗时。

以下例子以游戏进度保持的角度来设计：

a定义一个安全保护的接口：

```java
public interface MementoIF {

}
```

b1.定义游戏中一个游戏模式一的进度：

```java
import java.util.HashMap;

public class Originator {
	private HashMap<String, String> state;

	public Originator() {
		state = new HashMap();

	}

	public MementoIF createMemento() {
		return new Memento(state);
	}

	public void restoreMemento(MementoIF memento) {
		state = ((Memento) memento).getState();
	}

	public void showState() {
		System.out.println("now state:" + state.toString());
	}

	public void testState1() {
		state.put("blood", "500");
		state.put("progress", "gate1 end");
		state.put("enemy", "5");

	}

	public void testState2() {
		state.put("blood", "450");
		state.put("progress", "gate3 start");
		state.put("enemy", "3");

	}

	private class Memento implements MementoIF {

		private HashMap<String, String> state;

		private Memento(HashMap state) {
			this.state = new HashMap(state);
		}

		private HashMap getState() {
			return state;
		}

		private void setState(HashMap state) {
			this.state = state;
		}
	}
}
```

b2.定义游戏中一个游戏模式二的进度：

```java
import java.util.ArrayList;

public class Originator2 {
	private ArrayList<String> state;

	public Originator2() {
		state = new ArrayList<String>();
	}

	public MementoIF createMemento() {
		return new Memento(state);
	}

	public void restoreMemento(MementoIF memento) {
		state = ((Memento) memento).getState();
	}

	public void testState1() {
		state = new ArrayList<String>();
		state.add("blood:320");
		state.add("progress:gate2 mid");
		state.add("enemy:15");

	}

	public void testState2() {
		state = new ArrayList<String>();
		state.add("blood:230");
		state.add("progress:gate8 last");
		state.add("enemy:12");

	}

	public void showState() {
		System.out.println("now state:" + state.toString());
	}

	private class Memento implements MementoIF {

		private ArrayList<String> state;

		private Memento(ArrayList<String> state) {
			this.state = new ArrayList(state);
		}

		private ArrayList<String> getState() {
			return state;
		}

		private void setState(ArrayList<String> state) {
			this.state = state;
		}
	}

}
```

c.创建一个进度管理者：

```java
import java.util.HashMap;

public class MementoCaretaker {
	private HashMap<String, MementoIF> mementomap;

	public MementoCaretaker() {
		mementomap = new HashMap<String, MementoIF>();
	}

	public MementoIF retrieveMemento(String name) {
		return mementomap.get(name);
	}

	/**
	 * 备忘录赋值方法
	 */
	public void saveMemento(String name, MementoIF memento) {
		this.mementomap.put(name, memento);
	}
}
```

d.客户端使用：

```java
public class MainTest {

	public static void main(String[] args) {
		MementoCaretaker mMementoCaretaker = new MementoCaretaker();
		Originator mOriginator = new Originator();
		Originator2 mOriginator2 = new Originator2();
		
		System.out.println("*****Originator*****");
		mOriginator.testState1();
		mMementoCaretaker.saveMemento("Originator", mOriginator.createMemento());
		mOriginator.showState();
		mOriginator.testState2();
		mOriginator.showState();
		mOriginator.restoreMemento(mMementoCaretaker.retrieveMemento("Originator"));
		mOriginator.showState();

		System.out.println("*****Originator 2*****");
		mOriginator2.testState1();
		mOriginator2.showState();
		mMementoCaretaker.saveMemento("Originator2",mOriginator2.createMemento());
		mOriginator2.testState2();
		mOriginator2.showState();
		mOriginator2.restoreMemento(mMementoCaretaker.retrieveMemento("Originator2"));
		mOriginator2.showState();

		/*由于2个游戏模式的保存进度的结构不一致，所以这里会出现错误，因而达到不能相互切换还原进度*/
//		System.out.println("*****Originator&&Originator 2*****");
//		mOriginator.restoreMemento(mMementoCaretaker.retrieveMemento("Originator2"));
//		mOriginator.showState();

	}

}
```