---
title: 设计模式 - 蝇量模式
date: 2019-05-13 14:46:36
---

### 感想 ###

蝇量模式：通过共享的方式高效地支持大量细粒度的对象。

蝇量模式的优点：

- 减少运行时的对象实例个数，节省创建开销和内容。
- 将许多“虚拟”对象的状态集中管理。

蝇量模式的缺点：

- 系统设计更加复杂。
- 需要专门维护对象的外部状态。

传统的方法，如下：

```java
public class TreesTest {

    private int length = 10000000;
    private Tree[] treelst = new Tree[length];

    public TreesTest() {
        for (int i = 0; i < length; i++) {
            treelst[i] = new Tree((int) (Math.random() * length),
                    (int) (Math.random() * length),
                    (int) (Math.random() * length) % 5);
        }
    }

    public void display() {
        for (int i = 0, len = treelst.length; i < len; i++) {
            treelst[i].display();
        }
    }

}
```

使用蝇量模式，如下：

a.制作一个抽象的类，如下：

```java
public abstract class Plant {

    public Plant() {

    }

    public abstract void display(int xCoord, int yCoord, int age);

}
```

b1.实现该抽象方法的Grass：

```java
public class Grass extends Plant {

    @Override
    public void display(int xCoord, int yCoord, int age) {
        // System.out.print("Grass x");
    }
}
```

b2.实现该抽象方法的Tree：

```java
public class Tree extends Plant {

    @Override
    public void display(int xCoord, int yCoord, int age) {
        // System.out.print("Tree x");
    }
}
```

c.定义一个工厂：

```java
public class PlantFactory {

    private HashMap<Integer, Plant> plantMap = new HashMap<Integer, Plant>();

    public PlantFactory() {

    }

    public Plant getPlant(int type) {

        if (!plantMap.containsKey(type)) {

            switch (type) {
                case 0:
                    plantMap.put(0, new Tree());
                    break;
                case 1:
                    plantMap.put(1, new Grass());
                    break;
            }
        }

        return plantMap.get(type);
    }
}
```

d.定义一个工程代理：

```java
public class PlantManager {

    private int length = 10000000;
    private int[] xArray = new int[length], yArray = new int[length],
            AgeArray = new int[length], typeArray = new int[length];

    private PlantFactory mPlantFactory;

    public PlantManager() {

        mPlantFactory = new PlantFactory();
        for (int i = 0; i < length; i++) {

            xArray[i] = (int) (Math.random() * length);
            yArray[i] = (int) (Math.random() * length);
            AgeArray[i] = (int) (Math.random() * length) % 5;
            typeArray[i] = (int) (Math.random() * length) % 2;
        }
    }

    public void displayTrees() {
        for (int i = 0; i < length; i++) {
            mPlantFactory.getPlant(typeArray[i]).display(xArray[i], yArray[i], AgeArray[i]);
        }
    }
}
```

e.客户端使用并测试时间：

```java
public class MainTest {

    public static void main(String[] args) {

        showMemInfo();

        PlantManager mPlantManager = new PlantManager();

        showMemInfo();
        mPlantManager.displayTrees();
        showMemInfo();

    }

    public static void showMemInfo() {
        // 已分配内存中的剩余空间 ：
        long free = Runtime.getRuntime().freeMemory();
        // 分配内存：
        long total = Runtime.getRuntime().totalMemory();
        // 最大内存：
        long max = Runtime.getRuntime().maxMemory();
        // 已占用的内存：

        long used = total - free;

        System.out.println("最大内存 = " + max);
        System.out.println("已分配内存 = " + total);
        System.out.println("已分配内存中的剩余空间 = " + free);
        System.out.println("已用内存 = " + used);
        System.out.println("时间 = " + System.currentTimeMillis());
        System.out.println("");
    }
}
```

最后比较使用传统的方法和使用蝇量模式的计算机资源情况：

```
传统方法：
最大内存 = 1890582528
已分配内存 = 128974848
已分配内存中的剩余空间 = 125529880
已用内存 = 3444968
时间 = 1557730578327

最大内存 = 1890582528
已分配内存 = 562561024
已分配内存中的剩余空间 = 280325328
已用内存 = 282235696
时间 = 1557730583982

最大内存 = 1890582528
已分配内存 = 562561024
已分配内存中的剩余空间 = 280325328
已用内存 = 282235696
时间 = 1557730583982

优化后，使用蝇量模式：
最大内存 = 1890582528
已分配内存 = 128974848
已分配内存中的剩余空间 = 125529880
已用内存 = 3444968
时间 = 1557730972164

最大内存 = 1890582528
已分配内存 = 209715200
已分配内存中的剩余空间 = 44906968
已用内存 = 164808232
时间 = 1557730973132

最大内存 = 1890582528
已分配内存 = 209715200
已分配内存中的剩余空间 = 44906968
已用内存 = 164808232
时间 = 1557730973289
```