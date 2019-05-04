---
title: 设计模式 - 模板模式
date: 2019-05-04 14:40:50
---

### 感想 ###

模板模式：封装了一个算法步骤，并允许子类为一个或多个步骤方法提供实现。模板模式可以使子类在不改变算法结构的情况下，重新定义算法中的某些步骤。

> 以下例子引用了韧雪飞舞的例子：[设计模式之 - 模板模式（Template Pattern）](https://www.cnblogs.com/qq-361807535/p/6854191.html)

a. 先来写一个抽象的做菜父类：

```java
    public abstract class DodishTemplate {    
        /**
         * 具体的整个过程
         */
        protected void dodish(){
            this.preparation();
            this.doing();
            this.carriedDishes();
        }
        /**
         * 备料
         */
        public abstract void preparation();
        /**
         * 做菜
         */
        public abstract void doing();
        /**
         * 上菜
         */
        public abstract void carriedDishes ();
    }
```

b. 下来做两个番茄炒蛋（EggsWithTomato）和红烧肉（Bouilli）实现父类中的抽象方法:

```java
    /**
     * 西红柿炒蛋
     * @author aries
     */
    public class EggsWithTomato extends DodishTemplate{

        @Override
        public void preparation() {
            System.out.println("洗并切西红柿，打鸡蛋。");
        }

        @Override
        public void doing() {
            System.out.println("鸡蛋倒入锅里，然后倒入西红柿一起炒。");
        }

        @Override
        public void carriedDishes() {
            System.out.println("将炒好的西红寺鸡蛋装入碟子里，端给客人吃。");
        }

    }
```

```java
    /**
     * 红烧肉
     * @author aries
     *
     */
    public class Bouilli extends DodishTemplate{

        @Override
        public void preparation() {
            System.out.println("切猪肉和土豆。");
        }

        @Override
        public void doing() {
            System.out.println("将切好的猪肉倒入锅中炒一会然后倒入土豆连炒带炖。");
        }

        @Override
        public void carriedDishes() {
            System.out.println("将做好的红烧肉盛进碗里端给客人吃。");
        }

    }
```

c. 在测试类中我们来做菜：
```java
    public class App {
        public static void main(String[] args) {
            DodishTemplate eggsWithTomato = new EggsWithTomato();
            eggsWithTomato.dodish();

            System.out.println("-----------------------------");

            DodishTemplate bouilli = new Bouilli();
            bouilli.dodish();
        }
    }
```