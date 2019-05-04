---
title: 设计模式 - 迭代器模式
date: 2019-05-04 14:41:19
---

### 感想 ###

迭代器模式：提供了一种方法顺序访问一个聚合对象中的各个对象。

a.定义一个菜单类型：

```java

    public class MenuItem {
        private String name, description;
        private boolean vegetable;
        private float price;

        public MenuItem(String name, String description, boolean vegetable, float price) {
            this.name = name;
            this.description = description;
            this.vegetable = vegetable;
            this.price = price;

        }

        public String getName() {
            return name;
        }

        public String getDescription() {
            return description;
        }

        public float getPrice() {
            return price;
        }

        public boolean isVegetable() {
            return vegetable;
        }
    }
```

b1.蛋糕的菜单：

```java
    public class CakeMenu {

        private ArrayList<MenuItem> menuItems;


        public CakeMenu() {
            menuItems = new ArrayList<MenuItem>();

            addItem("KFC Cake Breakfast", "boiled eggs&toast&cabbage", true, 3.99f);
            addItem("MDL Cake Breakfast", "fried eggs&toast", false, 3.59f);
            addItem("Stawberry Cake", "fresh stawberry", true, 3.29f);
            addItem("Regular Cake Breakfast", "toast&sausage", true, 2.59f);
        }

        private void addItem(String name, String description, boolean vegetable,
                             float price) {
            MenuItem menuItem = new MenuItem(name, description, vegetable, price);
            menuItems.add(menuItem);
        }

        public ArrayList<MenuItem> getIterator() {
            return menuItems;
        }

    }
```

b2.午餐的菜单：

```java
    public class DinnerMenu {

        private final static int Max_Items = 5;
        private int numberOfItems = 0;
        private MenuItem[] menuItems;

        public  DinnerMenu() {
            menuItems=new MenuItem[Max_Items] ;

            addItem("vegetable Blt","bacon&lettuce&tomato&cabbage",true,3.58f);
            addItem("Blt","bacon&lettuce&tomato",false,3.00f);
            addItem("bean soup","bean&potato salad",true,3.28f);
            addItem("hotdog","onions&cheese&bread",false,3.05f);
        }

        private void addItem(String name, String description, boolean vegetable,
                             float price) {
            MenuItem menuItem = new MenuItem(name, description, vegetable, price);
            if (numberOfItems >= Max_Items) {
                System.err.println("sorry,menu is full!can not add another item");
            } else {
                menuItems[numberOfItems] = menuItem;
                numberOfItems++;
            }

        }

        public MenuItem[] getIterator() {
            return menuItems;
        }
    }
```

c.定义迭代器里的元素标准：

```java
    public interface Iterator {

        public boolean hasNext();
        public Object next();

    }
```

d1.蛋糕菜单转换为元素标准：
```java
    public class CakeIterator implements Iterator {

        private ArrayList<MenuItem> menuItems;

        private int position = 0;

        public CakeIterator() {
            menuItems = new CakeMenu().getIterator();
            position = 0;
        }

        @Override
        public boolean hasNext() {
            if (position < menuItems.size()) {
                return true;
            }

            return false;
        }

        @Override
        public Object next() {
            MenuItem menuItem = menuItems.get(position);
            position++;
            return menuItem;
        }
    }
```

d2.午餐菜单转换为元素标准：
```java
    public class DinnerMenuIterator implements Iterator {

        private int numberOfItems = 0;
        private MenuItem[] menuItems;
        private int position;

        public DinnerMenuIterator() {
            menuItems = new DinnerMenu().getIterator();
            position = 0;
            numberOfItems = menuItems.length - 1;
        }

        @Override
        public boolean hasNext() {
            // TODO Auto-generated method stub
            if (position < numberOfItems) {
                return true;
            }

            return false;
        }

        @Override
        public Object next() {
            // TODO Auto-generated method stub
            MenuItem menuItem = menuItems[position];
            position++;
            return menuItem;
        }

    }
```

e.使用对象：
```java
    public class Waitress {
        private ArrayList<Iterator> iterators = new ArrayList<Iterator>();


        public Waitress() {}

        public void addIterator(Iterator iterator) {
            iterators.add(iterator);
        }

        public void printMenu() {
            Iterator iterator;
            MenuItem menuItem;
            for (int i = 0, len = iterators.size(); i < len; i++) {
                iterator = iterators.get(i);

                while (iterator.hasNext()) {
                    menuItem = (MenuItem) iterator.next();
                    System.out.println(menuItem.getName() + "***" + menuItem.getPrice() + "***" + menuItem.getDescription());

                }
            }
        }
    }
```

客户端使用：
```java
    public class App {
        public static void main(String[] args) {
            Waitress mWaitress=new Waitress();

            CakeIterator cakeIterator = new CakeIterator();
            mWaitress.addIterator(cakeIterator);

            DinnerMenuIterator dinnerMenuIterator = new DinnerMenuIterator();
            mWaitress.addIterator(dinnerMenuIterator);

            mWaitress.printMenu();
        }
    }
```

#### 单一责任原则 (单一职责原则)

