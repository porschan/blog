---
title: 设计模式 - 单例模式
date: 2019-04-25 15:46:06
---

### 感想 ###

引用网上搜索的资料：

单例模式（Singleton Pattern）是 Java 中最简单的设计模式之一。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。

这种模式涉及到一个单一的类，该类负责创建自己的对象，同时确保只有单个对象被创建。这个类提供了一种访问其唯一的对象的方式，可以直接访问，不需要实例化该类的对象。

单例模式的例子：

```
    public class Singleton {

        private static Singleton uniqeInstance = null;

        private Singleton() {
        }

        public static Singleton getInstance() {
            if (uniqeInstance == null) {
                uniqeInstance = new Singleton();
            }
            return uniqeInstance;

        }

    }
```

1.单例模式在多线程中的优化：

- 同步（synchronized）getInstance方法
- “急切”创建实例
- 双重检查加锁

1.1.同步（synchronized）getInstance方法：
```
    public class ChocolateFactory {

        private boolean empty;
        private boolean boiled;
        public static ChocolateFactory uniqueInstance = null;

        private ChocolateFactory() {
            empty = true;
            boiled = false;
        }

        public static synchronized ChocolateFactory getInstance() {

            if (uniqueInstance == null) {
            	uniqueInstance = new ChocolateFactory();
            }

            return uniqueInstance;

        }

        public void fill() {
            if (empty) {
                // 添加原料巧克力动作
                empty = false;
                boiled = false;
            }
        }

        public void drain() {
            if ((!empty) && boiled) {
                // 排出巧克力动作
                empty = true;
            }
        }

        public void boil() {
            if ((!empty) && (!boiled)) {
                // 煮沸
                boiled = true;
            }
        }
    }
```

1.2.“急切”创建实例：

```
	public volatile static ChocolateFactory uniqueInstance = new ChocolateFactory();
```

1.3双重检查加锁:
```
    public class ChocolateFactory {

        private boolean empty;
        private boolean boiled;
        public volatile static ChocolateFactory uniqueInstance = null;

        private ChocolateFactory() {
            empty = true;
            boiled = false;
        }

        public static synchronized ChocolateFactory getInstance() {

            if (uniqueInstance == null) {
                synchronized (ChocolateFactory.class) {
                    if (uniqueInstance == null) {
                        uniqueInstance = new ChocolateFactory();
                    }
                }
            }

            return uniqueInstance;

        }

        public void fill() {
            if (empty) {
                // 添加原料巧克力动作
                empty = false;
                boiled = false;
            }
        }

        public void drain() {
            if ((!empty) && boiled) {
                // 排出巧克力动作
                empty = true;
            }
        }

        public void boil() {
            if ((!empty) && (!boiled)) {
                // 煮沸
                boiled = true;
            }
        }
    }
```