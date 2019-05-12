---
title: 设计模式 - 桥接模式
date: 2019-05-09 12:02:02
---

### 感想 ###

桥接模式：将实现与抽象放在两个不同的类层次中，使两个层次可以对立改变。

桥接模式原理：系统有多维度角度分类时，而每一种分类又有可能变化，考虑使用桥接模式桥接的目的是分离抽象与实现，使抽象和实现可以对立变化。

这里以遥控器和电视都有可能需要拓展为例子：

a.先定义遥控器的接口：

```java
public interface Control {

    public void On();

    public void Off();

    public void setChannel(int ch);

    public void setVolume(int vol);

}
```

b1.实现遥控器接口，并形成不同牌子的遥控器实体类，以下是LG品牌的：

```java
public class LGControl implements Control {

    @Override
    public void On() {
        System.out.println("**Open LG TV**");
    }

    @Override
    public void Off() {
        System.out.println("**Off LG TV**");
    }

    @Override
    public void setChannel(int ch) {
        System.out.println("**The LG TV Channel is setted " + ch + "**");
    }

    @Override
    public void setVolume(int vol) {
        System.out.println("**The LG TV Volume is setted " + vol + "**");
    }

}
```

b2.以下是夏普品牌的：

```java
public class SharpControl implements Control {

    @Override
    public void On() {
        System.out.println("***Open Sharp TV***");
    }

    @Override
    public void Off() {
        System.out.println("***Off Sharp TV***");
    }

    @Override
    public void setChannel(int ch) {
        System.out.println("***The Sharp TV Channel is setted " + ch + "***");
    }

    @Override
    public void setVolume(int vol) {
        System.out.println("***The Sharp TV Volume is setted " + vol + "***");
    }

}
```

b3.以下是索尼品牌的：

```java
public class SonyControl implements Control {

    @Override
    public void On() {
        System.out.println("*Open Sony TV*");
    }

    @Override
    public void Off() {
        System.out.println("*Off Sony TV*");
    }

    @Override
    public void setChannel(int ch) {
        System.out.println("*The Sony TV Channel is setted " + ch + "*");
    }

    @Override
    public void setVolume(int vol) {
        System.out.println("*The Sony TV Volume is setted " + vol + "*");
    }

}
```

c.创建电视遥控的超类：

```java
public abstract class TvControlabs {

    Control mControl = null;

    public TvControlabs(Control mControl) {
        this.mControl = mControl;
    }

    public abstract void Onoff();

    public abstract void nextChannel();

    public abstract void preChannel();

}
```

d1.实现电视遥控：

```java
public class TvControl extends TvControlabs {
    private int ch = 0;
    private boolean ison = false;

    public TvControl(Control mControl) {
        super(mControl);
    }

    @Override
    public void Onoff() {

        if (ison) {
            ison = false;
            mControl.Off();
        } else {
            ison = true;
            mControl.On();
        }

    }

    @Override
    public void nextChannel() {

        ch++;
        mControl.setChannel(ch);

    }

    @Override
    public void preChannel() {

        ch--;
        if (ch < 0) {
            ch = 200;
        }
        mControl.setChannel(ch);

    }

}
```

d2.再实现电视遥控，这里添加多了setChannel和Back方法：
```java
public class newTvControl extends TvControlabs {
    private int ch = 0;
    private boolean ison = false;
    private int prech = 0;

    public newTvControl(Control mControl) {
        super(mControl);
    }

    @Override
    public void Onoff() {

        if (ison) {
            ison = false;
            mControl.Off();
        } else {
            ison = true;
            mControl.On();
        }

    }

    @Override
    public void nextChannel() {
        prech = ch;
        ch++;
        mControl.setChannel(ch);

    }

    @Override
    public void preChannel() {
        prech = ch;
        ch--;
        if (ch < 0) {
            ch = 200;
        }
        mControl.setChannel(ch);

    }


    public void setChannel(int nch) {
        prech = ch;
        ch = nch;
        mControl.setChannel(ch);

    }

    public void Back() {
        mControl.setChannel(prech);
    }
}
```

e.客户端使用：

```java
public class MainTest {
    public static void main(String[] args) {
        TvControl mLGTvControl = new TvControl(new LGControl());
        TvControl mSonyTvControl = new TvControl(new SonyControl());

        mLGTvControl.Onoff();
        mLGTvControl.nextChannel();
        mLGTvControl.nextChannel();
        mLGTvControl.preChannel();
        mLGTvControl.Onoff();

        mSonyTvControl.Onoff();
        mSonyTvControl.preChannel();
        mSonyTvControl.preChannel();
        mSonyTvControl.preChannel();
        mSonyTvControl.Onoff();

        newTvControl mSharpTvControl = new newTvControl(new SharpControl());
        mSharpTvControl.Onoff();
        mSharpTvControl.nextChannel();
        mSharpTvControl.setChannel(9);
        mSharpTvControl.setChannel(28);
        mSharpTvControl.Back();
        mSharpTvControl.Onoff();

    }
}
```