单一责任原则 (单一职责原则)：就一个类（接口、结构体、方法等等）而言，应该仅有一个引起它变化的原因。

> 以下例子引用了蘑菇的例子：[设计模式之单一职责原则](https://www.cnblogs.com/XzcBlog/p/4186081.html)

a.需求：实现拍照和播放音乐，那先定义两个功能接口（参照《大话设计模式》）:

```
    //具有照相的功能的接口
    interface IPhotograph
    {
    void Photograph();
    }
```

```java
　　//具有播放音乐功能的接口
    interface IPlayMusic
    {
        void PlayMusic();
    }
```

b.不遵循单一原则的设计，播放音乐及拍照功能的改变都会引起变化:
```
//实现照相、播放音乐的手机类
    public class MobilePhone : IPhotograph, IPlayMusic
    {
        //拍照
        public void Photograph()
        {
            Console.WriteLine("拍照片");
        }

        //播放音乐
        public void PlayMusic()
        {
            Console.WriteLine("播放音乐");
        }
    }
```

c.不遵循单一原则的设计,客户端使用：
```
    class Program
        {
            static void Main(string[] args)
            {
                IPlayMusic musicPlayer;
                IPhotograph photographer;

                MobilePhone phone = new MobilePhone();
                musicPlayer = phone;
                photographer = phone;

                //播放音乐
                musicPlayer.PlayMusic();
                //拍照
                photographer.Photograph();
                Console.ReadLine();
            }
        }
```

d.遵循单一原则的设计，引发改变的只有播放音乐功能的变化:

```
//实现播放音乐功能的音乐播放器类
    class MusicPlayer : IPlayMusic
    {
        public void PlayMusic()
        {
            Console.WriteLine("播放音乐");
        }
    }
```

```
    //实现照相功能的摄像机类
    class Carmera : IPhotograph
    {
        public void Photograph()
        {
            Console.WriteLine("拍照片");
        }
    }
```

e.遵循单一原则的设计,客户端使用：
```
class Program
    {
        static void Main(string[] args)
        {
            IPlayMusic musicPlayer;
            IPhotograph photographer;

            //MobilePhone phone = new MobilePhone();
            //musicPlayer = phone;
            //photographer = phone;

            musicPlayer = new MusicPlayer();
            photographer = new Carmera();

            //播放音乐
            musicPlayer.PlayMusic();
            //拍照
            photographer.Photograph();
            Console.ReadLine();
        }
    }
```

使用单一职责原则在于：软件设计真正要做的许多内容，就是发现职责并把那些职责互相分离。单一职责原则可以使类的复杂度降低，实现什么职责都有清晰明确的定义；类的可读性提高，复杂度降低（复杂度降低肯定可读性提高）；可读性提高了，代码就更容易维护；变更（需求是肯定会变的，程序员都知道）引起的风险（包括测试的难度，以及需要测试的范围）降低。

引用上面博客中的内容：

糟糕的设计会造成什么样的后果呢？让我们来设想一下，有一天我们的需求发生了变化（需求变化-程序员一生的敌人兼朋友），现有拥有了一部手机，有拍照的功能以及播放音乐的功能，满足了现有的需求，突然有一天觉得简单的拍照功能已经不能满足了，现在需要能够拍摄高清图片的照相功能，那么怎么办呢？换手机呗，恩找一个支持高清拍照功能的手机。那么好的，需求又变了，现在想要能播放高品质音乐的功能，但是新换的支持高清拍摄的手机的硬件不支持高品质音乐播放，好的，继续换手机，前提是还要支持拍摄高清照片。相信现在已经能够看出一些端倪了，这两个职责无论哪一个发生了变化，你都要去改变手机，现在只有两个职责，夸张一点说，如果有十个职责呢？那么岂不是要天天换手机，要么就不满足需求变化。

　　既然我们看到了糟糕的设计，现在我们回到单一职责上，既然你的需求是拍照片和播放音乐，那么我给你一台相机还有一台音乐播放器，哪个功能需要改变你就换哪个，以后你要换的时候也不必去考虑其他功能，只需要关心引起你自己变化的原因。如果拍照功能发生改变，我们就去改变照相机，播放音乐功能需要改变我们就去改变音乐播放器。我们不需要去考虑播放高品质音乐是不是会对拍摄高清图片的功能造成影响。

　　我们一定要遵循单一职责原则吗？在现有的需求上能做到当然可以去做，但是往往有的时候，需求不是在设计的时候发生改变，而是一定程度之后，你已经有了一定的代码量了，可能修改的开销很高，这个时候就仁者见仁智者见智。就如上述，若是将手机类拆分，则影响了底层调用的实现，也需要修改，弱是调用的地方太多，那么修改的地方也会很多，若是发布了，改起来也不是很方便，但是当然，也有一定的手法来做这件事情，比如手机类保留，让手机类拥有一个摄像机类对象和一个音乐播放器类对象，然后播放音乐方法则调用音乐播放器类实例的播放音乐功能，照相功能则调用摄像机类实例的照相功能，这样可以在不影响原有的东西的基础上又遵循原则。
