---
title: 设计模式 - 状态模式
date: 2019-05-06 15:33:25
---

### 感想 ###

状态模式：能根据内部状态的变化，改变对象的行为，看起来好像修改了类。

以下使用了日常中糖果机的例子，从糖果机准备完成，到投入硬币，机器判断是否中奖了，若中奖，多分发一颗，相反按照普通一颗计算，到最后重新判断糖果机的状态（售罄状态或准备状态）。

a.定义状态：

```java
public interface State {
    public void insertCoin();
    public void returnCoin();
    public void turnCrank();
    public void dispense();
    public void printstate();
}
```

b1.实现投入硬币的状态：

```java
public class HasCoin implements State {
    private CandyMachine mCandyMachine;

    public HasCoin(CandyMachine mCandyMachine) {
        this.mCandyMachine = mCandyMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("you can't insert another coin!");
    }

    @Override
    public void returnCoin() {
        System.out.println("coin return!");
        mCandyMachine.setState(mCandyMachine.mOnReadyState);
    }

    @Override
    public void turnCrank() {
        System.out.println("crank turn...!");
        Random ranwinner = new Random();
        int winner = ranwinner.nextInt(10);
        if (winner == 0) {
            mCandyMachine.setState(mCandyMachine.mWinnerState);
        } else {
            mCandyMachine.setState(mCandyMachine.mSoldState);
        }

    }

    @Override
    public void dispense() {
    }

    @Override
    public void printstate() {
        System.out.println("***HasCoin***");

    }

}
```

b2.实现准备状态：
```java
public class OnReadyState implements State {
	private CandyMachine mCandyMachine;

	public OnReadyState(CandyMachine mCandyMachine) {
		this.mCandyMachine = mCandyMachine;
	}

	@Override
	public void insertCoin() {
		System.out.println("you have inserted a coin,next,please turn crank!");
		mCandyMachine.setState(mCandyMachine.mHasCoin);
	}

	@Override
	public void returnCoin() {
		System.out.println("you haven't inserted a coin yet!");
	}

	@Override
	public void turnCrank() {
		System.out.println("you turned,but you haven't inserted a coin!");
	}

	@Override
	public void dispense() {
	}

	@Override
	public void printstate() {
		System.out.println("***OnReadyState***");

	}

}
```

b3.实现售罄状态：
```java
public class SoldOutState implements State {

    private CandyMachine mCandyMachine;

    public SoldOutState(CandyMachine mCandyMachine) {
        this.mCandyMachine = mCandyMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("you can't insert coin,the machine sold out!");

    }

    @Override
    public void returnCoin() {
        System.out.println("you can't return,you haven't inserted a coin yet!");

    }

    @Override
    public void turnCrank() {
        System.out.println("you turned,but there are no candies!");
    }

    @Override
    public void dispense() {
    }

    @Override
    public void printstate() {
        System.out.println("***SoldOutState***");

    }

}
```

b4.实现销售状态：
```java
public class SoldState implements State {
    private CandyMachine mCandyMachine;

    public SoldState(CandyMachine mCandyMachine) {
        this.mCandyMachine = mCandyMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("please wait!we are giving you a candy!");
    }

    @Override
    public void returnCoin() {
        System.out.println("you haven't inserted a coin yet!");
    }

    @Override
    public void turnCrank() {
        System.out.println("we are giving you a candy,turning another get nothing,!");
    }

    @Override
    public void dispense() {
        mCandyMachine.releaseCandy();
        if (mCandyMachine.getCount() > 0) {
            mCandyMachine.setState(mCandyMachine.mOnReadyState);
        } else {
            System.out.println("Oo,out of candies");
            mCandyMachine.setState(mCandyMachine.mSoldOutState);
        }
    }

    @Override
    public void printstate() {
        System.out.println("***SoldState***");

    }

}
```

b5.实现中奖状态：
```java
public class WinnerState implements State {

    private CandyMachine mCandyMachine;

    public WinnerState(CandyMachine mCandyMachine) {
        this.mCandyMachine = mCandyMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("please wait!we are giving you a candy!");
    }

    @Override
    public void returnCoin() {
        System.out.println("you haven't inserted a coin yet!");
    }

    @Override
    public void turnCrank() {
        System.out.println("we are giving you a candy,turning another get nothing,!");

    }

    @Override
    public void dispense() {
        mCandyMachine.releaseCandy();
        if (mCandyMachine.getCount() == 0) {
            mCandyMachine.setState(mCandyMachine.mSoldOutState);
        } else {
            System.out.println("you are a winner!you get another candy!");
            mCandyMachine.releaseCandy();
            if (mCandyMachine.getCount() > 0) {
                mCandyMachine.setState(mCandyMachine.mOnReadyState);
            } else {
                System.out.println("Oo,out of candies");
                mCandyMachine.setState(mCandyMachine.mSoldOutState);
            }
        }

    }

    @Override
    public void printstate() {
        System.out.println("***WinnerState***");

    }

}
```

c.将状态封装到糖果机对象：
```java
public class CandyMachine {

    State mSoldOutState;
    State mOnReadyState;
    State mHasCoin;
    State mSoldState;
    State mWinnerState;
    private State state;
    private int count = 0;

    public CandyMachine(int count) {
        this.count = count;
        mSoldOutState = new SoldOutState(this);
        mOnReadyState = new OnReadyState(this);
        mHasCoin = new HasCoin(this);
        mSoldState = new SoldState(this);
        mWinnerState = new WinnerState(this);
        if (count > 0) {
            state = mOnReadyState;
        } else {
            state = mSoldOutState;
        }
    }

    public void setState(State state) {
        this.state = state;
    }

    public void insertCoin() {
        state.insertCoin();
    }

    public void returnCoin() {
        state.returnCoin();
    }

    public void turnCrank() {
        state.turnCrank();
        state.dispense();
    }

    void releaseCandy() {
        if (count > 0) {
            count = count - 1;
            System.out.println("a candy rolling out!");
        }
    }

    public int getCount() {
        return count;
    }

    public void printstate() {
        state.printstate();
    }
}
```

d.客户端测试：
```java
public class MainTest {
    public static void main(String[] args) {
        CandyMachine mCandyMachine = new CandyMachine(6);

        mCandyMachine.printstate();

        mCandyMachine.insertCoin();
        mCandyMachine.printstate();
        mCandyMachine.turnCrank();
        mCandyMachine.printstate();

        mCandyMachine.insertCoin();
        mCandyMachine.printstate();
        mCandyMachine.turnCrank();
        mCandyMachine.printstate();
    }
}
```