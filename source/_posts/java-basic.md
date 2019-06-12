---
title: Java - 基础知识点
date: 2019-06-10 16:45:54
---

> 内容来自网络，加之自己整理，如侵即删。联系方式：710437653@qq.com

##### 什么是面向过程？

把问题分解成一个一个步骤，每个步骤用函数实现，依次调用即可。

就是说，在进行面向过程编程的时候，不需要考虑那么多，上来先定义一个函数，然后使用各种诸如if-else、for-each等方式进行代码执行。

最典型的用法就是实现一个简单的算法，比如实现冒泡排序。

##### 什么是面向对象？

将问题分解成一个一个步骤，对每个步骤进行相应的抽象，形成对象，通过不同对象之间的调用，组合解决问题。

就是说，在进行面向对象进行编程的时候，要把属性、行为等封装成对象，然后基于这些对象及对象的能力进行业务逻辑的实现。

比如想要造一辆车，上来要先把车的各种属性定义出来，然后抽象成一个Car类。

##### 面向对象三大特征?

(1)封装(Encapsulation)
所谓封装，也就是把客观事物封装成抽象的类，并且类可以把自己的数据和方法只让可信的类或者对象操作，对不可信的进行信息隐藏。封装是面向对象的特征之一，是对象和类概念的主要特性。简单的说，一个类就是一个封装了数据以及操作这些数据的代码的逻辑实体。在一个对象内部，某些代码或某些数据可以是私有的，不能被外界访问。通过这种方式，对象对内部数据提供了不同级别的保护，以防止程序中无关的部分意外的改变或错误的使用了对象的私有部分。

(2)继承(Inheritance)
继承是指这样一种能力：它可以使用现有类的所有功能，并在无需重新编写原来的类的情况下对这些功能进行扩展。通过继承创建的新类称为“子类”或“派生类”，被继承的类称为“基类”、“父类”或“超类”。继承的过程，就是从一般到特殊的过程。要实现继承，可以通过“继承”（Inheritance）和“组合”（Composition）来实现。继承概念的实现方式有二类：实现继承与接口继承。实现继承是指直接使用基类的属性和方法而无需额外编码的能力；接口继承是指仅使用属性和方法的名称、但是子类必须提供实现的能力；

(3)多态(Polymorphism)
所谓多态就是指一个类实例的相同方法在不同情形有不同表现形式。多态机制使具有不同内部结构的对象可以共享相同的外部接口。这意味着，虽然针对不同对象的具体操作不同，但通过一个公共的类，它们（那些操作）可以通过相同的方式予以调用。

最常见的多态就是将子类传入父类参数中，运行时调用父类方法时通过传入的子类决定具体的内部结构或行为。

##### 五大基本原则?

单一职责原则（Single-Resposibility Principle）
其核心思想为：一个类，最好只做一件事，只有一个引起它的变化。单一职责原则可以看做是低耦合、高内聚在面向对象原则上的引申，将职责定义为引起变化的原因，以提高内聚性来减少引起变化的原因。职责过多，可能引起它变化的原因就越多，这将导致职责依赖，相互之间就产生影响，从而大大损伤其内聚性和耦合度。通常意义下的单一职责，就是指只有一种单一功能，不要为类实现过多的功能点，以保证实体只有一个引起它变化的原因。 专注，是一个人优良的品质；同样的，单一也是一个类的优良设计。交杂不清的职责将使得代码看起来特别别扭牵一发而动全身，有失美感和必然导致丑陋的系统错误风险。

开放封闭原则（Open-Closed principle）
其核心思想是：软件实体应该是可扩展的，而不可修改的。也就是，对扩展开放，对修改封闭的。开放封闭原则主要体现在两个方面1、对扩展开放，意味着有新的需求或变化时，可以对现有代码进行扩展，以适应新的情况。2、对修改封闭，意味着类一旦设计完成，就可以独立完成其工作，而不要对其进行任何尝试的修改。 实现开开放封闭原则的核心思想就是对抽象编程，而不对具体编程，因为抽象相对稳定。让类依赖于固定的抽象，所以修改就是封闭的；而通过面向对象的继承和多态机制，又可以实现对抽象类的继承，通过覆写其方法来改变固有行为，实现新的拓展方法，所以就是开放的。 “需求总是变化”没有不变的软件，所以就需要用封闭开放原则来封闭变化满足需求，同时还能保持软件内部的封装体系稳定，不被需求的变化影响。

Liskov替换原则（Liskov-Substituion Principle）
其核心思想是：子类必须能够替换其基类。这一思想体现为对继承机制的约束规范，只有子类能够替换基类时，才能保证系统在运行期内识别子类，这是保证继承复用的基础。在父类和子类的具体行为中，必须严格把握继承层次中的关系和特征，将基类替换为子类，程序的行为不会发生任何变化。同时，这一约束反过来则是不成立的，子类可以替换基类，但是基类不一定能替换子类。 Liskov替换原则，主要着眼于对抽象和多态建立在继承的基础上，因此只有遵循了Liskov替换原则，才能保证继承复用是可靠地。实现的方法是面向接口编程：将公共部分抽象为基类接口或抽象类，通过Extract Abstract Class，在子类中通过覆写父类的方法实现新的方式支持同样的职责。 Liskov替换原则是关于继承机制的设计原则，违反了Liskov替换原则就必然导致违反开放封闭原则。 Liskov替换原则能够保证系统具有良好的拓展性，同时实现基于多态的抽象机制，能够减少代码冗余，避免运行期的类型判别。

依赖倒置原则（Dependecy-Inversion Principle）
其核心思想是：依赖于抽象。具体而言就是高层模块不依赖于底层模块，二者都同依赖于抽象；抽象不依赖于具体，具体依赖于抽象。 我们知道，依赖一定会存在于类与类、模块与模块之间。当两个模块之间存在紧密的耦合关系时，最好的方法就是分离接口和实现：在依赖之间定义一个抽象的接口使得高层模块调用接口，而底层模块实现接口的定义，以此来有效控制耦合关系，达到依赖于抽象的设计目标。 抽象的稳定性决定了系统的稳定性，因为抽象是不变的，依赖于抽象是面向对象设计的精髓，也是依赖倒置原则的核心。 依赖于抽象是一个通用的原则，而某些时候依赖于细节则是在所难免的，必须权衡在抽象和具体之间的取舍，方法不是一层不变的。依赖于抽象，就是对接口编程，不要对实现编程。

接口隔离原则（Interface-Segregation Principle）
其核心思想是：使用多个小的专门的接口，而不要使用一个大的总接口。 具体而言，接口隔离原则体现在：接口应该是内聚的，应该避免“胖”接口。一个类对另外一个类的依赖应该建立在最小的接口上，不要强迫依赖不用的方法，这是一种接口污染。 接口有效地将细节和抽象隔离，体现了对抽象编程的一切好处，接口隔离强调接口的单一性。而胖接口存在明显的弊端，会导致实现的类型必须完全实现接口的所有方法、属性等；而某些时候，实现类型并非需要所有的接口定义，在设计上这是“浪费”，而且在实施上这会带来潜在的问题，对胖接口的修改将导致一连串的客户端程序需要修改，有时候这是一种灾难。在这种情况下，将胖接口分解为多个特点的定制化方法，使得客户端仅仅依赖于它们的实际调用的方法，从而解除了客户端不会依赖于它们不用的方法。 分离的手段主要有以下两种：1、委托分离，通过增加一个新的类型来委托客户的请求，隔离客户和接口的直接依赖，但是会增加系统的开销。2、多重继承分离，通过接口多继承来实现客户的需求，这种方式是较好的。

以上就是5个基本的面向对象设计原则，它们就像面向对象程序设计中的金科玉律，遵守它们可以使我们的代码更加鲜活，易于复用，易于拓展，灵活优雅。不同的设计模式对应不同的需求，而设计原则则代表永恒的灵魂，需要在实践中时时刻刻地遵守。就如ARTHUR J.RIEL在那边《OOD启示录》中所说的：“你并不必严格遵守这些原则，违背它们也不会被处以宗教刑罚。但你应当把这些原则看做警铃，若违背了其中的一条，那么警铃就会响起。”

##### Java如何实现的平台无关性的?

什么是平台无关性
平台无关性就是一种语言在计算机上的运行不受平台的约束，一次编译，到处执行（Write Once ,Run Anywhere）。

也就是说，用Java创建的可执行二进制程序，能够不加改变的运行于多个平台。

平台无关性好处

作为一门平台无关性语言，无论是在自身发展，还是对开发者的友好度上都是很突出的。

因为其平台无关性，所以Java程序可以运行在各种各样的设备上，尤其是一些嵌入式设备，如打印机、扫描仪、传真机等。随着5G时代的来临，也会有更多的终端接入网络，相信平台无关性的Java也能做出一些贡献。

对于Java开发者来说，Java减少了开发和部署到多个平台的成本和时间。真正的做到一次编译，到处运行。

平台无关性的实现
对于Java的平台无关性的支持，就像对安全性和网络移动性的支持一样，是分布在整个Java体系结构中的。其中扮演者重要的角色的有Java语言规范、Class文件、Java虚拟机（JVM）等。

编译原理基础

讲到Java语言规范、Class文件、Java虚拟机就不得不提Java到底是是如何运行起来的。

我们在Java代码的编译与反编译那些事儿中介绍过，在计算机世界中，计算机只认识0和1，所以，真正被计算机执行的其实是由0和1组成的二进制文件。

但是，我们日常开发使用的C、C++、Java、Python等都属于高级语言，而非二进制语言。所以，想要让计算机认识我们写出来的Java代码，那就需要把他"翻译"成由0和1组成的二进制文件。这个过程就叫做编译。负责这一过程的处理的工具叫做编译器。

在深入分析Java的编译原理中我们介绍过，在Java平台中，想要把Java文件，编译成二进制文件，需要经过两步编译，前端编译和后端编译：

前端编译主要指与源语言有关但与目标机无关的部分。Java中，我们所熟知的javac的编译就是前端编译。除了这种以外，我们使用的很多IDE，如eclipse，idea等，都内置了前端编译器。主要功能就是把.java代码转换成.class代码。

这里提到的.class代码，其实就是Class文件。

后端编译主要是将中间代码再翻译成机器语言。Java中，这一步骤就是Java虚拟机来执行的。

Java虚拟机

所谓平台无关性，就是说要能够做到可以在多个平台上都能无缝对接。但是，对于不通的平台，硬件和操作系统肯定都是不一样的。

对于不同的硬件和操作系统，最主要的区别就是指令不同。比如同样执行a+b，A操作系统对应的二进制指令可能是10001000，而B操作系统对应的指令可能是11101110。那么，想要做到跨平台，最重要的就是可以根据对应的硬件和操作系统生成对应的二进制指令。

而这一工作，主要由我们的Java虚拟机完成。虽然Java语言是平台无关的，但是JVM确实平台有关的，不同的操作系统上面要安装对应的JVM。

有了Java虚拟机，想要执行a+b操作，A操作系统上面的虚拟机就会把指令翻译成10001000，B操作系统上面的虚拟机就会把指令翻译成11101110。

所以，Java之所以可以做到跨平台，是因为Java虚拟机充当了桥梁。他扮演了运行时Java程序与其下的硬件和操作系统之间的缓冲角色。

字节码

各种不同的平台的虚拟机都使用统一的程序存储格式——字节码（ByteCode）是构成平台无关性的另一个基石。Java虚拟机只与由自己码组成的Class文件进行交互。

我们说Java语言可以Write Once ,Run Anywhere。这里的Write其实指的就是生成Class文件的过程。

因为Java Class文件可以在任何平台创建，也可以被任何平台的Java虚拟机装载并执行，所以才有了Java的平台无关性。

Java语言规范

已经有了统一的Class文件，以及可以在不同平台上将Class文件翻译成对应的二进制文件的Java虚拟机，Java就可以彻底实现跨平台了吗？

其实并不是的，Java语言在跨平台方面也是做了一些努力的，这些努力被定义在Java语言规范中。

比如，Java中基本数据类型的值域和行为都是由其自己定义的。而C/C++中，基本数据类型是由它的占位宽度决定的，占位宽度则是由所在平台决定的。所以，在不同的平台中，对于同一个C++程序的编译结果会出现不同的行为。

举一个简单的例子，对于int类型，在Java中，int占4个字节，这是固定的。

但是在C++中却不是固定的了。在16位计算机上，int类型的长度可能为两字节；在32位计算机上，可能为4字节；当64位计算机流行起来后，int类型的长度可能会达到8字节。（这里说的都是可能哦！）

小结
对于Java的平台无关性的支持是分布在整个Java体系结构中的。其中扮演者重要的角色的有Java语言规范、Class文件、Java虚拟机等。

Java语言规范
通过规定Java语言中基本数据类型的取值范围和行为
Class文件
所有Java文件要编译成统一的Class文件
Java虚拟机
通过Java虚拟机将Class文件转成对应平台的二进制文件等
Java的平台无关性是建立在Java虚拟机的平台有关性基础之上的，是因为Java虚拟机屏蔽了底层操作系统和硬件的差异。

语言无关性
其实，Java的无关性不仅仅体现在平台无关性上面，向外扩展一下，Java还具有语言无关性。

前面我们提到过。JVM其实并不是和Java文件进行交互的，而是和Class文件，也就是说，其实JVM运行的时候，并不依赖于Java语言。

时至今日，商业机构和开源机构已经在Java语言之外发展出一大批可以在JVM上运行的语言了，如Groovy、Scala、Jython等。之所以可以支持，就是因为这些语言也可以被编译成字节码（Class文锦啊）。而虚拟机并不关心字节码是有哪种语言编译而来的。

##### 为什么说Java中只有值传递?

实参与形参
我们都知道，在Java中定义方法的时候是可以定义参数的。比如Java中的main方法，public static void main(String[] args)，这里面的args就是参数。参数在程序语言中分为形式参数和实际参数。

形式参数：是在定义函数名和函数体的时候使用的参数,目的是用来接收调用该函数时传入的参数。

实际参数：在调用有参函数时，主调函数和被调函数之间有数据传递关系。在主调函数中调用一个函数时，函数名后面括号中的参数称为“实际参数”。

简单举个例子：

```java
public static void main(String[] args) {
  ParamTest pt = new ParamTest();
  pt.sout("Hollis");//实际参数为 Hollis
}

public void sout(String name) { //形式参数为 name
  System.out.println(name);
}
```

实际参数是调用有参方法的时候真正传递的内容，而形式参数是用于接收实参内容的参数。

值传递与引用传递
上面提到了，当我们调用一个有参函数的时候，会把实际参数传递给形式参数。但是，在程序语言中，这个传递过程中传递的两种情况，即值传递和引用传递。我们来看下程序语言中是如何定义和区分值传递和引用传递的。

值传递（pass by value）是指在调用函数时将实际参数复制一份传递到函数中，这样在函数中如果对参数进行修改，将不会影响到实际参数。

引用传递（pass by reference）是指在调用函数时将实际参数的地址直接传递到函数中，那么在函数中对参数所进行的修改，将影响到实际参数。

有了上面的概念，然后大家就可以写代码实践了，来看看Java中到底是值传递还是引用传递 ，于是，最简单的一段代码出来了：

```java
public static void main(String[] args) {
  ParamTest pt = new ParamTest();

  int i = 10;
  pt.pass(10);
  System.out.println("print in main , i is " + i);
}

public void pass(int j) {
  j = 20;
  System.out.println("print in pass , j is " + j);
}
```

上面的代码中，我们在pass方法中修改了参数j的值，然后分别在pass方法和main方法中打印参数的值。输出结果如下：

```java
print in pass , j is 20
print in main , i is 10
```

可见，pass方法内部对name的值的修改并没有改变实际参数i的值。那么，按照上面的定义，有人得到结论：Java的方法传递是值传递。

但是，很快就有人提出质疑了（哈哈，所以，不要轻易下结论咯。）。然后，他们会搬出以下代码：

```java
public static void main(String[] args) {
  ParamTest pt = new ParamTest();

  User hollis = new User();
  hollis.setName("Hollis");
  hollis.setGender("Male");
  pt.pass(hollis);
  System.out.println("print in main , user is " + hollis);
}

public void pass(User user) {
  user.setName("hollischuang");
  System.out.println("print in pass , user is " + user);
}
```

同样是一个pass方法，同样是在pass方法内修改参数的值。输出结果如下：

```java
print in pass , user is User{name='hollischuang', gender='Male'}
print in main , user is User{name='hollischuang', gender='Male'}
```

经过pass方法执行后，实参的值竟然被改变了，那按照上面的引用传递的定义，实际参数的值被改变了，这不就是引用传递了么。于是，根据上面的两段代码，有人得出一个新的结论：Java的方法中，在传递普通类型的时候是值传递，在传递对象类型的时候是引用传递。

但是，这种表述仍然是错误的。不信你看下面这个参数类型为对象的参数传递：

```java
public static void main(String[] args) {
  ParamTest pt = new ParamTest();

  String name = "Hollis";
  pt.pass(name);
  System.out.println("print in main , name is " + name);
}

public void pass(String name) {
  name = "hollischuang";
  System.out.println("print in pass , name is " + name);
}
```

上面的代码输出结果为

```
print in pass , name is hollischuang
print in main , name is Hollis
```

Java中的值传递
上面，我们举了三个例子，表现的结果却不一样，这也是导致很多初学者，甚至很多高级程序员对于Java的传递类型有困惑的原因。

其实，我想告诉大家的是，上面的概念没有错，只是代码的例子有问题。来，我再来给大家画一下概念中的重点，然后再举几个真正恰当的例子。

值传递（pass by value）是指在调用函数时将实际参数复制一份传递到函数中，这样在函数中如果对参数进行修改，将不会影响到实际参数。

引用传递（pass by reference）是指在调用函数时将实际参数的地址直接传递到函数中，那么在函数中对参数所进行的修改，将影响到实际参数。

那么，我来给大家总结一下，值传递和引用传递之前的区别的重点是什么。

值传递与引用传递的根本区别在于值传递会创建副本（Copy）,而引用传递不创建副本，所以值传递函数中无法改变原始对象，而引用传递可以在函数中改变原始对象。

我们上面看过的几个pass的例子中，都只关注了实际参数内容是否有改变。如传递的是User对象，我们试着改变他的name属性的值，然后检查是否有改变。其实，在实验方法上就错了，当然得到的结论也就有问题了。

为什么说实验方法错了呢？这里我们来举一个形象的例子。再来深入理解一下值传递和引用传递，然后你就知道为啥错了。

你有一把钥匙，当你的朋友想要去你家的时候，如果你`直接`把你的钥匙给他了，这就是引用传递。这种情况下，如果他对这把钥匙做了什么事情，比如他在钥匙上刻下了自己名字，那么这把钥匙还给你的时候，你自己的钥匙上也会多出他刻的名字。

你有一把钥匙，当你的朋友想要去你家的时候，你`复刻`了一把新钥匙给他，自己的还在自己手里，这就是值传递。这种情况下，他对这把钥匙做什么都不会影响你手里的这把钥匙。

但是，不管上面那种情况，你的朋友拿着你给他的钥匙，进到你的家里，把你家的电视砸了。那你说你会不会受到影响？而我们在pass方法中，改变user对象的name属性的值的时候，不就是在“砸电视”么。

还拿上面的一个例子来举例，我们`真正的改变参数`，看看会发生什么？

```java
public static void main(String[] args) {
  ParamTest pt = new ParamTest();

  User hollis = new User();
  hollis.setName("Hollis");
  hollis.setGender("Male");
  pt.pass(hollis);
  System.out.println("print in main , user is " + hollis);
}

public void pass(User user) {
  user = new User();
  user.setName("hollischuang");
  user.setGender("Male");
  System.out.println("print in pass , user is " + user);
}
```

上面的代码中，我们在pass方法中，改变了user对象，输出结果如下：

```java
print in pass , user is User{name='hollischuang', gender='Male'}
print in main , user is User{name='Hollis', gender='Male'}
```

稍微解释下这张图，当我们在main中创建一个User对象的时候，在堆中开辟一块内存，其中保存了name和gender等数据。然后hollis持有该内存的地址`0x123456`（图1）。当尝试调用pass方法，并且hollis作为实际参数传递给形式参数user的时候，会把这个地址`0x123456`交给user，这时，user也指向了这个地址（图2）。然后在pass方法内对参数进行修改的时候，即`user = new User();`，会重新开辟一块`0X456789`的内存，赋值给user。后面对user的任何修改都不会改变内存`0X123456`的内容（图3）。

上面这种传递是什么传递？肯定不是引用传递，如果是引用传递的话，在`user=new User()`的时候，实际参数的引用也应该改为指向`0X456789`，但是实际上并没有。

通过概念我们也能知道，这里是把实际参数的引用的地址复制了一份，传递给了形式参数。所以，**上面的参数其实是值传递，把实参对象引用的地址当做值传递给了形式参数。**

同样的，在参数传递的过程中，实际参数的地址`0X1213456`被拷贝给了形参，只是，在这个方法中，并没有对形参本身进行修改，而是修改的形参持有的地址中存储的内容。

所以，值传递和引用传递的区别并不是传递的内容。而是实参到底有没有被复制一份给形参。在判断实参内容有没有受影响的时候，要看传的的是什么，如果你传递的是个地址，那么就看这个地址的变化会不会有影响，而不是看地址指向的对象的变化。就像钥匙和房子的关系。

那么，既然这样，为啥上面同样是传递对象，传递的String对象和User对象的表现结果不一样呢？我们在pass方法中使用`name = "hollischuang";`试着去更改name的值，阴差阳错的直接改变了name的引用的地址。因为这段代码，会new一个String，在把引用交给name，即等价于`name = new String("hollischuang");`。而原来的那个"Hollis"字符串还是由实参持有着的，所以，并没有修改到实际参数的值。

**所以说，Java中其实还是值传递的，只不过对于对象参数，值的内容是对象的引用。**

### 总结

无论是值传递还是引用传递，其实都是一种求值策略([Evaluation strategy](https://en.wikipedia.org/wiki/Evaluation_strategy))。在求值策略中，还有一种叫做按共享传递(call by sharing)。其实Java中的参数传递严格意义上说应该是按共享传递。

> 按共享传递，是指在调用函数时，传递给函数的是实参的地址的拷贝（如果实参在栈中，则直接拷贝该值）。在函数内部对参数进行操作时，需要先拷贝的地址寻找到具体的值，再进行操作。如果该值在栈中，那么因为是直接拷贝的值，所以函数内部对参数进行操作不会对外部变量产生影响。如果原来拷贝的是原值在堆中的地址，那么需要先根据该地址找到堆中对应的位置，再进行操作。因为传递的是地址的拷贝所以函数内对值的操作对外部变量是可见的。

简单点说，Java中的传递，是值传递，而这个值，实际上是对象的引用。

而按共享传递其实只是按值传递的一个特例罢了。所以我们可以说Java的传递是按共享传递，或者说Java中的传递是值传递。

##### 什么是多态，多态有什么好处，多态的必要条件是什么、Java中多态的实现方式？

多态的概念呢比较简单，就是同一操作作用于不同的对象，可以有不同的解释，产生不同的执行结果。

如果按照这个概念来定义的话，那么多态应该是一种运行期的状态。 为了实现运行期的多态，或者说是动态绑定，需要满足三个条件。

即有类继承或者接口实现、子类要重写父类的方法、父类的引用指向子类的对象。

简单来一段代码解释下：

```java
public class Parent{
    
    public void call(){
        sout("im Parent");
    }
}

public class Son extends Parent{// 1.有类继承或者接口实现
    public void call(){// 2.子类要重写父类的方法
        sout("im Son");
    }
}

public class Daughter extends Parent{// 1.有类继承或者接口实现
    public void call(){// 2.子类要重写父类的方法
        sout("im Daughter");
    }
}

public class Test{
    
    public static void main(String[] args){
        Parent p = new Son(); //3.父类的引用指向子类的对象
        Parent p1 = new Daughter(); //3.父类的引用指向子类的对象
    }
}
```

这样，就实现了多态，同样是Parent类的实例，p.call 调用的是Son类的实现、p1.call调用的是Daughter的实现。 有人说，你自己定义的时候不就已经知道p是son，p1是Daughter了么。但是，有些时候你用到的对象并不都是自己声明的啊 。 比如Spring 中的IOC出来的对象，你在使用的时候就不知道他是谁，或者说你可以不用关心他是谁。根据具体情况而定。

另外，还有一种说法，包括维基百科也说明，动态还分为动态多态和静态多态。 上面提到的那种动态绑定认为是动态多态，因为只有在运行期才能知道真正调用的是哪个类的方法。

还有一种静态多态，一般认为Java中的函数重载是一种静态多态，因为他需要在编译期决定具体调用哪个方法、

关于这个动态静态的说法，我更偏向于重载和多态其实是无关的。

但是也要看情况，普通场合，我会认为只有方法的重写算是多态，毕竟这是我的观点。但是如果在面试的时候，我“可能”会认为重载也算是多态，毕竟面试官也有他的观点。我会和面试官说：我认为，多态应该是一种运行期特性，Java中的重写是多态的体现。不过也有人提出重载是一种静态多态的想法，这个问题在StackOverflow等网站上有很多人讨论，但是并没有什么定论。我更加倾向于重载不是多态。

这样沟通，既能体现出你了解的多，又能表现出你有自己的思维，不是那种别人说什么就是什么的。

##### 方法重写与重载？

重载（Overloading）和重写（Overriding）是Java中两个比较重要的概念。

## 定义

### 重载

简单说，就是函数或者方法有同样的名称，但是参数列表不相同的情形，这样的同名不同参数的函数或者方法之间，互相称之为重载函数或者方法。

### 重写

重写指的是在Java的子类与父类中有两个名称、参数列表都相同的方法的情况。由于他们具有相同的方法签名，所以子类中的新方法将覆盖父类中原有的方法。

## 重载 VS 重写

关于重载和重写，你应该知道以下几点：

> 1、重载是一个编译期概念、重写是一个运行期间概念。
>
> 2、重载遵循所谓“编译期绑定”，即在编译时根据参数变量的类型判断应该调用哪个方法。
>
> 3、重写遵循所谓“运行期绑定”，即在运行的时候，根据引用变量所指向的实际对象的类型来调用方法
>
> 4、因为在编译期已经确定调用哪个方法，所以重载并不是多态。而重写是多态。重载只是一种语言特性，是一种语法规则，与多态无关，与面向对象也无关。（注：严格来说，重载是编译时多态，即静态多态。但是，Java中提到的多态，在不特别说明的情况下都指动态多态）

## 重写的例子

下面是一个重写的例子，看完代码之后不妨猜测一下输出结果：

```java
class Dog{
    public void bark(){
        System.out.println("woof ");
    }
}
class Hound extends Dog{
    public void sniff(){
        System.out.println("sniff ");
    }

    public void bark(){
        System.out.println("bowl");
    }
}

public class OverridingTest{
    public static void main(String [] args){
        Dog dog = new Hound();
        dog.bark();
    }
}
```

输出结果：

```
bowl
```

上面的例子中，`dog`对象被定义为`Dog`类型。在编译期，编译器会检查Dog类中是否有可访问的`bark()`方法，只要其中包含`bark（）`方法，那么就可以编译通过。在运行期，`Hound`对象被`new`出来，并赋值给`dog`变量，这时，JVM是明确的知道`dog`变量指向的其实是`Hound`对象的引用。所以，当`dog`调用`bark()`方法的时候，就会调用`Hound`类中定义的`bark（）`方法。这就是所谓的动态多态性。

### 重写的条件

> 参数列表必须完全与被重写方法的相同；
>
> 返回类型必须完全与被重写方法的返回类型相同；
>
> 访问级别的限制性一定不能比被重写方法的强；
>
> 访问级别的限制性可以比被重写方法的弱；
>
> 重写方法一定不能抛出新的检查异常或比被重写的方法声明的检查异常更广泛的检查异常
>
> 重写的方法能够抛出更少或更有限的异常（也就是说，被重写的方法声明了异常，但重写的方法可以什么也不声明）
>
> 不能重写被标示为final的方法；
>
> 如果不能继承一个方法，则不能重写这个方法。

## 重载的例子

```java
class Dog{
    public void bark(){
        System.out.println("woof ");
    }

    //overloading method
    public void bark(int num){
        for(int i=0; i<num; i++)
            System.out.println("woof ");
    }
}
```

上面的代码中，定义了两个bark方法，一个是没有参数的bark方法，另外一个是包含一个int类型参数的bark方法。在编译期，编译期可以根据方法签名（方法名和参数情况）情况确定哪个方法被调用。

### 重载的条件

> 被重载的方法必须改变参数列表；
>
> 被重载的方法可以改变返回类型；
>
> 被重载的方法可以改变访问修饰符；
>
> 被重载的方法可以声明新的或更广的检查异常；
>
> 方法能够在同一个类中或者在一个子类中被重载。

##### Java的继承与组合?

## 面向对象的复用技术

前面提到复用，这里就简单介绍一下面向对象的复用技术。

复用性是面向对象技术带来的很棒的潜在好处之一。如果运用的好的话可以帮助我们节省很多开发时间，提升开发效率。但是，如果被滥用那么就可能产生很多难以维护的代码。

作为一门面向对象开发的语言，代码复用是Java引人注意的功能之一。Java代码的复用有继承，组合以及代理三种具体的表现形式。本文将重点介绍继承复用和组合复用。

## 继承

继承（Inheritance）是一种联结类与类的层次模型。指的是一个类（称为子类、子接口）继承另外的一个类（称为父类、父接口）的功能，并可以增加它自己的新功能的能力，继承是类与类或者接口与接口之间最常见的关系；继承是一种[`is-a`](https://zh.wikipedia.org/wiki/Is-a)关系。

## 组合

组合(Composition)体现的是整体与部分、拥有的关系，即[`has-a`](https://en.wikipedia.org/wiki/Has-a)的关系。

## 组合与继承的区别和联系

> 在`继承`结构中，父类的内部细节对于子类是可见的。所以我们通常也可以说通过继承的代码复用是一种`白盒式代码复用`。（如果基类的实现发生改变，那么派生类的实现也将随之改变。这样就导致了子类行为的不可预知性；）
>
> `组合`是通过对现有的对象进行拼装（组合）产生新的、更复杂的功能。因为在对象之间，各自的内部细节是不可见的，所以我们也说这种方式的代码复用是`黑盒式代码复用`。（因为组合中一般都定义一个类型，所以在编译期根本不知道具体会调用哪个实现类的方法）
>
> `继承`，在写代码的时候就要指名具体继承哪个类，所以，在`编译期`就确定了关系。（从基类继承来的实现是无法在运行期动态改变的，因此降低了应用的灵活性。）
>
> `组合`，在写代码的时候可以采用面向接口编程。所以，类的组合关系一般在`运行期`确定。

## 优缺点对比

| 组 合 关 系                                                  | 继 承 关 系                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| 优点：不破坏封装，整体类与局部类之间松耦合，彼此相对独立     | 缺点：破坏封装，子类与父类之间紧密耦合，子类依赖于父类的实现，子类缺乏独立性 |
| 优点：具有较好的可扩展性                                     | 缺点：支持扩展，但是往往以增加系统结构的复杂度为代价         |
| 优点：支持动态组合。在运行时，整体对象可以选择不同类型的局部对象 | 缺点：不支持动态继承。在运行时，子类无法选择不同的父类       |
| 优点：整体类可以对局部类进行包装，封装局部类的接口，提供新的接口 | 缺点：子类不能改变父类的接口                                 |
| 缺点：整体类不能自动获得和局部类同样的接口                   | 优点：子类能自动继承父类的接口                               |
| 缺点：创建整体类的对象时，需要创建所有局部类的对象           | 优点：创建子类的对象时，无须创建父类的对象                   |

## 如何选择

相信很多人都知道面向对象中有一个比较重要的原则『多用组合、少用继承』或者说『组合优于继承』。从前面的介绍已经优缺点对比中也可以看出，组合确实比继承更加灵活，也更有助于代码维护。

所以，

> **建议在同样可行的情况下，优先使用组合而不是继承。**
>
> **因为组合更安全，更简单，更灵活，更高效。**

注意，并不是说继承就一点用都没有了，前面说的是【在同样可行的情况下】。有一些场景还是需要使用继承的，或者是更适合使用继承。

> 继承要慎用，其使用场合仅限于你确信使用该技术有效的情况。一个判断方法是，问一问自己是否需要从新类向基类进行向上转型。如果是必须的，则继承是必要的。反之则应该好好考虑是否需要继承。《[Java编程思想](http://s.click.taobao.com/t?e=m%3D2%26s%3DHzJzud6zOdocQipKwQzePOeEDrYVVa64K7Vc7tFgwiHjf2vlNIV67vo5P8BMUBgoEC56fBbgyn5pS4hLH%2FP02ckKYNRBWOBBey11vvWwHXSniyi5vWXIZhtlrJbLMDAQihpQCXu2JnPFYKQlNeOGCsYMXU3NNCg%2F&pvid=10_125.119.86.125_222_1458652212179)》
>
> 只有当子类真正是超类的子类型时，才适合用继承。换句话说，对于两个类A和B，只有当两者之间确实存在[`is-a`](https://zh.wikipedia.org/wiki/Is-a)关系的时候，类B才应该继承类A。《[Effective Java](http://s.click.taobao.com/t?e=m%3D2%26s%3DwIPn8%2BNPqLwcQipKwQzePOeEDrYVVa64K7Vc7tFgwiHjf2vlNIV67vo5P8BMUBgoUOZr0mLjusdpS4hLH%2FP02ckKYNRBWOBBey11vvWwHXSniyi5vWXIZvgXwmdyquYbNLnO%2BjzYQLqKnzbV%2FMLqnMYMXU3NNCg%2F&pvid=10_125.119.86.125_345_1458652241780)》

##### 构造函数与默认构造函数?

构造函数，是一种特殊的方法。 主要用来在创建对象时初始化对象， 即为对象成员变量赋初始值，总与new运算符一起使用在创建对象的语句中。 特别的一个类可以有多个构造函数，可根据其参数个数的不同或参数类型的不同来区分它们即构造函数的重载。

构造函数跟一般的实例方法十分相似；但是与其它方法不同，构造器没有返回类型，不会被继承，且可以有范围修饰符。构造器的函数名称必须和它所属的类的名称相同。 它承担着初始化对象数据成员的任务。

如果在编写一个可实例化的类时没有专门编写构造函数，多数编程语言会自动生成缺省构造器（默认构造函数）。默认构造函数一般会把成员变量的值初始化为默认值，如int -> 0，Integet -> null。

##### 类变量、成员变量和局部变量?

Java中共有三种变量，分别是类变量、成员变量和局部变量。他们分别存放在JVM的方法区、堆内存和栈内存中。

```java
    /**
     * @author Hollis
     */
    public class Variables {
    
        /**
         * 类变量
         */
        private static int a;
    
        /**
         * 成员变量
         */
        private int b;
    
        /**
         * 局部变量
         * @param c
         */
        public void test(int c){
            int d;
        }
    }
```

上面定义的三个变量中，变量a就是类变量，变量b就是成员变量，而变量c和d是局部变量。

##### 对于成员变量和方法的作用域?

### 对于成员变量和方法的作用域，public,protected,private以及不写之间的区别。

- public :表明该成员变量或者方法是对所有类或者对象都是可见的,所有类或者对象都可以直接访问
- private:表明该成员变量或者方法是私有的,只有当前类对其具有访问权限,除此之外其他类或者对象都没有访问权限.子类也没有访问权限.
- protected:表明成员变量或者方法对类自身,与同在一个包中的其他类可见,其他包下的类不可访问,除非是他的子类
- default:表明该成员变量或者方法只有自己和其位于同一个包的内可见,其他包内的类不能访问,即便是它的子类

##### 7种基本数据类型：整型、浮点型、布尔型、字符型?

Java中有8种基本数据类型 分为三大类。

字符型：char

布尔型：boolean

数值型： 1.整型：byte、short、int、long 2.浮点型：float、double

String不是基本数据类型，是引用类型。

##### 整型中byte、short、int、long的取值范围?

Java中的整型主要包含byte、short、int和long这四种，表示的数字范围也是从小到大的，之所以表示范围不同主要和他们存储数据时所占的字节数有关。

先来个简答的科普，1字节=8位（bit）。java中的整型属于有符号数。

先来看计算中8bit可以表示的数字： 最小值：10000000 （-128）(-2^7) 最大值：01111111（127）(2^7-1) 具体计算方式参考：Java中，为什么byte类型的取值范围为-128~127? - CSDN博客

整型的这几个类型中，

　　byte：byte用1个字节来存储，范围为-128(-2^7)到127(2^7-1)，在变量初始化的时候，byte类型的默认值为0。

　　short：short用2个字节存储，范围为-32,768 (-2^15)到32,767 (2^15-1)，在变量初始化的时候，short类型的默认值为0，一般情况下，因为Java本身转型的原因，可以直接写为0。

　　int：int用4个字节存储，范围为-2,147,483,648 (-2^31)到2,147,483,647 (2^31-1)，在变量初始化的时候，int类型的默认值为0。

　　long：long用8个字节存储，范围为-9,223,372,036,854,775,808 (-2^63)到9,223,372,036, 854,775,807 (2^63-1)，在变量初始化的时候，long类型的默认值为0L或0l，也可直接写为0。

上面说过了，整型中，每个类型都有一定的表示范围，但是，在程序中有些计算会导致超出表示范围，即溢出。如以下代码：

```java
int i = Integer.MAX_VALUE;
int j = Integer.MAX_VALUE;

int k = i + j;
System.out.println("i (" + i + ") + j (" + j + ") = k (" + k + ")");
```

输出结果：`i (2147483647) + j (2147483647) = k (-2)`

这就是发生了溢出，溢出的时候并不会抛异常，也没有任何提示。所以，在程序中，使用同类型的数据进行运算的时候，一定要注意数据溢出的问题。

##### 什么是浮点型？

在计算机科学中，浮点是一种对于实数的近似值数值表现法，由一个有效数字（即尾数）加上幂数来表示，通常是乘以某个基数的整数次指数得到。以这种表示法表示的数值，称为浮点数（floating-point number）。

计算机使用浮点数运算的主因，在于电脑使用二进位制的运算。例如：4÷2=2，4的二进制表示为100、2的二进制表示为010，在二进制中，相当于退一位数(100 -> 010)。

1的二进制是01，1.0/2=0.5，那么，0.5的二进制表示应该为(0.1)，以此类推，0.25的二进制表示为0.01，所以，并不是说所有的十进制小数都能准确的用二进制表示出来，如0.1，因此只能使用近似值的方式表达。

也就是说，，十进制的小数在计算机中是由一个整数或定点数（即尾数）乘以某个基数（计算机中通常是2）的整数次幂得到的，这种表示方法类似于基数为10的科学计数法。

一个浮点数a由两个数m和e来表示：a = m × be。在任意一个这样的系统中，我们选择一个基数b（记数系统的基）和精度p（即使用多少位来存储）。m（即尾数）是形如±d.ddd...ddd的p位数（每一位是一个介于0到b-1之间的整数，包括0和b-1）。如果m的第一位是非0整数，m称作正规化的。有一些描述使用一个单独的符号位（s 代表+或者-）来表示正负，这样m必须是正的。e是指数。

位（bit）是衡量浮点数所需存储空间的单位，通常为32位或64位，分别被叫作单精度和双精度。

##### 什么是单精度和双精度？

单精度浮点数在计算机存储器中占用4个字节（32 bits），利用“浮点”（浮动小数点）的方法，可以表示一个范围很大的数值。

比起单精度浮点数，双精度浮点数(double)使用 64 位（8字节） 来存储一个浮点数。

##### 为什么不能用浮点型表示金额？

由于计算机中保存的小数其实是十进制的小数的近似值，并不是准确值，所以，千万不要在代码中使用浮点数来表示金额等重要的指标。

建议使用BigDecimal或者Long（单位为分）来表示金额。

##### 什么是包装类型、什么是基本类型、什么是自动拆装箱？

## 基本数据类型

基本类型，或者叫做内置类型，是Java中不同于类(Class)的特殊类型。它们是我们编程中使用最频繁的类型。

Java是一种强类型语言，第一次申明变量必须说明数据类型，第一次变量赋值称为变量的初始化。

Java基本类型共有八种，基本类型可以分为三类：

> 字符类型`char`
>
> 布尔类型`boolean`
>
> 数值类型`byte`、`short`、`int`、`long`、`float`、`double`。

数值类型又可以分为整数类型`byte`、`short`、`int`、`long`和浮点数类型`float`、`double`。

Java中的数值类型不存在无符号的，它们的取值范围是固定的，不会随着机器硬件环境或者操作系统的改变而改变。

实际上，Java中还存在另外一种基本类型`void`，它也有对应的包装类 `java.lang.Void`，不过我们无法直接对它们进行操作。

### 基本数据类型有什么好处

我们都知道在Java语言中，`new`一个对象是存储在堆里的，我们通过栈中的引用来使用这些对象；所以，对象本身来说是比较消耗资源的。

对于经常用到的类型，如int等，如果我们每次使用这种变量的时候都需要new一个Java对象的话，就会比较笨重。所以，和C++一样，Java提供了基本数据类型，这种数据的变量不需要使用new创建，他们不会在堆上创建，而是直接在栈内存中存储，因此会更加高效。

### 整型的取值范围

Java中的整型主要包含`byte`、`short`、`int`和`long`这四种，表示的数字范围也是从小到大的，之所以表示范围不同主要和他们存储数据时所占的字节数有关。

先来个简答的科普，1字节=8位（bit）。java中的整型属于有符号数。

先来看计算中8bit可以表示的数字：

```
最小值：10000000 （-128）(-2^7)
最大值：01111111（127）(2^7-1)
```

整型的这几个类型中，

- byte：byte用1个字节来存储，范围为-128(-2^7)到127(2^7-1)，在变量初始化的时候，byte类型的默认值为0。
- short：short用2个字节存储，范围为-32,768 (-2^15)到32,767 (2^15-1)，在变量初始化的时候，short类型的默认值为0，一般情况下，因为Java本身转型的原因，可以直接写为0。
- int：int用4个字节存储，范围为-2,147,483,648 (-2^31)到2,147,483,647 (2^31-1)，在变量初始化的时候，int类型的默认值为0。
- long：long用8个字节存储，范围为-9,223,372,036,854,775,808 (-2^63)到9,223,372,036, 854,775,807 (2^63-1)，在变量初始化的时候，long类型的默认值为0L或0l，也可直接写为0。

### 超出范围怎么办

上面说过了，整型中，每个类型都有一定的表示范围，但是，在程序中有些计算会导致超出表示范围，即溢出。如以下代码：

```
    int i = Integer.MAX_VALUE;
    int j = Integer.MAX_VALUE;

    int k = i + j;
    System.out.println("i (" + i + ") + j (" + j + ") = k (" + k + ")");
```

输出结果：i (2147483647) + j (2147483647) = k (-2)

**这就是发生了溢出，溢出的时候并不会抛异常，也没有任何提示。**所以，在程序中，使用同类型的数据进行运算的时候，**一定要注意数据溢出的问题。**

## 包装类型

Java语言是一个面向对象的语言，但是Java中的基本数据类型却是不面向对象的，这在实际使用时存在很多的不便，为了解决这个不足，在设计类时为每个基本数据类型设计了一个对应的类进行代表，这样八个和基本数据类型对应的类统称为包装类(Wrapper Class)。

包装类均位于java.lang包，包装类和基本数据类型的对应关系如下表所示

| 基本数据类型 | 包装类    |
| ------------ | --------- |
| byte         | Byte      |
| boolean      | Boolean   |
| short        | Short     |
| char         | Character |
| int          | Integer   |
| long         | Long      |
| float        | Float     |
| double       | Double    |

在这八个类名中，除了Integer和Character类以后，其它六个类的类名和基本数据类型一致，只是类名的第一个字母大写即可。

### 为什么需要包装类

很多人会有疑问，既然Java中为了提高效率，提供了八种基本数据类型，为什么还要提供包装类呢？

这个问题，其实前面已经有了答案，因为Java是一种面向对象语言，很多地方都需要使用对象而不是基本数据类型。比如，在集合类中，我们是无法将int 、double等类型放进去的。因为集合的容器要求元素是Object类型。

为了让基本类型也具有对象的特征，就出现了包装类型，它相当于将基本类型“包装起来”，使得它具有了对象的性质，并且为其添加了属性和方法，丰富了基本类型的操作。

## 拆箱与装箱

那么，有了基本数据类型和包装类，肯定有些时候要在他们之间进行转换。比如把一个基本数据类型的int转换成一个包装类型的Integer对象。

我们认为包装类是对基本类型的包装，所以，把基本数据类型转换成包装类的过程就是打包装，英文对应于boxing，中文翻译为装箱。

反之，把包装类转换成基本数据类型的过程就是拆包装，英文对应于unboxing，中文翻译为拆箱。

在Java SE5之前，要进行装箱，可以通过以下代码：

```
    Integer i = new Integer(10);
```

## 自动拆箱与自动装箱

在Java SE5中，为了减少开发人员的工作，Java提供了自动拆箱与自动装箱功能。

自动装箱: 就是将基本数据类型自动转换成对应的包装类。

自动拆箱：就是将包装类自动转换成对应的基本数据类型。

```
    Integer i =10;  //自动装箱
    int b= i;     //自动拆箱
```

`Integer i=10` 可以替代 `Integer i = new Integer(10);`，这就是因为Java帮我们提供了自动装箱的功能，不需要开发者手动去new一个Integer对象。

## 自动装箱与自动拆箱的实现原理

既然Java提供了自动拆装箱的能力，那么，我们就来看一下，到底是什么原理，Java是如何实现的自动拆装箱功能。

我们有以下自动拆装箱的代码：

```
    public static  void main(String[]args){
        Integer integer=1; //装箱
        int i=integer; //拆箱
    }
```

对以上代码进行反编译后可以得到以下代码：

```
    public static  void main(String[]args){
        Integer integer=Integer.valueOf(1); 
        int i=integer.intValue(); 
    }
```

从上面反编译后的代码可以看出，int的自动装箱都是通过`Integer.valueOf()`方法来实现的，Integer的自动拆箱都是通过`integer.intValue`来实现的。如果读者感兴趣，可以试着将八种类型都反编译一遍 ，你会发现以下规律：

> 自动装箱都是通过包装类的`valueOf()`方法来实现的.自动拆箱都是通过包装类对象的`xxxValue()`来实现的。

## 哪些地方会自动拆装箱

我们了解过原理之后，在来看一下，什么情况下，Java会帮我们进行自动拆装箱。前面提到的变量的初始化和赋值的场景就不介绍了，那是最简单的也最容易理解的。

我们主要来看一下，那些可能被忽略的场景。

### 场景一、将基本数据类型放入集合类

我们知道，Java中的集合类只能接收对象类型，那么以下代码为什么会不报错呢？

```
    List<Integer> li = new ArrayList<>();
    for (int i = 1; i < 50; i ++){
        li.add(i);
    }
```

将上面代码进行反编译，可以得到以下代码：

```
    List<Integer> li = new ArrayList<>();
    for (int i = 1; i < 50; i += 2){
        li.add(Integer.valueOf(i));
    }
```

以上，我们可以得出结论，当我们把基本数据类型放入集合类中的时候，会进行自动装箱。

### 场景二、包装类型和基本类型的大小比较

有没有人想过，当我们对Integer对象与基本类型进行大小比较的时候，实际上比较的是什么内容呢？看以下代码：

```
    Integer a=1;
    System.out.println(a==1?"等于":"不等于");
    Boolean bool=false;
    System.out.println(bool?"真":"假");
```

对以上代码进行反编译，得到以下代码：

```
    Integer a=1;
    System.out.println(a.intValue()==1?"等于":"不等于");
    Boolean bool=false;
    System.out.println(bool.booleanValue?"真":"假");
```

可以看到，包装类与基本数据类型进行比较运算，是先将包装类进行拆箱成基本数据类型，然后进行比较的。

### 场景三、包装类型的运算

有没有人想过，当我们对Integer对象进行四则运算的时候，是如何进行的呢？看以下代码：

```
    Integer i = 10;
    Integer j = 20;

    System.out.println(i+j);
```

反编译后代码如下：

```
    Integer i = Integer.valueOf(10);
    Integer j = Integer.valueOf(20);
    System.out.println(i.intValue() + j.intValue());
```

我们发现，两个包装类型之间的运算，会被自动拆箱成基本类型进行。

### 场景四、三目运算符的使用

这是很多人不知道的一个场景，作者也是一次线上的血淋淋的Bug发生后才了解到的一种案例。看一个简单的三目运算符的代码：

```
    boolean flag = true;
    Integer i = 0;
    int j = 1;
    int k = flag ? i : j;
```

很多人不知道，其实在`int k = flag ? i : j;`这一行，会发生自动拆箱。反编译后代码如下：

```
    boolean flag = true;
    Integer i = Integer.valueOf(0);
    int j = 1;
    int k = flag ? i.intValue() : j;
    System.out.println(k);
```

这其实是三目运算符的语法规范。当第二，第三位操作数分别为基本类型和对象时，其中的对象就会拆箱为基本类型进行操作。

因为例子中，`flag ? i : j;`片段中，第二段的i是一个包装类型的对象，而第三段的j是一个基本类型，所以会对包装类进行自动拆箱。如果这个时候i的值为`null`，那么就会发生NPE。（[自动拆箱导致空指针异常](http://www.hollischuang.com/archives/435)）

### 场景五、函数参数与返回值

这个比较容易理解，直接上代码了：

```
    //自动拆箱
    public int getNum1(Integer num) {
     return num;
    }
    //自动装箱
    public Integer getNum2(int num) {
     return num;
    }
```

## 自动拆装箱与缓存

Java SE的自动拆装箱还提供了一个和缓存有关的功能，我们先来看以下代码，猜测一下输出结果：

```
    public static void main(String... strings) {
    
        Integer integer1 = 3;
        Integer integer2 = 3;
    
        if (integer1 == integer2)
            System.out.println("integer1 == integer2");
        else
            System.out.println("integer1 != integer2");
    
        Integer integer3 = 300;
        Integer integer4 = 300;
    
        if (integer3 == integer4)
            System.out.println("integer3 == integer4");
        else
            System.out.println("integer3 != integer4");
    }
```

我们普遍认为上面的两个判断的结果都是false。虽然比较的值是相等的，但是由于比较的是对象，而对象的引用不一样，所以会认为两个if判断都是false的。在Java中，==比较的是对象应用，而equals比较的是值。所以，在这个例子中，不同的对象有不同的引用，所以在进行比较的时候都将返回false。奇怪的是，这里两个类似的if条件判断返回不同的布尔值。

上面这段代码真正的输出结果：

```
integer1 == integer2
integer3 != integer4
```

原因就和Integer中的缓存机制有关。在Java 5中，在Integer的操作上引入了一个新功能来节省内存和提高性能。整型对象通过使用相同的对象引用实现了缓存和重用。

> 适用于整数值区间-128 至 +127。
>
> 只适用于自动装箱。使用构造函数创建对象不适用。

具体的代码实现可以阅读[Java中整型的缓存机制](http://www.hollischuang.com/archives/1174)一文，这里不再阐述。

我们只需要知道，当需要进行自动装箱时，如果数字在-128至127之间时，会直接使用缓存中的对象，而不是重新创建一个对象。

其中的javadoc详细的说明了缓存支持-128到127之间的自动装箱过程。最大值127可以通过`-XX:AutoBoxCacheMax=size`修改。

实际上这个功能在Java 5中引入的时候,范围是固定的-128 至 +127。后来在Java 6中，可以通过`java.lang.Integer.IntegerCache.high`设置最大值。

这使我们可以根据应用程序的实际情况灵活地调整来提高性能。到底是什么原因选择这个-128到127范围呢？因为这个范围的数字是最被广泛使用的。 在程序中，第一次使用Integer的时候也需要一定的额外时间来初始化这个缓存。

在Boxing Conversion部分的Java语言规范(JLS)规定如下：

如果一个变量p的值是：

```
-128至127之间的整数(§3.10.1)

true 和 false的布尔值 (§3.10.3)

‘\u0000’至 ‘\u007f’之间的字符(§3.10.4)
```

范围内的时，将p包装成a和b两个对象时，可以直接使用a==b判断a和b的值是否相等。

## 自动拆装箱带来的问题

当然，自动拆装箱是一个很好的功能，大大节省了开发人员的精力，不再需要关心到底什么时候需要拆装箱。但是，他也会引入一些问题。

> 包装对象的数值比较，不能简单的使用`==`，虽然-128到127之间的数字可以，但是这个范围之外还是需要使用`equals`比较。
>
> 前面提到，有些场景会进行自动拆装箱，同时也说过，由于自动拆箱，如果包装类对象为null，那么自动拆箱时就有可能抛出NPE。
>
> 如果一个for循环中有大量拆装箱操作，会浪费很多资源。

##### 字符串的不可变性？

一旦一个string对象在内存(堆)中被创建出来，他就无法被修改。特别要注意的是，String类的所有方法都没有改变字符串本身的值，都是返回了一个新的对象。

如果你需要一个可修改的字符串，应该使用StringBuffer 或者 StringBuilder。否则会有大量时间浪费在垃圾回收上，因为每次试图修改都有新的string对象被创建出来。

##### JDK 6和JDK 7中substring的原理及区别？

String是Java中一个比较基础的类，每一个开发人员都会经常接触到。而且，String也是面试中经常会考的知识点。String有很多方法，有些方法比较常用，有些方法不太常用。今天要介绍的subString就是一个比较常用的方法，而且围绕subString也有很多面试题。

`substring(int beginIndex, int endIndex)`方法在不同版本的JDK中的实现是不同的。了解他们的区别可以帮助你更好的使用他。为简单起见，后文中用`substring()`代表`substring(int beginIndex, int endIndex)`方法。

## substring() 的作用

`substring(int beginIndex, int endIndex)`方法截取字符串并返回其[beginIndex,endIndex-1]范围内的内容。

```
String x = "abcdef";
x = x.substring(1,3);
System.out.println(x);
```

输出内容：

```
bc
```

## 调用substring()时发生了什么？

你可能知道，因为x是不可变的，当使用`x.substring(1,3)`对x赋值的时候，它会指向一个全新的字符串：

然而，这个图不是完全正确的表示堆中发生的事情。因为在jdk6 和 jdk7中调用substring时发生的事情并不一样。

## JDK 6中的substring

String是通过字符数组实现的。在jdk 6 中，String类包含三个成员变量：`char value[]`， `int offset`，`int count`。他们分别用来存储真正的字符数组，数组的第一个位置索引以及字符串中包含的字符个数。

当调用substring方法的时候，会创建一个新的string对象，但是这个string的值仍然指向堆中的同一个字符数组。这两个对象中只有count和offset 的值是不同的。



下面是证明上说观点的Java源码中的关键代码：

```java
//JDK 6
String(int offset, int count, char value[]) {
    this.value = value;
    this.offset = offset;
    this.count = count;
}

public String substring(int beginIndex, int endIndex) {
    //check boundary
    return  new String(offset + beginIndex, endIndex - beginIndex, value);
}
```

## JDK 6中的substring导致的问题

如果你有一个很长很长的字符串，但是当你使用substring进行切割的时候你只需要很短的一段。这可能导致性能问题，因为你需要的只是一小段字符序列，但是你却引用了整个字符串（因为这个非常长的字符数组一直在被引用，所以无法被回收，就可能导致内存泄露）。在JDK 6中，一般用以下方式来解决该问题，原理其实就是生成一个新的字符串并引用他。

```
x = x.substring(x, y) + ""
```

关于JDK 6中subString的使用不当会导致内存系列已经被官方记录在Java Bug Database中：



> 内存泄露：在计算机科学中，内存泄漏指由于疏忽或错误造成程序未能释放已经不再使用的内存。 内存泄漏并非指内存在物理上的消失，而是应用程序分配某段内存后，由于设计错误，导致在释放该段内存之前就失去了对该段内存的控制，从而造成了内存的浪费。

## JDK 7 中的substring

上面提到的问题，在jdk 7中得到解决。在jdk 7 中，substring方法会在堆内存中创建一个新的数组。

Java源码中关于这部分的主要代码如下：

```java
//JDK 7
public String(char value[], int offset, int count) {
    //check boundary
    this.value = Arrays.copyOfRange(value, offset, offset + count);
}

public String substring(int beginIndex, int endIndex) {
    //check boundary
    int subLen = endIndex - beginIndex;
    return new String(value, beginIndex, subLen);
}
```

以上是JDK 7中的subString方法，其使用`new String`创建了一个新字符串，避免对老字符串的引用。从而解决了内存泄露问题。

所以，如果你的生产环境中使用的JDK版本小于1.7，当你使用String的subString方法时一定要注意，避免内存泄露。

##### String对“+”的重载？

1. String s = "a" + "b"，编译器会进行常量折叠(因为两个都是编译期常量，编译期可知)，即变成 String s = "ab"
2. 对于能够进行优化的(String s = "a" + 变量 等)用 StringBuilder 的 append() 方法替代，最后调用 toString() 方法 (底层就是一个 new String())

##### 字符串拼接的几种方式和区别？

字符串，是Java中最常用的一个数据类型了。

本文，也是对于Java中字符串相关知识的一个补充，主要来介绍一下字符串拼接相关的知识。本文基于jdk1.8.0_181。

### 字符串拼接

字符串拼接是我们在Java代码中比较经常要做的事情，就是把多个字符串拼接到一起。

我们都知道，**String是Java中一个不可变的类**，所以他一旦被实例化就无法被修改。

> 不可变类的实例一旦创建，其成员变量的值就不能被修改。这样设计有很多好处，比如可以缓存hashcode、使用更加便利以及更加安全等。

但是，既然字符串是不可变的，那么字符串拼接又是怎么回事呢？

**字符串不变性与字符串拼接**

其实，所有的所谓字符串拼接，都是重新生成了一个新的字符串。下面一段字符串拼接代码：

```java
String s = "abcd";
s = s.concat("ef");
```

其实最后我们得到的s已经是一个新的字符串了。如下图

s中保存的是一个重新创建出来的String对象的引用。

那么，在Java中，到底如何进行字符串拼接呢？字符串拼接有很多种方式，这里简单介绍几种比较常用的。

**使用+拼接字符串**

在Java中，拼接字符串最简单的方式就是直接使用符号`+`来拼接。如：

```java
String wechat = "Hollis";
String introduce = "每日更新Java相关技术文章";
String hollis = wechat + "," + introduce;
```

这里要特别说明一点，有人把Java中使用`+`拼接字符串的功能理解为**运算符重载**。其实并不是，**Java是不支持运算符重载的**。这其实只是Java提供的一个**语法糖**。后面再详细介绍。

> 运算符重载：在计算机程序设计中，运算符重载（英语：operator overloading）是多态的一种。运算符重载，就是对已有的运算符重新进行定义，赋予其另一种功能，以适应不同的数据类型。
>
> 语法糖：语法糖（Syntactic sugar），也译为糖衣语法，是由英国计算机科学家彼得·兰丁发明的一个术语，指计算机语言中添加的某种语法，这种语法对语言的功能没有影响，但是更方便程序员使用。语法糖让程序更加简洁，有更高的可读性。

**concat**
除了使用`+`拼接字符串之外，还可以使用String类中的方法concat方法来拼接字符串。如：

```java
String wechat = "Hollis";
String introduce = "每日更新Java相关技术文章";
String hollis = wechat.concat(",").concat(introduce);
```

**StringBuffer**

关于字符串，Java中除了定义了一个可以用来定义**字符串常量**的`String`类以外，还提供了可以用来定义**字符串变量**的`StringBuffer`类，它的对象是可以扩充和修改的。

使用`StringBuffer`可以方便的对字符串进行拼接。如：

```java
StringBuffer wechat = new StringBuffer("Hollis");
String introduce = "每日更新Java相关技术文章";
StringBuffer hollis = wechat.append(",").append(introduce);
```

**StringBuilder**
除了`StringBuffer`以外，还有一个类`StringBuilder`也可以使用，其用法和`StringBuffer`类似。如：

```java
StringBuilder wechat = new StringBuilder("Hollis");
String introduce = "每日更新Java相关技术文章";
StringBuilder hollis = wechat.append(",").append(introduce);
```

**StringUtils.join**
除了JDK中内置的字符串拼接方法，还可以使用一些开源类库中提供的字符串拼接方法名，如`apache.commons中`提供的`StringUtils`类，其中的`join`方法可以拼接字符串。

```java
String wechat = "Hollis";
String introduce = "每日更新Java相关技术文章";
System.out.println(StringUtils.join(wechat, ",", introduce));
```

这里简单说一下，StringUtils中提供的join方法，最主要的功能是：将数组或集合以某拼接符拼接到一起形成新的字符串，如：

```java
String []list  ={"Hollis","每日更新Java相关技术文章"};
String result= StringUtils.join(list,",");
System.out.println(result);
//结果：Hollis,每日更新Java相关技术文章
```

并且，Java8中的String类中也提供了一个静态的join方法，用法和StringUtils.join类似。

以上就是比较常用的五种在Java种拼接字符串的方式，那么到底哪种更好用呢？为什么阿里巴巴Java开发手册中不建议在循环体中使用`+`进行字符串拼接呢？

(阿里巴巴Java开发手册中关于字符串拼接的规约)

### 使用`+`拼接字符串的实现原理

前面提到过，使用`+`拼接字符串，其实只是Java提供的一个语法糖， 那么，我们就来解一解这个语法糖，看看他的内部原理到底是如何实现的。

还是这样一段代码。我们把他生成的字节码进行反编译，看看结果。

```java
String wechat = "Hollis";
String introduce = "每日更新Java相关技术文章";
String hollis = wechat + "," + introduce;
```

反编译后的内容如下，反编译工具为jad。

```java
String wechat = "Hollis";
String introduce = "\u6BCF\u65E5\u66F4\u65B0Java\u76F8\u5173\u6280\u672F\u6587\u7AE0";//每日更新Java相关技术文章
String hollis = (new StringBuilder()).append(wechat).append(",").append(introduce).toString();
```

通过查看反编译以后的代码，我们可以发现，原来字符串常量在拼接过程中，是将String转成了StringBuilder后，使用其append方法进行处理的。

那么也就是说，Java中的`+`对字符串的拼接，其实现原理是使用`StringBuilder.append`。

### concat是如何实现的

我们再来看一下concat方法的源代码，看一下这个方法又是如何实现的。

```java
public String concat(String str) {
    int otherLen = str.length();
    if (otherLen == 0) {
        return this;
    }
    int len = value.length;
    char buf[] = Arrays.copyOf(value, len + otherLen);
    str.getChars(buf, len);
    return new String(buf, true);
}
```

这段代码首先创建了一个字符数组，长度是已有字符串和待拼接字符串的长度之和，再把两个字符串的值复制到新的字符数组中，并使用这个字符数组创建一个新的String对象并返回。

通过源码我们也可以看到，经过concat方法，其实是new了一个新的String，这也就呼应到前面我们说的字符串的不变性问题上了。

### StringBuffer和StringBuilder

接下来我们看看`StringBuffer`和`StringBuilder`的实现原理。

和`String`类类似，`StringBuilder`类也封装了一个字符数组，定义如下：

```
char[] value;
```

与`String`不同的是，它并不是`final`的，所以他是可以修改的。另外，与`String`不同，字符数组中不一定所有位置都已经被使用，它有一个实例变量，表示数组中已经使用的字符个数，定义如下：

```
int count;
```

其append源码如下：

```java
public StringBuilder append(String str) {
    super.append(str);
    return this;
}
```

该类继承了`AbstractStringBuilder`类，看下其`append`方法：

```java
public AbstractStringBuilder append(String str) {
    if (str == null)
        return appendNull();
    int len = str.length();
    ensureCapacityInternal(count + len);
    str.getChars(0, len, value, count);
    count += len;
    return this;
}
```

append会直接拷贝字符到内部的字符数组中，如果字符数组长度不够，会进行扩展。

`StringBuffer`和`StringBuilder`类似，最大的区别就是`StringBuffer`是线程安全的，看一下`StringBuffer`的`append`方法。

```java
public synchronized StringBuffer append(String str) {
    toStringCache = null;
    super.append(str);
    return this;
}
```

该方法使用`synchronized`进行声明，说明是一个线程安全的方法。而`StringBuilder`则不是线程安全的。

### StringUtils.join是如何实现的

通过查看`StringUtils.join`的源代码，我们可以发现，其实他也是通过`StringBuilder`来实现的。

```java
public static String join(final Object[] array, String separator, final int startIndex, final int endIndex) {
    if (array == null) {
        return null;
    }
    if (separator == null) {
        separator = EMPTY;
    }

    // endIndex - startIndex > 0:   Len = NofStrings *(len(firstString) + len(separator))
    //           (Assuming that all Strings are roughly equally long)
    final int noOfItems = endIndex - startIndex;
    if (noOfItems <= 0) {
        return EMPTY;
    }

    final StringBuilder buf = new StringBuilder(noOfItems * 16);

    for (int i = startIndex; i < endIndex; i++) {
        if (i > startIndex) {
            buf.append(separator);
        }
        if (array[i] != null) {
            buf.append(array[i]);
        }
    }
    return buf.toString();
}
```

### 效率比较

既然有这么多种字符串拼接的方法，那么到底哪一种效率最高呢？我们来简单对比一下。

```java
long t1 = System.currentTimeMillis();
//这里是初始字符串定义
for (int i = 0; i < 50000; i++) {
    //这里是字符串拼接代码
}
long t2 = System.currentTimeMillis();
System.out.println("cost:" + (t2 - t1));
```

我们使用形如以上形式的代码，分别测试下五种字符串拼接代码的运行时间。得到结果如下：

```
+ cost:5119
StringBuilder cost:3
StringBuffer cost:4
concat cost:3623
StringUtils.join cost:25726
```

从结果可以看出，用时从短到长的对比是：

```
StringBuilder`<`StringBuffer`<`concat`<`+`<`StringUtils.join
```

`StringBuffer`在`StringBuilder`的基础上，做了同步处理，所以在耗时上会相对多一些。

StringUtils.join也是使用了StringBuilder，并且其中还是有很多其他操作，所以耗时较长，这个也容易理解。其实StringUtils.join更擅长处理字符串数组或者列表的拼接。

那么问题来了，前面我们分析过，其实使用`+`拼接字符串的实现原理也是使用的`StringBuilder`，那为什么结果相差这么多，高达1000多倍呢？

我们再把以下代码反编译下：

```java
long t1 = System.currentTimeMillis();
String str = "hollis";
for (int i = 0; i < 50000; i++) {
    String s = String.valueOf(i);
    str += s;
}
long t2 = System.currentTimeMillis();
System.out.println("+ cost:" + (t2 - t1));
```

反编译后代码如下：

```java
long t1 = System.currentTimeMillis();
String str = "hollis";
for(int i = 0; i < 50000; i++)
{
    String s = String.valueOf(i);
    str = (new StringBuilder()).append(str).append(s).toString();
}

long t2 = System.currentTimeMillis();
System.out.println((new StringBuilder()).append("+ cost:").append(t2 - t1).toString());
```

我们可以看到，反编译后的代码，在`for`循环中，每次都是`new`了一个`StringBuilder`，然后再把`String`转成`StringBuilder`，再进行`append`。

而频繁的新建对象当然要耗费很多时间了，不仅仅会耗费时间，频繁的创建对象，还会造成内存资源的浪费。

所以，阿里巴巴Java开发手册建议：循环体内，字符串的连接方式，使用 `StringBuilder` 的 `append` 方法进行扩展。而不要使用`+`。

### 总结

本文介绍了什么是字符串拼接，虽然字符串是不可变的，但是还是可以通过新建字符串的方式来进行字符串的拼接。

常用的字符串拼接方式有五种，分别是使用`+`、使用`concat`、使用`StringBuilder`、使用`StringBuffer`以及使用`StringUtils.join`。

由于字符串拼接过程中会创建新的对象，所以如果要在一个循环体中进行字符串拼接，就要考虑内存问题和效率问题。

因此，经过对比，我们发现，直接使用`StringBuilder`的方式是效率最高的。因为`StringBuilder`天生就是设计来定义可变字符串和字符串的变化操作的。

但是，还要强调的是：

1、如果不是在循环体中进行字符串拼接的话，直接使用`+`就好了。

2、如果在并发场景中进行字符串拼接的话，要使用`StringBuffer`来代替`StringBuilder`。

##### String.valueOf和Integer.toString的区别?

我们有三种方式将一个int类型的变量变成呢过String类型，那么他们有什么区别？

```
1.int i = 5;
2.String i1 = "" + i;
3.String i2 = String.valueOf(i);
4.String i3 = Integer.toString(i);
```

第三行和第四行没有任何区别，因为String.valueOf(i)也是调用Integer.toString(i)来实现的。

第二行代码其实是String i1 = (new StringBuilder()).append(i).toString();，首先创建一个StringBuilder对象，然后再调用append方法，再调用toString方法。

##### switch对String的支持？

Java 7中，switch的参数可以是String类型了，这对我们来说是一个很方便的改进。到目前为止switch支持这样几种数据类型：`byte` `short` `int` `char` `String` 。但是，作为一个程序员我们不仅要知道他有多么好用，还要知道它是如何实现的，switch对整型的支持是怎么实现的呢？对字符型是怎么实现的呢？String类型呢？有一点Java开发经验的人这个时候都会猜测switch对String的支持是使用equals()方法和hashcode()方法。那么到底是不是这两个方法呢？接下来我们就看一下，switch到底是如何实现的。

### 一、switch对整型支持的实现

下面是一段很简单的Java代码，定义一个int型变量a，然后使用switch语句进行判断。执行这段代码输出内容为5，那么我们将下面这段代码反编译，看看他到底是怎么实现的。

```
public class switchDemoInt {
    public static void main(String[] args) {
        int a = 5;
        switch (a) {
        case 1:
            System.out.println(1);
            break;
        case 5:
            System.out.println(5);
            break;
        default:
            break;
        }
    }
}
//output 5
```

反编译后的代码如下：

```
public class switchDemoInt
{
    public switchDemoInt()
    {
    }
    public static void main(String args[])
    {
        int a = 5;
        switch(a)
        {
        case 1: // '\001'
            System.out.println(1);
            break;

        case 5: // '\005'
            System.out.println(5);
            break;
        }
    }
}
```

我们发现，反编译后的代码和之前的代码比较除了多了两行注释以外没有任何区别，那么我们就知道，**switch对int的判断是直接比较整数的值**。

### 二、switch对字符型支持的实现

直接上代码：

```
public class switchDemoInt {
    public static void main(String[] args) {
        char a = 'b';
        switch (a) {
        case 'a':
            System.out.println('a');
            break;
        case 'b':
            System.out.println('b');
            break;
        default:
            break;
        }
    }
}
```

编译后的代码如下： `public class switchDemoChar

```
public class switchDemoChar
{
    public switchDemoChar()
    {
    }
    public static void main(String args[])
    {
        char a = 'b';
        switch(a)
        {
        case 97: // 'a'
            System.out.println('a');
            break;
        case 98: // 'b'
            System.out.println('b');
            break;
        }
  }
}
```

通过以上的代码作比较我们发现：对char类型进行比较的时候，实际上比较的是ascii码，编译器会把char型变量转换成对应的int型变量

### 三、switch对字符串支持的实现

还是先上代码：

```
public class switchDemoString {
    public static void main(String[] args) {
        String str = "world";
        switch (str) {
        case "hello":
            System.out.println("hello");
            break;
        case "world":
            System.out.println("world");
            break;
        default:
            break;
        }
    }
}
```

对代码进行反编译：

```
public class switchDemoString
{
    public switchDemoString()
    {
    }
    public static void main(String args[])
    {
        String str = "world";
        String s;
        switch((s = str).hashCode())
        {
        default:
            break;
        case 99162322:
            if(s.equals("hello"))
                System.out.println("hello");
            break;
        case 113318802:
            if(s.equals("world"))
                System.out.println("world");
            break;
        }
    }
}
```

看到这个代码，你知道原来字符串的switch是通过`equals()`和`hashCode()`方法来实现的。**记住，switch中只能使用整型**，比如`byte`。`short`，`char`(ackii码是整型)以及`int`。还好`hashCode()`方法返回的是`int`，而不是`long`。通过这个很容易记住`hashCode`返回的是`int`这个事实。仔细看下可以发现，进行`switch`的实际是哈希值，然后通过使用equals方法比较进行安全检查，这个检查是必要的，因为哈希可能会发生碰撞。因此它的性能是不如使用枚举进行switch或者使用纯整数常量，但这也不是很差。因为Java编译器只增加了一个`equals`方法，如果你比较的是字符串字面量的话会非常快，比如”abc” ==”abc”。如果你把`hashCode()`方法的调用也考虑进来了，那么还会再多一次的调用开销，因为字符串一旦创建了，它就会把哈希值缓存起来。因此如果这个`switch`语句是用在一个循环里的，比如逐项处理某个值，或者游戏引擎循环地渲染屏幕，这里`hashCode()`方法的调用开销其实不会很大。

好，以上就是关于switch对整型、字符型、和字符串型的支持的实现方式，总结一下我们可以发现，**其实switch只支持一种数据类型，那就是整型，其他数据类型都是转换成整型之后在使用switch的。**

##### ArrayList和LinkedList和Vector的区别？

List主要有ArrayList、LinkedList与Vector几种实现。

这三者都实现了List 接口，使用方式也很相似,主要区别在于因为实现方式的不同,所以对不同的操作具有不同的效率。

ArrayList 是一个可改变大小的数组.当更多的元素加入到ArrayList中时,其大小将会动态地增长.内部的元素可以直接通过get与set方法进行访问,因为ArrayList本质上就是一个数组.

LinkedList 是一个双链表,在添加和删除元素时具有比ArrayList更好的性能.但在get与set方面弱于ArrayList.

当然,这些对比都是指数据量很大或者操作很频繁的情况下的对比,如果数据和运算量很小,那么对比将失去意义.

Vector 和ArrayList类似,但属于强同步类。如果你的程序本身是线程安全的(thread-safe,没有在多个线程之间共享同一个集合/对象),那么使用ArrayList是更好的选择。

Vector和ArrayList在更多元素添加进来时会请求更大的空间。Vector每次请求其大小的双倍空间，而ArrayList每次对size增长50%.

而 LinkedList 还实现了 Queue 接口,该接口比List提供了更多的方法,包括 offer(),peek(),poll()等.

注意: 默认情况下ArrayList的初始容量非常小,所以如果可以预估数据量的话,分配一个较大的初始值属于最佳实践,这样可以减少调整大小的开销。

##### SynchronizedList和Vector的区别？

Vector是java.util包中的一个类。 SynchronizedList是java.util.Collections中的一个静态内部类。

在多线程的场景中可以直接使用Vector类，也可以使用Collections.synchronizedList(List list)方法来返回一个线程安全的List。

**那么，到底SynchronizedList和Vector有没有区别，为什么java api要提供这两种线程安全的List的实现方式呢？**

首先，我们知道Vector和Arraylist都是List的子类，他们底层的实现都是一样的。所以这里比较如下两个`list1`和`list2`的区别：

```
List<String> list = new ArrayList<String>();
List list2 =  Collections.synchronizedList(list);
Vector<String> list1 = new Vector<String>();
```

## 一、比较几个重要的方法。

### 1.1 add方法

**Vector的实现：**

```
public void add(int index, E element) {
    insertElementAt(element, index);
}

public synchronized void insertElementAt(E obj, int index) {
    modCount++;
    if (index > elementCount) {
        throw new ArrayIndexOutOfBoundsException(index
                                                 + " > " + elementCount);
    }
    ensureCapacityHelper(elementCount + 1);
    System.arraycopy(elementData, index, elementData, index + 1, elementCount - index);
    elementData[index] = obj;
    elementCount++;
}

private void ensureCapacityHelper(int minCapacity) {
    // overflow-conscious code
    if (minCapacity - elementData.length > 0)
        grow(minCapacity);
}
```

**synchronizedList的实现：**

```
public void add(int index, E element) {
   synchronized (mutex) {
       list.add(index, element);
   }
}
```

这里，使用同步代码块的方式调用ArrayList的add()方法。ArrayList的add方法内容如下：

```
public void add(int index, E element) {
    rangeCheckForAdd(index);
    ensureCapacityInternal(size + 1);  // Increments modCount!!
    System.arraycopy(elementData, index, elementData, index + 1,
                     size - index);
    elementData[index] = element;
    size++;
}
private void rangeCheckForAdd(int index) {
    if (index > size || index < 0)
        throw new IndexOutOfBoundsException(outOfBoundsMsg(index));
}
private void ensureCapacityInternal(int minCapacity) {
    if (elementData == DEFAULTCAPACITY_EMPTY_ELEMENTDATA) {
        minCapacity = Math.max(DEFAULT_CAPACITY, minCapacity);
    }
    ensureExplicitCapacity(minCapacity);
}
```

从上面两段代码中发现有两处不同： **1.Vector使用同步方法实现，synchronizedList使用同步代码块实现。 2.两者的扩充数组容量方式不一样（两者的add方法在扩容方面的差别也就是ArrayList和Vector的差别。）**

### 1.2 remove方法

**synchronizedList的实现：**

```
public E remove(int index) {
    synchronized (mutex) {return list.remove(index);}
}
```

ArrayList类的remove方法内容如下：

```
public E remove(int index) {
    rangeCheck(index);

    modCount++;
    E oldValue = elementData(index);

    int numMoved = size - index - 1;
    if (numMoved > 0)
        System.arraycopy(elementData, index+1, elementData, index,
                         numMoved);
    elementData[--size] = null; // clear to let GC do its work

    return oldValue;
}
```

**Vector的实现：**

```
public synchronized E remove(int index) {
        modCount++;
        if (index >= elementCount)
            throw new ArrayIndexOutOfBoundsException(index);
        E oldValue = elementData(index);

        int numMoved = elementCount - index - 1;
        if (numMoved > 0)
            System.arraycopy(elementData, index+1, elementData, index,
                             numMoved);
        elementData[--elementCount] = null; // Let gc do its work

        return oldValue;
    }
```

**从remove方法中我们发现除了一个使用同步方法，一个使用同步代码块之外几乎无任何区别。**

> 通过比较其他方法，我们发现，SynchronizedList里面实现的方法几乎都是使用同步代码块包上List的方法。如果该List是ArrayList,那么，SynchronizedList和Vector的一个比较明显区别就是一个使用了同步代码块，一个使用了同步方法。

## 三、区别分析

**数据增长区别**

> 从内部实现机制来讲ArrayList和Vector都是使用数组(Array)来控制集合中的对象。当你向这两种类型中增加元素的时候，如果元素的数目超出了内部数组目前的长度它们都需要扩展内部数组的长度，Vector缺省情况下自动增长原来一倍的数组长度，ArrayList是原来的50%,所以最后你获得的这个集合所占的空间总是比你实际需要的要大。所以如果你要在集合中保存大量的数据那么使用Vector有一些优势，因为你可以通过设置集合的初始化大小来避免不必要的资源开销。

**同步代码块和同步方法的区别** 1.同步代码块在锁定的范围上可能比同步方法要小，一般来说锁的范围大小和性能是成反比的。 2.同步块可以更加精确的控制锁的作用域（锁的作用域就是从锁被获取到其被释放的时间），同步方法的锁的作用域就是整个方法。 3.静态代码块可以选择对哪个对象加锁，但是静态方法只能给this对象加锁。

> 因为SynchronizedList只是使用同步代码块包裹了ArrayList的方法，而ArrayList和Vector中同名方法的方法体内容并无太大差异，所以在锁定范围和锁的作用域上两者并无却别。 在锁定的对象区别上，SynchronizedList的同步代码块锁定的是mutex对象，Vector锁定的是this对象。那么mutex对象又是什么呢？ 其实SynchronizedList有一个构造函数可以传入一个Object,如果在调用的时候显示的传入一个对象，那么锁定的就是用户传入的对象。如果没有指定，那么锁定的也是this对象。

所以，SynchronizedList和Vector的区别目前为止有两点： 1.如果使用add方法，那么他们的扩容机制不一样。 2.SynchronizedList可以指定锁定的对象。

但是，凡事都有但是。 SynchronizedList中实现的类并没有都使用synchronized同步代码块。其中有listIterator和listIterator(int index)并没有做同步处理。但是Vector却对该方法加了方法锁。 所以说，在使用SynchronizedList进行遍历的时候要手动加锁。

但是，但是之后还有但是。

之前的比较都是基于我们将ArrayList转成SynchronizedList。那么如果我们想把LinkedList变成线程安全的，或者说我想要方便在中间插入和删除的同步的链表，那么我可以将已有的LinkedList直接转成 SynchronizedList，而不用改变他的底层数据结构。而这一点是Vector无法做到的，因为他的底层结构就是使用数组实现的，这个是无法更改的。

所以，最后，SynchronizedList和Vector最主要的区别： **1.SynchronizedList有很好的扩展和兼容功能。他可以将所有的List的子类转成线程安全的类。** **2.使用SynchronizedList的时候，进行遍历时要手动进行同步处理**。 **3.SynchronizedList可以指定锁定的对象。**

##### HashMap、HashTable、ConcurrentHashMap区别？

### HashMap和HashTable有何不同？

线程安全：

HashTable 中的方法是同步的，而HashMap中的方法在默认情况下是非同步的。在多线程并发的环境下，可以直接使用HashTable，但是要使用HashMap的话就要自己增加同步处理了。

继承关系： HashTable是基于陈旧的Dictionary类继承来的。 HashMap继承的抽象类AbstractMap实现了Map接口。

允不允许null值： HashTable中，key和value都不允许出现null值，否则会抛出NullPointerException异常。 HashMap中，null可以作为键，这样的键只有一个；可以有一个或多个键所对应的值为null。

默认初始容量和扩容机制： HashTable中的hash数组初始大小是11，增加的方式是 old*2+1。HashMap中hash数组的默认大小是16，而且一定是2的指数。原因参考全网把Map中的hash()分析的最透彻的文章，别无二家。-HollisChuang's Blog

哈希值的使用不同 ： HashTable直接使用对象的hashCode。 HashMap重新计算hash值。

遍历方式的内部实现上不同 ： Hashtable、HashMap都使用了 Iterator。而由于历史原因，Hashtable还使用了Enumeration的方式 。 HashMap 实现 Iterator，支持fast-fail，Hashtable的 Iterator 遍历支持fast-fail，用 Enumeration 不支持 fast-fail

### HashMap 和 ConcurrentHashMap 的区别？

ConcurrentHashMap和HashMap的实现方式不一样，虽然都是使用桶数组实现的，但是还是有区别，ConcurrentHashMap对桶数组进行了分段，而HashMap并没有。

ConcurrentHashMap在每一个分段上都用锁进行了保护。HashMap没有锁机制。所以，前者线程安全的，后者不是线程安全的。

PS：以上区别基于jdk1.8以前的版本。

##### Set和List区别？

List,Set都是继承自Collection接口。都是用来存储一组相同类型的元素的。

List特点：元素有放入顺序，元素可重复 。

有顺序，即先放入的元素排在前面。

Set特点：元素无放入顺序，元素不可重复。

无顺序，即先放入的元素不一定排在前面。 不可重复，即相同元素在set中只会保留一份。所以，有些场景下，set可以用来去重。 不过需要注意的是，set在元素插入时是要有一定的方法来判断元素是否重复的。这个方法很重要，决定了set中可以保存哪些元素。

##### Set如何保证元素不重复?

在Java的Set体系中，根据实现方式不同主要分为两大类。HashSet和TreeSet。

1、TreeSet 是二差树实现的,Treeset中的数据是自动排好序的，不允许放入null值 2、HashSet 是哈希表实现的,HashSet中的数据是无序的，可以放入null，但只能放入一个null，两者中的值都不能重复，就如数据库中唯一约束

在HashSet中，基本的操作都是有HashMap底层实现的，因为HashSet底层是用HashMap存储数据的。当向HashSet中添加元素的时候，首先计算元素的hashcode值，然后通过扰动计算和按位与的方式计算出这个元素的存储位置，如果这个位置位空，就将元素添加进去；如果不为空，则用equals方法比较元素是否相等，相等就不添加，否则找一个空位添加。

TreeSet的底层是TreeMap的keySet()，而TreeMap是基于红黑树实现的，红黑树是一种平衡二叉查找树，它能保证任何一个节点的左右子树的高度差不会超过较矮的那棵的一倍。

TreeMap是按key排序的，元素在插入TreeSet时compareTo()方法要被调用，所以TreeSet中的元素要实现Comparable接口。TreeSet作为一种Set，它不允许出现重复元素。TreeSet是用compareTo()来判断重复元素的。

##### Java 8中stream相关用法?

在Java中，集合和数组是我们经常会用到的数据结构，需要经常对他们做增、删、改、查、聚合、统计、过滤等操作。相比之下，关系型数据库中也同样有这些操作，但是在Java 8之前，集合和数组的处理并不是很便捷。

不过，这一问题在Java 8中得到了改善，Java 8 API添加了一个新的抽象称为流Stream，可以让你以一种声明的方式处理数据。本文就来介绍下如何使用Stream。特别说明一下，关于Stream的性能及原理不是本文的重点，如果大家感兴趣后面会出文章单独介绍。

### Stream介绍

Stream 使用一种类似用 SQL 语句从数据库查询数据的直观方式来提供一种对 Java 集合运算和表达的高阶抽象。

Stream API可以极大提高Java程序员的生产力，让程序员写出高效率、干净、简洁的代码。

这种风格将要处理的元素集合看作一种流，流在管道中传输，并且可以在管道的节点上进行处理，比如筛选，排序，聚合等。

Stream有以下特性及优点：

- 无存储。Stream不是一种数据结构，它只是某种数据源的一个视图，数据源可以是一个数组，Java容器或I/O channel等。
- 为函数式编程而生。对Stream的任何修改都不会修改背后的数据源，比如对Stream执行过滤操作并不会删除被过滤的元素，而是会产生一个不包含被过滤元素的新Stream。
- 惰式执行。Stream上的操作并不会立即执行，只有等到用户真正需要结果的时候才会执行。
- 可消费性。Stream只能被“消费”一次，一旦遍历过就会失效，就像容器的迭代器那样，想要再次遍历必须重新生成。

对于流的处理，主要有三种关键性操作：分别是流的创建、中间操作（intermediate operation）以及最终操作(terminal operation)。

### Stream的创建

在Java 8中，可以有多种方法来创建流。

**1、通过已有的集合来创建流**

在Java 8中，除了增加了很多Stream相关的类以外，还对集合类自身做了增强，在其中增加了stream方法，可以将一个集合类转换成流。

```java
List<String> strings = Arrays.asList("Hollis", "HollisChuang", "hollis", "Hello", "HelloWorld", "Hollis");
Stream<String> stream = strings.stream();
```

以上，通过一个已有的List创建一个流。除此以外，还有一个parallelStream方法，可以为集合创建一个并行流。

这种通过集合创建出一个Stream的方式也是比较常用的一种方式。

**2、通过Stream创建流**

可以使用Stream类提供的方法，直接返回一个由指定元素组成的流。

```
Stream<String> stream = Stream.of("Hollis", "HollisChuang", "hollis", "Hello", "HelloWorld", "Hollis");
```

如以上代码，直接通过of方法，创建并返回一个Stream。

### Stream中间操作

Stream有很多中间操作，多个中间操作可以连接起来形成一个流水线，每一个中间操作就像流水线上的一个工人，每人工人都可以对流进行加工，加工后得到的结果还是一个流。

常用的中间操作:

**filter**

filter 方法用于通过设置的条件过滤出元素。以下代码片段使用 filter 方法过滤掉空字符串：

```java
List<String> strings = Arrays.asList("Hollis", "", "HollisChuang", "H", "hollis");
strings.stream().filter(string -> !string.isEmpty()).forEach(System.out::println);
//Hollis, , HollisChuang, H, hollis
```

**map**

map 方法用于映射每个元素到对应的结果，以下代码片段使用 map 输出了元素对应的平方数：

```java
List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);
numbers.stream().map( i -> i*i).forEach(System.out::println);
//9,4,4,9,49,9,25
```

**limit/skip**

limit 返回 Stream 的前面 n 个元素；skip 则是扔掉前 n 个元素。以下代码片段使用 limit 方法保理4个元素：

```java
List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);
numbers.stream().limit(4).forEach(System.out::println);
//3,2,2,3
```

**sorted**

sorted 方法用于对流进行排序。以下代码片段使用 sorted 方法进行排序：

```java
List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);
numbers.stream().sorted().forEach(System.out::println);
//2,2,3,3,3,5,7
```

**distinct**

distinct主要用来去重，以下代码片段使用 distinct 对元素进行去重：

```java
List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);
numbers.stream().distinct().forEach(System.out::println);
//3,2,7,5
```

接下来我们通过一个例子和一张图，来演示下，当一个Stream先后通过filter、map、sort、limit以及distinct处理后会发生什么。

代码如下：

```java
List<String> strings = Arrays.asList("Hollis", "HollisChuang", "hollis", "Hello", "HelloWorld", "Hollis");
Stream s = strings.stream().filter(string -> string.length()<= 6).map(String::length).sorted().limit(3)
            .distinct();
```

### Stream最终操作

Stream的中间操作得到的结果还是一个Stream，那么如何把一个Stream转换成我们需要的类型呢？比如计算出流中元素的个数、将流装换成集合等。这就需要最终操作（terminal operation）

最终操作会消耗流，产生一个最终结果。也就是说，在最终操作之后，不能再次使用流，也不能在使用任何中间操作，否则将抛出异常：

```
java.lang.IllegalStateException: stream has already been operated upon or closed
```

俗话说，“你永远不会两次踏入同一条河”也正是这个意思。

常用的最终操作如下:

**forEach**

Stream 提供了方法 'forEach' 来迭代流中的每个数据。以下代码片段使用 forEach 输出了10个随机数：

```java
Random random = new Random();
random.ints().limit(10).forEach(System.out::println);
```

**count**

count用来统计流中的元素个数。

```java
List<String> strings = Arrays.asList("Hollis", "HollisChuang", "hollis","Hollis666", "Hello", "HelloWorld", "Hollis");
System.out.println(strings.stream().count());
//7
```

**collect**

collect就是一个归约操作，可以接受各种做法作为参数，将流中的元素累积成一个汇总结果：

```java
List<String> strings = Arrays.asList("Hollis", "HollisChuang", "hollis","Hollis666", "Hello", "HelloWorld", "Hollis");
strings  = strings.stream().filter(string -> string.startsWith("Hollis")).collect(Collectors.toList());
System.out.println(strings);
//Hollis, HollisChuang, Hollis666, Hollis
```

接下来，我们还是使用一张图，来演示下，前文的例子中，当一个Stream先后通过filter、map、sort、limit以及distinct处理后会，在分别使用不同的最终操作可以得到怎样的结果：

下图，展示了文中介绍的所有操作的位置、输入、输出以及使用一个案例展示了其结果。 

### 总结

本文介绍了Java 8中的Stream 的用途，优点等。还接受了Stream的几种用法，分别是Stream创建、中间操作和最终操作。

Stream的创建有两种方式，分别是通过集合类的stream方法、通过Stream的of方法。

Stream的中间操作可以用来处理Stream，中间操作的输入和输出都是Stream，中间操作可以是过滤、转换、排序等。

Stream的最终操作可以将Stream转成其他形式，如计算出流中元素的个数、将流装换成集合、以及元素的遍历等。

##### Collection和Collections区别?

Collection 是一个集合接口。 它提供了对集合对象进行基本操作的通用接口方法。Collection接口在Java 类库中有很多具体的实现。是list，set等的父接口。

Collections 是一个包装类。 它包含有各种有关集合操作的静态多态方法。此类不能实例化，就像一个工具类，服务于Java的Collection框架。

日常开发中，不仅要了解Java中的Collection及其子类的用法，还要了解Collections用法。可以提升很多处理集合类的效率。

##### Arrays.asList获得的List使用时需要注意什么?

1. asList 得到的只是一个 Arrays 的内部类，一个原来数组的视图 List，因此如果对它进行增删操作会报错
2. 用 ArrayList 的构造器可以将其转变成真正的 ArrayList

##### Enumeration和Iterator区别？

函数接口不同

```
    Enumeration只有2个函数接口。通过Enumeration，我们只能读取集合的数据，而不能对数据进行修改。
    Iterator只有3个函数接口。Iterator除了能读取集合的数据之外，也能数据进行删除操作。
```

Iterator支持fail-fast机制，而Enumeration不支持。

```
    Enumeration 是JDK 1.0添加的接口。使用到它的函数包括Vector、Hashtable等类，这些类都是JDK 1.0中加入的，Enumeration存在的目的就是为它们提供遍历接口。Enumeration本身并没有支持同步，而在Vector、Hashtable实现Enumeration时，添加了同步。
    而Iterator 是JDK 1.2才添加的接口，它也是为了HashMap、ArrayList等集合提供遍历接口。Iterator是支持fail-fast机制的：当多个线程对同一个集合的内容进行操作时，就可能会产生fail-fast事件。
```

注意：Enumeration迭代器只能遍历Vector、Hashtable这种古老的集合，因此通常不要使用它，除非在某些极端情况下，不得不使用Enumeration，否则都应该选择Iterator迭代器。

##### fail-fast 和 fail-safe？

### 什么是fail-fast

首先我们看下维基百科中关于fail-fast的解释：

> In systems design, a fail-fast system is one which immediately reports at its interface any condition that is likely to indicate a failure. Fail-fast systems are usually designed to stop normal operation rather than attempt to continue a possibly flawed process. Such designs often check the system's state at several points in an operation, so any failures can be detected early. The responsibility of a fail-fast module is detecting errors, then letting the next-highest level of the system handle them.

大概意思是：在系统设计中，快速失效系统一种可以立即报告任何可能表明故障的情况的系统。快速失效系统通常设计用于停止正常操作，而不是试图继续可能存在缺陷的过程。这种设计通常会在操作中的多个点检查系统的状态，因此可以及早检测到任何故障。快速失败模块的职责是检测错误，然后让系统的下一个最高级别处理错误。

其实，这是一种理念，说白了就是在做系统设计的时候先考虑异常情况，一旦发生异常，直接停止并上报。

举一个最简单的fail-fast的例子：

```java
public int divide(int divisor,int dividend){
    if(dividend == 0){
        throw new RuntimeException("dividend can't be null");
    }
    return divisor/dividend;
}
```

上面的代码是一个对两个整数做除法的方法，在divide方法中，我们对被除数做了个简单的检查，如果其值为0，那么就直接抛出一个异常，并明确提示异常原因。这其实就是fail-fast理念的实际应用。

这样做的好处就是可以预先识别出一些错误情况，一方面可以避免执行复杂的其他代码，另外一方面，这种异常情况被识别之后也可以针对性的做一些单独处理。

怎么样，现在你知道fail-fast了吧，其实他并不神秘，你日常的代码中可能经常会在使用的。

既然，fail-fast是一种比较好的机制，为什么文章标题说fail-fast会有坑呢？

原因是Java的集合类中运用了fail-fast机制进行设计，一旦使用不当，触发fail-fast机制设计的代码，就会发生非预期情况。

### 集合类中的fail-fast

我们通常说的Java中的fail-fast机制，默认指的是Java集合的一种错误检测机制。当多个线程对部分集合进行结构上的改变的操作时，有可能会产生fail-fast机制，这个时候就会抛出ConcurrentModificationException（后文用CME代替）。

CMException，当方法检测到对象的并发修改，但不允许这种修改时就抛出该异常。

很多时候正是因为代码中抛出了CMException，很多程序员就会很困惑，明明自己的代码并没有在多线程环境中执行，为什么会抛出这种并发有关的异常呢？这种情况在什么情况下才会抛出呢？我们就来深入分析一下。

### 异常复现

在Java中， 如果在foreach 循环里对某些集合元素进行元素的 remove/add 操作的时候，就会触发fail-fast机制，进而抛出CMException。

如以下代码：

```java
List<String> userNames = new ArrayList<String>() {{
    add("Hollis");
    add("hollis");
    add("HollisChuang");
    add("H");
}};

for (String userName : userNames) {
    if (userName.equals("Hollis")) {
        userNames.remove(userName);
    }
}

System.out.println(userNames);
```

以上代码，使用增强for循环遍历元素，并尝试删除其中的Hollis字符串元素。运行以上代码，会抛出以下异常：

```java
Exception in thread "main" java.util.ConcurrentModificationException
at java.util.ArrayList$Itr.checkForComodification(ArrayList.java:909)
at java.util.ArrayList$Itr.next(ArrayList.java:859)
at com.hollis.ForEach.main(ForEach.java:22)
```

同样的，读者可以尝试下在增强for循环中使用add方法添加元素，结果也会同样抛出该异常。

在深入原理之前，我们先尝试把foreach进行解语法糖，看一下foreach具体如何实现的。

我们使用[jad](https://www.hollischuang.com/archives/58)工具，对编译后的class进行反编译，得到以下代码：

```java
public static void main(String[] args) {
    // 使用ImmutableList初始化一个List
    List<String> userNames = new ArrayList<String>() {{
        add("Hollis");
        add("hollis");
        add("HollisChuang");
        add("H");
    }};

    Iterator iterator = userNames.iterator();
    do
    {
        if(!iterator.hasNext())
            break;
        String userName = (String)iterator.next();
        if(userName.equals("Hollis"))
            userNames.remove(userName);
    } while(true);
    System.out.println(userNames);
}
```

可以发现，foreach其实是依赖了while循环和Iterator实现的。

### 异常原理

通过以上代码的异常堆栈，我们可以跟踪到真正抛出异常的代码是：

```
java.util.ArrayList$Itr.checkForComodification(ArrayList.java:909)
```

该方法是在iterator.next()方法中调用的。我们看下该方法的实现：

```java
final void checkForComodification() {
    if (modCount != expectedModCount)
        throw new ConcurrentModificationException();
}
```

如上，在该方法中对modCount和expectedModCount进行了比较，如果二者不想等，则抛出CMException。

那么，modCount和expectedModCount是什么？是什么原因导致他们的值不想等的呢？

modCount是ArrayList中的一个成员变量。它表示该集合实际被修改的次数。

```java
List<String> userNames = new ArrayList<String>() {{
    add("Hollis");
    add("hollis");
    add("HollisChuang");
    add("H");
}};
```

当使用以上代码初始化集合之后该变量就有了。初始值为0。

expectedModCount 是 ArrayList中的一个内部类——Itr中的成员变量。

```java
Iterator iterator = userNames.iterator();
```

以上代码，即可得到一个 Itr类，该类实现了Iterator接口。

expectedModCount表示这个迭代器预期该集合被修改的次数。其值随着Itr被创建而初始化。只有通过迭代器对集合进行操作，该值才会改变。

那么，接着我们看下userNames.remove(userName);方法里面做了什么事情，为什么会导致expectedModCount和modCount的值不一样。

通过翻阅代码，我们也可以发现，remove方法核心逻辑如下：

```java
private void fastRemove(int index) {
    modCount++;
    int numMoved = size - index - 1;
    if (numMoved > 0)
        System.arraycopy(elementData, index+1, elementData, index,
                         numMoved);
    elementData[--size] = null; // clear to let GC do its work
}
```

可以看到，它只修改了modCount，并没有对expectedModCount做任何操作。

简单总结一下，之所以会抛出CMException异常，是因为我们的代码中使用了增强for循环，而在增强for循环中，集合遍历是通过iterator进行的，但是元素的add/remove却是直接使用的集合类自己的方法。这就导致iterator在遍历的时候，会发现有一个元素在自己不知不觉的情况下就被删除/添加了，就会抛出一个异常，用来提示用户，可能发生了并发修改！

所以，在使用Java的集合类的时候，如果发生CMException，优先考虑fail-fast有关的情况，实际上这里并没有真的发生并发，只是Iterator使用了fail-fast的保护机制，只要他发现有某一次修改是未经过自己进行的，那么就会抛出异常。

关于如何解决这种问题，我们在《为什么阿里巴巴禁止在 foreach 循环里进行元素的 remove/add 操作》中介绍过，这里不再赘述了。

##### CopyOnWriteArrayList?

Copy-On-Write简称COW，是一种用于程序设计中的优化策略。其基本思路是，从一开始大家都在共享同一个内容，当某个人想要修改这个内容的时候，才会真正把内容Copy出去形成一个新的内容然后再改，这是一种延时懒惰策略。从JDK1.5开始Java并发包里提供了两个使用CopyOnWrite机制实现的并发容器,它们是CopyOnWriteArrayList和CopyOnWriteArraySet。CopyOnWrite容器非常有用，可以在非常多的并发场景中使用到。

CopyOnWriteArrayList相当于线程安全的ArrayList，CopyOnWriteArrayList使用了一种叫写时复制的方法，当有新元素add到CopyOnWriteArrayList时，先从原有的数组中拷贝一份出来，然后在新的数组做写操作，写完之后，再将原来的数组引用指向到新数组。

这样做的好处是我们可以对CopyOnWrite容器进行并发的读，而不需要加锁，因为当前容器不会添加任何元素。所以CopyOnWrite容器也是一种读写分离的思想，读和写不同的容器。

注意：CopyOnWriteArrayList的整个add操作都是在锁的保护下进行的。也就是说add方法是线程安全的。

CopyOnWrite并发容器用于读多写少的并发场景。比如白名单，黑名单，商品类目的访问和更新场景。

和ArrayList不同的是，它具有以下特性：

支持高效率并发且是线程安全的 因为通常需要复制整个基础数组，所以可变操作（add()、set() 和 remove() 等等）的开销很大 迭代器支持hasNext(), next()等不可变操作，但不支持可变 remove()等操作 使用迭代器进行遍历的速度很快，并且不会与其他线程发生冲突。在构造迭代器时，迭代器依赖于不变的数组快照

##### ConcurrentSkipListMap?

ConcurrentSkipListMap是一个内部使用跳表，并且支持排序和并发的一个Map，是线程安全的。一般很少会被用到，也是一个比较偏门的数据结构。

简单介绍下跳表

```
跳表是一种允许在一个有顺序的序列中进行快速查询的数据结构。

在普通的顺序链表中查询一个元素，需要从链表头部开始一个一个节点进行遍历，然后找到节点。如图1。

跳表可以解决这种查询时间过长，其元素遍历的图示如图2，跳表是一种使用”空间换时间”的概念用来提高查询效率的链表。
```

ConcurrentSkipListMap 和 ConcurrentHashMap 的主要区别： a.底层实现方式不同。ConcurrentSkipListMap底层基于跳表。ConcurrentHashMap底层基于Hash桶和红黑树。 b.ConcurrentHashMap不支持排序。ConcurrentSkipListMap支持排序。

##### 枚举的用法?

### 1 背景

在`java`语言中还没有引入枚举类型之前，表示枚举类型的常用模式是声明一组具有`int`常量。之前我们通常利用`public final static` 方法定义的代码如下，分别用1 表示春天，2表示夏天，3表示秋天，4表示冬天。

```java
public class Season {
    public static final int SPRING = 1;
    public static final int SUMMER = 2;
    public static final int AUTUMN = 3;
    public static final int WINTER = 4;
}
```

这种方法称作int枚举模式。可这种模式有什么问题呢，我们都用了那么久了，应该没问题的。通常我们写出来的代码都会考虑它的**安全性**、**易用性**和**可读性**。 首先我们来考虑一下它的类型**安全性**。当然**这种模式不是类型安全的**。比如说我们设计一个函数，要求传入春夏秋冬的某个值。但是使用int类型，我们无法保证传入的值为合法。代码如下所示：

```java
private String getChineseSeason(int season){
        StringBuffer result = new StringBuffer();
        switch(season){
            case Season.SPRING :
                result.append("春天");
                break;
            case Season.SUMMER :
                result.append("夏天");
                break;
            case Season.AUTUMN :
                result.append("秋天");
                break;
            case Season.WINTER :
                result.append("冬天");
                break;
            default :
                result.append("地球没有的季节");
                break;
        }
        return result.toString();
    }

    public void doSomething(){
        System.out.println(this.getChineseSeason(Season.SPRING));//这是正常的场景

        System.out.println(this.getChineseSeason(5));//这个却是不正常的场景，这就导致了类型不安全问题
    }
```

程序`getChineseSeason(Season.SPRING)`是我们预期的使用方法。可`getChineseSeason(5)`显然就不是了，而且编译很通过，在运行时会出现什么情况，我们就不得而知了。这显然就不符合`Java`程序的类型安全。

接下来我们来考虑一下这种模式的**可读性**。使用枚举的大多数场合，我都需要方便得到枚举类型的字符串表达式。如果将`int`枚举常量打印出来，我们所见到的就是一组数字，这是没什么太大的用处。我们可能会想到使用`String`常量代替`int`常量。虽然它为这些常量提供了可打印的字符串，但是它会导致性能问题，因为它依赖于字符串的比较操作，所以这种模式也是我们不期望的。 从**类型安全性**和**程序可读性**两方面考虑，`int`和`String`枚举模式的缺点就显露出来了。幸运的是，从`Java1.5`发行版本开始，就提出了另一种可以替代的解决方案，可以避免`int`和`String`枚举模式的缺点，并提供了许多额外的好处。那就是枚举类型（`enum type`）。接下来的章节将介绍枚举类型的定义、特征、应用场景和优缺点。

### 2 定义

枚举类型（`enum type`）是指由一组固定的常量组成合法的类型。`Java`中由关键字`enum`来定义一个枚举类型。下面就是`java`枚举类型的定义。

```java
public enum Season {
    SPRING, SUMMER, AUTUMN, WINER;
}
```

### 3 特点

`Java`定义枚举类型的语句很简约。它有以下特点：

> 1. 使用关键字`enum` 2) 类型名称，比如这里的`Season` 3) 一串允许的值，比如上面定义的春夏秋冬四季 4) 枚举可以单独定义在一个文件中，也可以嵌在其它`Java`类中

除了这样的基本要求外，用户还有一些其他选择

> 1. 枚举可以实现一个或多个接口（Interface） 6) 可以定义新的变量 7) 可以定义新的方法 8) 可以定义根据具体枚举值而相异的类

### 4 应用场景

以在背景中提到的类型安全为例，用枚举类型重写那段代码。代码如下：

```java
public enum Season {
    SPRING(1), SUMMER(2), AUTUMN(3), WINTER(4);

    private int code;
    private Season(int code){
        this.code = code;
    }

    public int getCode(){
        return code;
    }
}
public class UseSeason {
    /**
     * 将英文的季节转换成中文季节
     * @param season
     * @return
     */
    public String getChineseSeason(Season season){
        StringBuffer result = new StringBuffer();
        switch(season){
            case SPRING :
                result.append("[中文：春天，枚举常量:" + season.name() + "，数据:" + season.getCode() + "]");
                break;
            case AUTUMN :
                result.append("[中文：秋天，枚举常量:" + season.name() + "，数据:" + season.getCode() + "]");
                break;
            case SUMMER : 
                result.append("[中文：夏天，枚举常量:" + season.name() + "，数据:" + season.getCode() + "]");
                break;
            case WINTER :
                result.append("[中文：冬天，枚举常量:" + season.name() + "，数据:" + season.getCode() + "]");
                break;
            default :
                result.append("地球没有的季节 " + season.name());
                break;
        }
        return result.toString();
    }

    public void doSomething(){
        for(Season s : Season.values()){
            System.out.println(getChineseSeason(s));//这是正常的场景
        }
        //System.out.println(getChineseSeason(5));
        //此处已经是编译不通过了，这就保证了类型安全
    }

    public static void main(String[] arg){
        UseSeason useSeason = new UseSeason();
        useSeason.doSomething();
    }
}
```

[中文：春天，枚举常量:SPRING，数据:1] [中文：夏天，枚举常量:SUMMER，数据:2] [中文：秋天，枚举常量:AUTUMN，数据:3] [中文：冬天，枚举常量:WINTER，数据:4]

这里有一个问题，为什么我要将域添加到枚举类型中呢？目的是想将数据与它的常量关联起来。如1代表春天，2代表夏天。

### 5 总结

那么什么时候应该使用枚举呢？每当需要一组固定的常量的时候，如一周的天数、一年四季等。或者是在我们编译前就知道其包含的所有值的集合。Java 1.5的枚举能满足绝大部分程序员的要求的，它的简明，易用的特点是很突出的。

### 6 用法

### 用法一：常量

```java
public enum Color {  
  RED, GREEN, BLANK, YELLOW  
}  
```

### 用法二：switch

```java
enum Signal {  
    GREEN, YELLOW, RED  
}  
public class TrafficLight {  
    Signal color = Signal.RED;  
    public void change() {  
        switch (color) {  
        case RED:  
            color = Signal.GREEN;  
            break;  
        case YELLOW:  
            color = Signal.RED;  
            break;  
        case GREEN:  
            color = Signal.YELLOW;  
            break;  
        }  
    }  
}  
```

### 用法三：向枚举中添加新方法

```java
public enum Color {  
    RED("红色", 1), GREEN("绿色", 2), BLANK("白色", 3), YELLO("黄色", 4);  
    // 成员变量  
    private String name;  
    private int index;  
    // 构造方法  
    private Color(String name, int index) {  
        this.name = name;  
        this.index = index;  
    }  
    // 普通方法  
    public static String getName(int index) {  
        for (Color c : Color.values()) {  
            if (c.getIndex() == index) {  
                return c.name;  
            }  
        }  
        return null;  
    }  
    // get set 方法  
    public String getName() {  
        return name;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
    public int getIndex() {  
        return index;  
    }  
    public void setIndex(int index) {  
        this.index = index;  
    }  
}  
```

### 用法四：覆盖枚举的方法

```java
public enum Color {  
    RED("红色", 1), GREEN("绿色", 2), BLANK("白色", 3), YELLO("黄色", 4);  
    // 成员变量  
    private String name;  
    private int index;  
    // 构造方法  
    private Color(String name, int index) {  
        this.name = name;  
        this.index = index;  
    }  
    //覆盖方法  
    @Override  
    public String toString() {  
        return this.index+"_"+this.name;  
    }  
}  
```

### 用法五：实现接口

```java
public interface Behaviour {  
    void print();  
    String getInfo();  
}  
public enum Color implements Behaviour{  
    RED("红色", 1), GREEN("绿色", 2), BLANK("白色", 3), YELLO("黄色", 4);  
    // 成员变量  
    private String name;  
    private int index;  
    // 构造方法  
    private Color(String name, int index) {  
        this.name = name;  
        this.index = index;  
    }  
//接口方法  
    @Override  
    public String getInfo() {  
        return this.name;  
    }  
    //接口方法  
    @Override  
    public void print() {  
        System.out.println(this.index+":"+this.name);  
    }  
}  
```

### 用法六：使用接口组织枚举

```java
public interface Food {  
    enum Coffee implements Food{  
        BLACK_COFFEE,DECAF_COFFEE,LATTE,CAPPUCCINO  
    }  
    enum Dessert implements Food{  
        FRUIT, CAKE, GELATO  
    }  
}
```

##### 枚举的实现?

Java SE5提供了一种新的类型-Java的枚举类型，关键字enum可以将一组具名的值的有限集合创建为一种新的类型，而这些具名的值可以作为常规的程序组件使用，这是一种非常有用的功能。

要想看源码，首先得有一个类吧，那么枚举类型到底是什么类呢？是enum吗？答案很明显不是，enum就和class一样，只是一个关键字，他并不是一个类，那么枚举是由什么类维护的呢，我们简单的写一个枚举：

```java
public enum t {
    SPRING,SUMMER;
}
```

然后我们使用反编译，看看这段代码到底是怎么实现的，反编译后代码内容如下：

```java
public final class T extends Enum
{
    private T(String s, int i)
    {
        super(s, i);
    }
    public static T[] values()
    {
        T at[];
        int i;
        T at1[];
        System.arraycopy(at = ENUM$VALUES, 0, at1 = new T[i = at.length], 0, i);
        return at1;
    }

    public static T valueOf(String s)
    {
        return (T)Enum.valueOf(demo/T, s);
    }

    public static final T SPRING;
    public static final T SUMMER;
    private static final T ENUM$VALUES[];
    static
    {
        SPRING = new T("SPRING", 0);
        SUMMER = new T("SUMMER", 1);
        ENUM$VALUES = (new T[] {
            SPRING, SUMMER
        });
    }
}
```

通过反编译后代码我们可以看到，public final class T extends Enum，说明，该类是继承了Enum类的，同时final关键字告诉我们，这个类也是不能被继承的。

当我们使用enmu来定义一个枚举类型的时候，编译器会自动帮我们创建一个final类型的类继承Enum类，所以枚举类型不能被继承。

##### 枚举与单例?

关于单例模式，我的博客中有很多文章介绍过。作为23种设计模式中最为常用的设计模式，单例模式并没有想象的那么简单。因为在设计单例的时候要考虑很多问题，比如线程安全问题、序列化对单例的破坏等。

### 哪种写单例的方式最好

在StakcOverflow中，有一个关于[What is an efficient way to implement a singleton pattern in Java?](https://stackoverflow.com/questions/70689/what-is-an-efficient-way-to-implement-a-singleton-pattern-in-java)的讨论：

如上图，得票率最高的回答是：使用枚举。

回答者引用了Joshua Bloch大神在《Effective Java》中明确表达过的观点：

> 使用枚举实现单例的方法虽然还没有广泛采用，但是单元素的枚举类型已经成为实现Singleton的最佳方法。

如果你真的深入理解了单例的用法以及一些可能存在的坑的话，那么你也许也能得到相同的结论，那就是：使用枚举实现单例是一种很好的方法。

### 枚举单例写法简单

如果你看过《[单例模式的七种写法](http://www.hollischuang.com/archives/205)》中的实现单例的所有方式的代码，那就会发现，各种方式实现单例的代码都比较复杂。主要原因是在考虑线程安全问题。

我们简单对比下“双重校验锁”方式和枚举方式实现单例的代码。

“双重校验锁”实现单例：

```java
public class Singleton {  
    private volatile static Singleton singleton;  
    private Singleton (){}  
    public static Singleton getSingleton() {  
    if (singleton == null) {  
        synchronized (Singleton.class) {  
        if (singleton == null) {  
            singleton = new Singleton();  
        }  
        }  
    }  
    return singleton;  
    }  
}  
```

枚举实现单例：

```java
public enum Singleton {  
    INSTANCE;  
    public void whateverMethod() {  
    }  
}  
```

相比之下，你就会发现，枚举实现单例的代码会精简很多。

上面的双重锁校验的代码之所以很臃肿，是因为大部分代码都是在保证线程安全。为了在保证线程安全和锁粒度之间做权衡，代码难免会写的复杂些。但是，这段代码还是有问题的，因为他无法解决反序列化会破坏单例的问题。

### 枚举可解决线程安全问题

上面提到过。使用非枚举的方式实现单例，都要自己来保证线程安全，所以，这就导致其他方法必然是比较臃肿的。那么，为什么使用枚举就不需要解决线程安全问题呢？

其实，并不是使用枚举就不需要保证线程安全，只不过线程安全的保证不需要我们关心而已。也就是说，其实在“底层”还是做了线程安全方面的保证的。

那么，“底层”到底指的是什么？

这就要说到关于枚举的实现了。这部分内容可以参考我的另外一篇博文[深度分析Java的枚举类型—-枚举的线程安全性及序列化问题](http://www.hollischuang.com/archives/197)，这里我简单说明一下：

定义枚举时使用enum和class一样，是Java中的一个关键字。就像class对应用一个Class类一样，enum也对应有一个Enum类。

通过将定义好的枚举[反编译](http://www.hollischuang.com/archives/58)，我们就能发现，其实枚举在经过`javac`的编译之后，会被转换成形如`public final class T extends Enum`的定义。

而且，枚举中的各个枚举项同事通过`static`来定义的。如：

```java
public enum T {
    SPRING,SUMMER,AUTUMN,WINTER;
}
```

反编译后代码为：

```java
public final class T extends Enum
{
    //省略部分内容
    public static final T SPRING;
    public static final T SUMMER;
    public static final T AUTUMN;
    public static final T WINTER;
    private static final T ENUM$VALUES[];
    static
    {
        SPRING = new T("SPRING", 0);
        SUMMER = new T("SUMMER", 1);
        AUTUMN = new T("AUTUMN", 2);
        WINTER = new T("WINTER", 3);
        ENUM$VALUES = (new T[] {
            SPRING, SUMMER, AUTUMN, WINTER
        });
    }
}
```

了解JVM的类加载机制的朋友应该对这部分比较清楚。`static`类型的属性会在类被加载之后被初始化，我们在[深度分析Java的ClassLoader机制（源码级别）](http://www.hollischuang.com/archives/199)和[Java类的加载、链接和初始化](http://www.hollischuang.com/archives/201)两个文章中分别介绍过，当一个Java类第一次被真正使用到的时候静态资源被初始化、Java类的加载和初始化过程都是线程安全的（因为虚拟机在加载枚举的类的时候，会使用ClassLoader的loadClass方法，而这个方法使用同步代码块保证了线程安全）。所以，创建一个enum类型是线程安全的。

也就是说，我们定义的一个枚举，在第一次被真正用到的时候，会被虚拟机加载并初始化，而这个初始化过程是线程安全的。而我们知道，解决单例的并发问题，主要解决的就是初始化过程中的线程安全问题。

所以，由于枚举的以上特性，枚举实现的单例是天生线程安全的。

### 枚举可解决反序列化会破坏单例的问题

前面我们提到过，就是使用双重校验锁实现的单例其实是存在一定问题的，就是这种单例有可能被序列化锁破坏，关于这种破坏及解决办法，参看[单例与序列化的那些事儿](http://www.hollischuang.com/archives/1144)，这里不做更加详细的说明了。

那么，对于序列化这件事情，为什么枚举又有先天的优势了呢？答案可以在[Java Object Serialization Specification](https://docs.oracle.com/javase/7/docs/platform/serialization/spec/serial-arch.html#6469) 中找到答案。其中专门对枚举的序列化做了如下规定：

大概意思就是：在序列化的时候Java仅仅是将枚举对象的name属性输出到结果中，反序列化的时候则是通过`java.lang.Enum`的`valueOf`方法来根据名字查找枚举对象。同时，编译器是不允许任何对这种序列化机制的定制的，因此禁用了`writeObject`、`readObject`、`readObjectNoData`、`writeReplace`和`readResolve`等方法。

普通的Java类的反序列化过程中，会通过反射调用类的默认构造函数来初始化对象。所以，即使单例中构造函数是私有的，也会被反射给破坏掉。由于反序列化后的对象是重新new出来的，所以这就破坏了单例。

但是，枚举的反序列化并不是通过反射实现的。所以，也就不会发生由于反序列化导致的单例破坏问题。这部分内容在[深度分析Java的枚举类型—-枚举的线程安全性及序列化问题](http://www.hollischuang.com/archives/197)中也有更加详细的介绍，还展示了部分代码，感兴趣的朋友可以前往阅读。

### 总结

在所有的单例实现方式中，枚举是一种在代码写法上最简单的方式，之所以代码十分简洁，是因为Java给我们提供了`enum`关键字，我们便可以很方便的声明一个枚举类型，而不需要关心其初始化过程中的线程安全问题，因为枚举类在被虚拟机加载的时候会保证线程安全的被初始化。

除此之外，在序列化方面，Java中有明确规定，枚举的序列化和反序列化是有特殊定制的。这就可以避免反序列化过程中由于反射而导致的单例被破坏问题。

##### Java枚举如何比较?

java 枚举值比较用 == 和 equals 方法没啥区别，两个随便用都是一样的效果。

因为枚举 Enum 类的 equals 方法默认实现就是通过 == 来比较的；

类似的 Enum 的 compareTo 方法比较的是 Enum 的 ordinal 顺序大小；

类似的还有 Enum 的 name 方法和 toString 方法一样都返回的是 Enum 的 name 值。

##### switch对枚举的支持？

Java 1.7 之前 switch 参数可用类型为 short、byte、int、char，枚举类型之所以能使用其实是编译器层面实现的，编译器会将枚举 switch 转换为类似 switch(s.ordinal()) { case Status.START.ordinal() } 形式，所以实质还是 int 参数类型，感兴趣的可以自己写个使用枚举的 switch 代码然后通过 javap -v 去看下字节码就明白了。

##### 枚举的序列化如何实现？

> 写在前面：Java SE5提供了一种新的类型-[Java的枚举类型](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/195)，关键字enum可以将一组具名的值的有限集合创建为一种新的类型，而这些具名的值可以作为常规的程序组件使用，这是一种非常有用的功能。本文将深入分析枚举的源码，看一看枚举是怎么实现的，他是如何保证线程安全的，以及为什么用枚举实现的单例是最好的方式。

### 枚举是如何保证线程安全的

要想看源码，首先得有一个类吧，那么枚举类型到底是什么类呢？是enum吗？答案很明显不是，enum就和class一样，只是一个关键字，他并不是一个类，那么枚举是由什么类维护的呢，我们简单的写一个枚举：

```java
public enum t {
    SPRING,SUMMER,AUTUMN,WINTER;
}
```

然后我们使用反编译，看看这段代码到底是怎么实现的，反编译（[Java的反编译](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/58)）后代码内容如下：

```java
public final class T extends Enum
{
    private T(String s, int i)
    {
        super(s, i);
    }
    public static T[] values()
    {
        T at[];
        int i;
        T at1[];
        System.arraycopy(at = ENUM$VALUES, 0, at1 = new T[i = at.length], 0, i);
        return at1;
    }

    public static T valueOf(String s)
    {
        return (T)Enum.valueOf(demo/T, s);
    }

    public static final T SPRING;
    public static final T SUMMER;
    public static final T AUTUMN;
    public static final T WINTER;
    private static final T ENUM$VALUES[];
    static
    {
        SPRING = new T("SPRING", 0);
        SUMMER = new T("SUMMER", 1);
        AUTUMN = new T("AUTUMN", 2);
        WINTER = new T("WINTER", 3);
        ENUM$VALUES = (new T[] {
            SPRING, SUMMER, AUTUMN, WINTER
        });
    }
}
```

通过反编译后代码我们可以看到，`public final class T extends Enum`，说明，该类是继承了Enum类的，同时final关键字告诉我们，这个类也是不能被继承的。当我们使用`enmu`来定义一个枚举类型的时候，编译器会自动帮我们创建一个final类型的类继承Enum类,所以枚举类型不能被继承，我们看到这个类中有几个属性和方法。

我们可以看到：

```java
        public static final T SPRING;
        public static final T SUMMER;
        public static final T AUTUMN;
        public static final T WINTER;
        private static final T ENUM$VALUES[];
        static
        {
            SPRING = new T("SPRING", 0);
            SUMMER = new T("SUMMER", 1);
            AUTUMN = new T("AUTUMN", 2);
            WINTER = new T("WINTER", 3);
            ENUM$VALUES = (new T[] {
                SPRING, SUMMER, AUTUMN, WINTER
            });
        }
```

都是static类型的，因为static类型的属性会在类被加载之后被初始化，我们在[深度分析Java的ClassLoader机制（源码级别）](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/199)和[Java类的加载、链接和初始化](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/201)两个文章中分别介绍过，当一个Java类第一次被真正使用到的时候静态资源被初始化、Java类的加载和初始化过程都是线程安全的。所以，**创建一个enum类型是线程安全的**。

### 为什么用枚举实现的单例是最好的方式

在[[转+注\]单例模式的七种写法](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/205)中，我们看到一共有七种实现单例的方式，其中，**Effective Java**作者`Josh Bloch` 提倡使用枚举的方式，既然大神说这种方式好，那我们就要知道它为什么好？

**1. 枚举写法简单**

> 写法简单这个大家看看[转+注]单例模式的七种写法里面的实现就知道区别了。

```java
public enum EasySingleton{
    INSTANCE;
}
```

你可以通过`EasySingleton.INSTANCE`来访问。

**2. 枚举自己处理序列化**

> 我们知道，以前的所有的单例模式都有一个比较大的问题，就是一旦实现了Serializable接口之后，就不再是单例得了，因为，每次调用 readObject()方法返回的都是一个新创建出来的对象，有一种解决办法就是使用readResolve()方法来避免此事发生。但是，**为了保证枚举类型像Java规范中所说的那样，每一个枚举类型极其定义的枚举变量在JVM中都是唯一的，在枚举类型的序列化和反序列化上，Java做了特殊的规定。**原文如下：
>
> > Enum constants are serialized differently than ordinary serializable or externalizable objects. The serialized form of an enum constant consists solely of its name; field values of the constant are not present in the form. To serialize an enum constant, ObjectOutputStream writes the value returned by the enum constant's name method. To deserialize an enum constant, ObjectInputStream reads the constant name from the stream; the deserialized constant is then obtained by calling the java.lang.Enum.valueOf method, passing the constant's enum type along with the received constant name as arguments. Like other serializable or externalizable objects, enum constants can function as the targets of back references appearing subsequently in the serialization stream. The process by which enum constants are serialized cannot be customized: any class-specific writeObject, readObject, readObjectNoData, writeReplace, and readResolve methods defined by enum types are ignored during serialization and deserialization. Similarly, any serialPersistentFields or serialVersionUID field declarations are also ignored--all enum types have a fixedserialVersionUID of 0L. Documenting serializable fields and data for enum types is unnecessary, since there is no variation in the type of data sent.
>
> 大概意思就是说，在序列化的时候Java仅仅是将枚举对象的name属性输出到结果中，反序列化的时候则是通过java.lang.Enum的valueOf方法来根据名字查找枚举对象。同时，编译器是不允许任何对这种序列化机制的定制的，因此禁用了writeObject、readObject、readObjectNoData、writeReplace和readResolve等方法。 我们看一下这个`valueOf`方法：

```java
public static <T extends Enum<T>> T valueOf(Class<T> enumType,String name) {  
            T result = enumType.enumConstantDirectory().get(name);  
            if (result != null)  
                return result;  
            if (name == null)  
                throw new NullPointerException("Name is null");  
            throw new IllegalArgumentException(  
                "No enum const " + enumType +"." + name);  
        }  
```

从代码中可以看到，代码会尝试从调用`enumType`这个`Class`对象的`enumConstantDirectory()`方法返回的`map`中获取名字为`name`的枚举对象，如果不存在就会抛出异常。再进一步跟到`enumConstantDirectory()`方法，就会发现到最后会以反射的方式调用`enumType`这个类型的`values()`静态方法，也就是上面我们看到的编译器为我们创建的那个方法，然后用返回结果填充`enumType`这个`Class`对象中的`enumConstantDirectory`属性。

所以，**JVM对序列化有保证。**

**3.枚举实例创建是thread-safe(线程安全的)**

> 我们在[深度分析Java的ClassLoader机制（源码级别）](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/199)和[Java类的加载、链接和初始化](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/201)两个文章中分别介绍过，当一个Java类第一次被真正使用到的时候静态资源被初始化、Java类的加载和初始化过程都是线程安全的。所以，**创建一个enum类型是线程安全的**。

##### 枚举的线程安全性问题?

### 枚举是如何保证线程安全的

要想看源码，首先得有一个类吧，那么枚举类型到底是什么类呢？是enum吗？答案很明显不是，enum就和class一样，只是一个关键字，他并不是一个类，那么枚举是由什么类维护的呢，我们简单的写一个枚举：

```java
public enum t {
    SPRING,SUMMER,AUTUMN,WINTER;
}
```

然后我们使用反编译，看看这段代码到底是怎么实现的，反编译（[Java的反编译](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/58)）后代码内容如下：

```java
public final class T extends Enum
{
    private T(String s, int i)
    {
        super(s, i);
    }
    public static T[] values()
    {
        T at[];
        int i;
        T at1[];
        System.arraycopy(at = ENUM$VALUES, 0, at1 = new T[i = at.length], 0, i);
        return at1;
    }

    public static T valueOf(String s)
    {
        return (T)Enum.valueOf(demo/T, s);
    }

    public static final T SPRING;
    public static final T SUMMER;
    public static final T AUTUMN;
    public static final T WINTER;
    private static final T ENUM$VALUES[];
    static
    {
        SPRING = new T("SPRING", 0);
        SUMMER = new T("SUMMER", 1);
        AUTUMN = new T("AUTUMN", 2);
        WINTER = new T("WINTER", 3);
        ENUM$VALUES = (new T[] {
            SPRING, SUMMER, AUTUMN, WINTER
        });
    }
}
```

通过反编译后代码我们可以看到，`public final class T extends Enum`，说明，该类是继承了Enum类的，同时final关键字告诉我们，这个类也是不能被继承的。当我们使用`enmu`来定义一个枚举类型的时候，编译器会自动帮我们创建一个final类型的类继承Enum类,所以枚举类型不能被继承，我们看到这个类中有几个属性和方法。

我们可以看到：

```java
        public static final T SPRING;
        public static final T SUMMER;
        public static final T AUTUMN;
        public static final T WINTER;
        private static final T ENUM$VALUES[];
        static
        {
            SPRING = new T("SPRING", 0);
            SUMMER = new T("SUMMER", 1);
            AUTUMN = new T("AUTUMN", 2);
            WINTER = new T("WINTER", 3);
            ENUM$VALUES = (new T[] {
                SPRING, SUMMER, AUTUMN, WINTER
            });
        }
```

都是static类型的，因为static类型的属性会在类被加载之后被初始化，我们在[深度分析Java的ClassLoader机制（源码级别）](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/199)和[Java类的加载、链接和初始化](https://github.com/hollischuang/toBeTopJavaer/blob/master/archives/201)两个文章中分别介绍过，当一个Java类第一次被真正使用到的时候静态资源被初始化、Java类的加载和初始化过程都是线程安全的。所以，**创建一个enum类型是线程安全的**。

##### 字符流、字节流?

### 字节与字符

Bit最小的二进制单位 ，是计算机的操作部分。取值0或者1

Byte（字节）是计算机操作数据的最小单位由8位bit组成 取值（-128-127）

Char（字符）是用户的可读写的最小单位，在Java里面由16位bit组成 取值（0-65535）

### 字节流

操作byte类型数据，主要操作类是OutputStream、InputStream的子类；不用缓冲区，直接对文件本身操作。

### 字符流

操作字符类型数据，主要操作类是Reader、Writer的子类；使用缓冲区缓冲字符，不关闭流就不会输出任何内容。

### 互相转换

整个IO包实际上分为字节流和字符流，但是除了这两个流之外，还存在一组字节流-字符流的转换类。

OutputStreamWriter：是Writer的子类，将输出的字符流变为字节流，即将一个字符流的输出对象变为字节流输出对象。

InputStreamReader：是Reader的子类，将输入的字节流变为字符流，即将一个字节流的输入对象变为字符流的输入对象。

##### 输入流、输出流?

输入、输出，有一个参照物，参照物就是存储数据的介质。如果是把对象读入到介质中，这就是输入。从介质中向外读数据，这就是输出。

所以，输入流是把数据写入存储介质的。输出流是从存储介质中把数据读取出来。

##### 同步、异步、阻塞、非阻塞?

同步与异步描述的是被调用者的。

如A调用B：

如果是同步，B在接到A的调用后，会立即执行要做的事。A的本次调用可以得到结果。

如果是异步，B在接到A的调用后，不保证会立即执行要做的事，但是保证会去做，B在做好了之后会通知A。A的本次调用得不到结果，但是B执行完之后会通知A。

### 同步，异步 和 阻塞，非阻塞之间的区别

同步，异步，是描述被调用方的。

[阻塞、非阻塞](https://github.com/hollischuang/toBeTopJavaer/blob/master/basics/java-basic/block-vs-non-blocking.md)，是描述调用方的。

同步不一定阻塞，异步也不一定非阻塞。没有必然关系。

举个简单的例子，老张烧水。 1 老张把水壶放到火上，一直在水壶旁等着水开。（同步阻塞） 2 老张把水壶放到火上，去客厅看电视，时不时去厨房看看水开没有。（同步非阻塞） 3 老张把响水壶放到火上，一直在水壶旁等着水开。（异步阻塞） 4 老张把响水壶放到火上，去客厅看电视，水壶响之前不再去看它了，响了再去拿壶。（异步非阻塞）

1和2的区别是，调用方在得到返回之前所做的事情不一行。 1和3的区别是，被调用方对于烧水的处理不一样。

##### Linux 5种IO模型?

### 阻塞式IO模型

最传统的一种IO模型，即在读写数据过程中会发生阻塞现象。

当用户线程发出IO请求之后，内核会去查看数据是否就绪，如果没有就绪就会等待数据就绪，而用户线程就会处于阻塞状态，用户线程交出CPU。当数据就绪之后，内核会将数据拷贝到用户线程，并返回结果给用户线程，用户线程才解除block状态。

典型的阻塞IO模型的例子为：

```
data = socket.read();
```

如果数据没有就绪，就会一直阻塞在read方法。

### 非阻塞IO模型

当用户线程发起一个read操作后，并不需要等待，而是马上就得到了一个结果。如果结果是一个error时，它就知道数据还没有准备好，于是它可以再次发送read操作。一旦内核中的数据准备好了，并且又再次收到了用户线程的请求，那么它马上就将数据拷贝到了用户线程，然后返回。

所以事实上，在非阻塞IO模型中，用户线程需要不断地询问内核数据是否就绪，也就说非阻塞IO不会交出CPU，而会一直占用CPU。

典型的非阻塞IO模型一般如下：

```
while(true){
    data = socket.read();
    if(data!= error){
        处理数据
        break;
    }
}
```

但是对于非阻塞IO就有一个非常严重的问题，在while循环中需要不断地去询问内核数据是否就绪，这样会导致CPU占用率非常高，因此一般情况下很少使用while循环这种方式来读取数据。

### IO复用模型

多路复用IO模型是目前使用得比较多的模型。Java NIO实际上就是多路复用IO。

在多路复用IO模型中，会有一个线程不断去轮询多个socket的状态，只有当socket真正有读写事件时，才真正调用实际的IO读写操作。因为在多路复用IO模型中，只需要使用一个线程就可以管理多个socket，系统不需要建立新的进程或者线程，也不必维护这些线程和进程，并且只有在真正有socket读写事件进行时，才会使用IO资源，所以它大大减少了资源占用。

在Java NIO中，是通过selector.select()去查询每个通道是否有到达事件，如果没有事件，则一直阻塞在那里，因此这种方式会导致用户线程的阻塞。

也许有朋友会说，我可以采用 多线程+ 阻塞IO 达到类似的效果，但是由于在多线程 + 阻塞IO 中，每个socket对应一个线程，这样会造成很大的资源占用，并且尤其是对于长连接来说，线程的资源一直不会释放，如果后面陆续有很多连接的话，就会造成性能上的瓶颈。

而多路复用IO模式，通过一个线程就可以管理多个socket，只有当socket真正有读写事件发生才会占用资源来进行实际的读写操作。因此，多路复用IO比较适合连接数比较多的情况。

另外多路复用IO为何比非阻塞IO模型的效率高是因为在非阻塞IO中，不断地询问socket状态时通过用户线程去进行的，而在多路复用IO中，轮询每个socket状态是内核在进行的，这个效率要比用户线程要高的多。

不过要注意的是，多路复用IO模型是通过轮询的方式来检测是否有事件到达，并且对到达的事件逐一进行响应。因此对于多路复用IO模型来说，一旦事件响应体很大，那么就会导致后续的事件迟迟得不到处理，并且会影响新的事件轮询。

### 信号驱动IO模型

在信号驱动IO模型中，当用户线程发起一个IO请求操作，会给对应的socket注册一个信号函数，然后用户线程会继续执行，当内核数据就绪时会发送一个信号给用户线程，用户线程接收到信号之后，便在信号函数中调用IO读写操作来进行实际的IO请求操作。

### 异步IO模型

异步IO模型是比较理想的IO模型，在异步IO模型中，当用户线程发起read操作之后，立刻就可以开始去做其它的事。而另一方面，从内核的角度，当它受到一个asynchronous read之后，它会立刻返回，说明read请求已经成功发起了，因此不会对用户线程产生任何block。然后，内核会等待数据准备完成，然后将数据拷贝到用户线程，当这一切都完成之后，内核会给用户线程发送一个信号，告诉它read操作完成了。也就说用户线程完全不需要实际的整个IO操作是如何进行的，只需要先发起一个请求，当接收内核返回的成功信号时表示IO操作已经完成，可以直接去使用数据了。

也就说在异步IO模型中，IO操作的两个阶段都不会阻塞用户线程，这两个阶段都是由内核自动完成，然后发送一个信号告知用户线程操作已完成。用户线程中不需要再次调用IO函数进行具体的读写。这点是和信号驱动模型有所不同的，在信号驱动模型中，当用户线程接收到信号表示数据已经就绪，然后需要用户线程调用IO函数进行实际的读写操作；而在异步IO模型中，收到信号表示IO操作已经完成，不需要再在用户线程中调用iO函数进行实际的读写操作。

注意，异步IO是需要操作系统的底层支持，在Java 7中，提供了Asynchronous IO。

前面四种IO模型实际上都属于同步IO，只有最后一种是真正的异步IO，因为无论是多路复用IO还是信号驱动模型，IO操作的第2个阶段都会引起用户线程阻塞，也就是内核进行数据拷贝的过程都会让用户线程阻塞。

##### BIO、NIO和AIO的区别、三种IO的用法与原理？

### IO

什么是IO? 它是指计算机与外部世界或者一个程序与计算机的其余部分的之间的接口。它对于任何计算机系统都非常关键，因而所有 I/O 的主体实际上是内置在操作系统中的。单独的程序一般是让系统为它们完成大部分的工作。

在 Java 编程中，直到最近一直使用 流 的方式完成 I/O。所有 I/O 都被视为单个的字节的移动，通过一个称为 Stream 的对象一次移动一个字节。流 I/O 用于与外部世界接触。它也在内部使用，用于将对象转换为字节，然后再转换回对象。

### BIO

Java BIO即Block I/O ， 同步并阻塞的IO。

BIO就是传统的java.io包下面的代码实现。

### NIO

什么是NIO? NIO 与原来的 I/O 有同样的作用和目的, 他们之间最重要的区别是数据打包和传输的方式。原来的 I/O 以流的方式处理数据，而 NIO 以块的方式处理数据。

面向流 的 I/O 系统一次一个字节地处理数据。一个输入流产生一个字节的数据，一个输出流消费一个字节的数据。为流式数据创建过滤器非常容易。链接几个过滤器，以便每个过滤器只负责单个复杂处理机制的一部分，这样也是相对简单的。不利的一面是，面向流的 I/O 通常相当慢。

一个 面向块 的 I/O 系统以块的形式处理数据。每一个操作都在一步中产生或者消费一个数据块。按块处理数据比按(流式的)字节处理数据要快得多。但是面向块的 I/O 缺少一些面向流的 I/O 所具有的优雅性和简单性。

### AIO

Java AIO即Async非阻塞，是异步非阻塞的IO。

### 区别及联系

BIO （Blocking I/O）：同步阻塞I/O模式，数据的读取写入必须阻塞在一个线程内等待其完成。这里假设一个烧开水的场景，有一排水壶在烧开水，BIO的工作模式就是， 叫一个线程停留在一个水壶那，直到这个水壶烧开，才去处理下一个水壶。但是实际上线程在等待水壶烧开的时间段什么都没有做。

NIO （New I/O）：同时支持阻塞与非阻塞模式，但这里我们以其同步非阻塞I/O模式来说明，那么什么叫做同步非阻塞？如果还拿烧开水来说，NIO的做法是叫一个线程不断的轮询每个水壶的状态，看看是否有水壶的状态发生了改变，从而进行下一步的操作。

AIO （ Asynchronous I/O）：异步非阻塞I/O模型。异步非阻塞与同步非阻塞的区别在哪里？异步非阻塞无需一个线程去轮询所有IO操作的状态改变，在相应的状态改变后，系统会通知对应的线程来处理。对应到烧开水中就是，为每个水壶上面装了一个开关，水烧开之后，水壶会自动通知我水烧开了。

### 各自适用场景

BIO方式适用于连接数目比较小且固定的架构，这种方式对服务器资源要求比较高，并发局限于应用中，JDK1.4以前的唯一选择，但程序直观简单易理解。

NIO方式适用于连接数目多且连接比较短（轻操作）的架构，比如聊天服务器，并发局限于应用中，编程比较复杂，JDK1.4开始支持。

AIO方式适用于连接数目多且连接比较长（重操作）的架构，比如相册服务器，充分调用OS参与并发操作，编程比较复杂，JDK7开始支持。

### 使用方式

#### 使用BIO实现文件的读取和写入。

```java
       //Initializes The Object
        User1 user = new User1();
        user.setName("hollis");
        user.setAge(23);
        System.out.println(user);

        //Write Obj to File
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream("tempFile"));
            oos.writeObject(user);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(oos);
        }

        //Read Obj from File
        File file = new File("tempFile");
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(new FileInputStream(file));
            User1 newUser = (User1) ois.readObject();
            System.out.println(newUser);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(ois);
            try {
                FileUtils.forceDelete(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

       //Initializes The Object
        User1 user = new User1();
        user.setName("hollis");
        user.setAge(23);
        System.out.println(user);

        //Write Obj to File
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream("tempFile"));
            oos.writeObject(user);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(oos);
        }

        //Read Obj from File
        File file = new File("tempFile");
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(new FileInputStream(file));
            User1 newUser = (User1) ois.readObject();
            System.out.println(newUser);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(ois);
            try {
                FileUtils.forceDelete(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
```

#### 使用NIO实现文件的读取和写入。

```java
static void readNIO() {
		String pathname = "C:\\Users\\adew\\Desktop\\jd-gui.cfg";
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(new File(pathname));
			FileChannel channel = fin.getChannel();

			int capacity = 100;// 字节
			ByteBuffer bf = ByteBuffer.allocate(capacity);
			System.out.println("限制是：" + bf.limit() + "容量是：" + bf.capacity()
					+ "位置是：" + bf.position());
			int length = -1;

			while ((length = channel.read(bf)) != -1) {

				/*
				 * 注意，读取后，将位置置为0，将limit置为容量, 以备下次读入到字节缓冲中，从0开始存储
				 */
				bf.clear();
				byte[] bytes = bf.array();
				System.out.write(bytes, 0, length);
				System.out.println();

				System.out.println("限制是：" + bf.limit() + "容量是：" + bf.capacity()
						+ "位置是：" + bf.position());

			}

			channel.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fin != null) {
				try {
					fin.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	static void writeNIO() {
		String filename = "out.txt";
		FileOutputStream fos = null;
		try {

			fos = new FileOutputStream(new File(filename));
			FileChannel channel = fos.getChannel();
			ByteBuffer src = Charset.forName("utf8").encode("你好你好你好你好你好");
			// 字节缓冲的容量和limit会随着数据长度变化，不是固定不变的
			System.out.println("初始化容量和limit：" + src.capacity() + ","
					+ src.limit());
			int length = 0;

			while ((length = channel.write(src)) != 0) {
				/*
				 * 注意，这里不需要clear，将缓冲中的数据写入到通道中后 第二次接着上一次的顺序往下读
				 */
				System.out.println("写入长度:" + length);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
```

#### 使用AIO实现文件的读取和写入

```java
public class ReadFromFile {
  public static void main(String[] args) throws Exception {
    Path file = Paths.get("/usr/a.txt");
    AsynchronousFileChannel channel = AsynchronousFileChannel.open(file);

    ByteBuffer buffer = ByteBuffer.allocate(100_000);
    Future<Integer> result = channel.read(buffer, 0);

    while (!result.isDone()) {
      ProfitCalculator.calculateTax();
    }
    Integer bytesRead = result.get();
    System.out.println("Bytes read [" + bytesRead + "]");
  }
}
class ProfitCalculator {
  public ProfitCalculator() {
  }
  public static void calculateTax() {
  }
}

public class WriteToFile {

  public static void main(String[] args) throws Exception {
    AsynchronousFileChannel fileChannel = AsynchronousFileChannel.open(
        Paths.get("/asynchronous.txt"), StandardOpenOption.READ,
        StandardOpenOption.WRITE, StandardOpenOption.CREATE);
    CompletionHandler<Integer, Object> handler = new CompletionHandler<Integer, Object>() {

      @Override
      public void completed(Integer result, Object attachment) {
        System.out.println("Attachment: " + attachment + " " + result
            + " bytes written");
        System.out.println("CompletionHandler Thread ID: "
            + Thread.currentThread().getId());
      }

      @Override
      public void failed(Throwable e, Object attachment) {
        System.err.println("Attachment: " + attachment + " failed with:");
        e.printStackTrace();
      }
    };

    System.out.println("Main Thread ID: " + Thread.currentThread().getId());
    fileChannel.write(ByteBuffer.wrap("Sample".getBytes()), 0, "First Write",
        handler);
    fileChannel.write(ByteBuffer.wrap("Box".getBytes()), 0, "Second Write",
        handler);

  }
}
```

##### 反射?

反射机制指的是程序在运行时能够获取自身的信息。在java中，只要给定类的名字，那么就可以通过反射机制来获得类的所有属性和方法。

##### 反射有什么作用?

在运行时判断任意一个对象所属的类。

在运行时判断任意一个类所具有的成员变量和方法。

在运行时任意调用一个对象的方法。

在运行时构造任意一个类的对象。

##### Class类？

Java的Class类是java反射机制的基础,通过Class类我们可以获得关于一个类的相关信息

Java.lang.Class是一个比较特殊的类，它用于封装被装入到JVM中的类（包括类和接口）的信息。当一个类或接口被装入的JVM时便会产生一个与之关联的java.lang.Class对象，可以通过这个Class对象对被装入类的详细信息进行访问。

虚拟机为每种类型管理一个独一无二的Class对象。也就是说，每个类（型）都有一个Class对象。运行程序时，Java虚拟机(JVM)首先检查是否所要加载的类对应的Class对象是否已经加载。如果没有加载，JVM就会根据类名查找.class文件，并将其Class对象载入。

##### 静态代理?

所谓静态代理，就是代理类是由程序员自己编写的，在编译期就确定好了的。来看下下面的例子：

```java
public interface HelloSerivice {
    public void say();
}

public class HelloSeriviceImpl implements HelloSerivice{

    @Override
    public void say() {
        System.out.println("hello world");
    }
}
```

上面的代码比较简单，定义了一个接口和其实现类。这就是代理模式中的目标对象和目标对象的接口。接下类定义代理对象。

```java
public class HelloSeriviceProxy implements HelloSerivice{

    private HelloSerivice target;
    public HelloSeriviceProxy(HelloSerivice target) {
        this.target = target;
    }

    @Override
    public void say() {
        System.out.println("记录日志");
        target.say();
        System.out.println("清理数据");
    }
}
```

上面就是一个代理类，他也实现了目标对象的接口，并且扩展了say方法。下面是一个测试类：

```java
public class Main {
    @Test
    public void testProxy(){
        //目标对象
        HelloSerivice target = new HelloSeriviceImpl();
        //代理对象
        HelloSeriviceProxy proxy = new HelloSeriviceProxy(target);
        proxy.say();
    }
}
```

// 记录日志 // hello world // 清理数据

这就是一个简单的静态的代理模式的实现。代理模式中的所有角色（代理对象、目标对象、目标对象的接口）等都是在编译期就确定好的。

静态代理的用途 控制真实对象的访问权限 通过代理对象控制对真实对象的使用权限。

避免创建大对象 通过使用一个代理小对象来代表一个真实的大对象，可以减少系统资源的消耗，对系统进行优化并提高运行速度。

增强真实对象的功能 这个比较简单，通过代理可以在调用真实对象的方法的前后增加额外功能。

##### 动态代理?

前面介绍了[静态代理](https://github.com/hollischuang/toBeTopJavaer/blob/master/basics/java-basic/static-proxy.md)，虽然静态代理模式很好用，但是静态代理还是存在一些局限性的，比如使用静态代理模式需要程序员手写很多代码，这个过程是比较浪费时间和精力的。一旦需要代理的类中方法比较多，或者需要同时代理多个对象的时候，这无疑会增加很大的复杂度。

有没有一种方法，可以不需要程序员自己手写代理类呢。这就是动态代理啦。

动态代理中的代理类并不要求在编译期就确定，而是可以在运行期动态生成，从而实现对目标对象的代理功能。

反射是动态代理的一种实现方式。

##### 动态代理和反射的关系?

反射是动态代理的一种实现方式。

##### 动态代理的几种实现方式?

Java中，实现动态代理有两种方式：

1、JDK动态代理：java.lang.reflect 包中的Proxy类和InvocationHandler接口提供了生成动态代理类的能力。

2、Cglib动态代理：Cglib (Code Generation Library )是一个第三方代码生成类库，运行时在内存中动态生成一个子类对象从而实现对目标对象功能的扩展。

关于这两种动态代理的写法本文就不深入展开了，读者感兴趣的话，后面我再写文章单独介绍。本文主要来简单说一下这两种动态代理的区别和用途。

JDK动态代理和Cglib动态代理的区别 JDK的动态代理有一个限制，就是使用动态代理的对象必须实现一个或多个接口。如果想代理没有实现接口的类，就可以使用CGLIB实现。

Cglib是一个强大的高性能的代码生成包，它可以在运行期扩展Java类与实现Java接口。它广泛的被许多AOP的框架使用，例如Spring AOP和dynaop，为他们提供方法的interception（拦截）。

Cglib包的底层是通过使用一个小而快的字节码处理框架ASM，来转换字节码并生成新的类。不鼓励直接使用ASM，因为它需要你对JVM内部结构包括class文件的格式和指令集都很熟悉。

Cglib与动态代理最大的区别就是：

使用动态代理的对象必须实现一个或多个接口

使用cglib代理的对象则无需实现接口，达到代理类无侵入。

### Java实现动态代理的大致步骤

1、定义一个委托类和公共接口。

2、自己定义一个类（调用处理器类，即实现 InvocationHandler 接口），这个类的目的是指定运行时将生成的代理类需要完成的具体任务（包括Preprocess和Postprocess），即代理类调用任何方法都会经过这个调用处理器类（在本文最后一节对此进行解释）。

3、生成代理对象（当然也会生成代理类），需要为他指定(1)委托对象(2)实现的一系列接口(3)调用处理器类的实例。因此可以看出一个代理对象对应一个委托对象，对应一个调用处理器实例。

### Java 实现动态代理主要涉及哪几个类

java.lang.reflect.Proxy: 这是生成代理类的主类，通过 Proxy 类生成的代理类都继承了 Proxy 类，即 DynamicProxyClass extends Proxy。

java.lang.reflect.InvocationHandler: 这里称他为"调用处理器"，他是一个接口，我们动态生成的代理类需要完成的具体内容需要自己定义一个类，而这个类必须实现 InvocationHandler 接口。

### 动态代理实现

使用动态代理实现功能：不改变Test类的情况下，在方法target 之前打印一句话，之后打印一句话。

```java
public class UserServiceImpl implements UserService {

    @Override
    public void add() {
        // TODO Auto-generated method stub
        System.out.println("--------------------add----------------------");
    }
}
```

#### jdk动态代理

```java
public class MyInvocationHandler implements InvocationHandler {

    private Object target;

    public MyInvocationHandler(Object target) {

        super();
        this.target = target;

    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        PerformanceMonior.begin(target.getClass().getName()+"."+method.getName());
        //System.out.println("-----------------begin "+method.getName()+"-----------------");
        Object result = method.invoke(target, args);
        //System.out.println("-----------------end "+method.getName()+"-----------------");
        PerformanceMonior.end();
        return result;
    }

    public Object getProxy(){

        return Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(), target.getClass().getInterfaces(), this);
    }

}

public static void main(String[] args) {

  UserService service = new UserServiceImpl();
  MyInvocationHandler handler = new MyInvocationHandler(service);
  UserService proxy = (UserService) handler.getProxy();
  proxy.add();
}
```

### cglib动态代理

```
public class CglibProxy implements MethodInterceptor{  
 private Enhancer enhancer = new Enhancer();  
 public Object getProxy(Class clazz){  
  //设置需要创建子类的类  
  enhancer.setSuperclass(clazz);  
  enhancer.setCallback(this);  
  //通过字节码技术动态创建子类实例  
  return enhancer.create();  
 }  
 //实现MethodInterceptor接口方法  
 public Object intercept(Object obj, Method method, Object[] args,  
   MethodProxy proxy) throws Throwable {  
  System.out.println("前置代理");  
  //通过代理类调用父类中的方法  
  Object result = proxy.invokeSuper(obj, args);  
  System.out.println("后置代理");  
  return result;  
 }  
}  

public class DoCGLib {  
 public static void main(String[] args) {  
  CglibProxy proxy = new CglibProxy();  
  //通过生成子类的方式创建代理类  
  UserServiceImpl proxyImp = (UserServiceImpl)proxy.getProxy(UserServiceImpl.class);  
  proxyImp.add();  
 }  
}
```

##### AOP?

Spring AOP中的动态代理主要有两种方式，JDK动态代理和CGLIB动态代理。

JDK动态代理通过反射来接收被代理的类，并且要求被代理的类必须实现一个接口。JDK动态代理的核心是InvocationHandler接口和Proxy类。

如果目标类没有实现接口，那么Spring AOP会选择使用CGLIB来动态代理目标类。

CGLIB（Code Generation Library），是一个代码生成的类库，可以在运行时动态的生成某个类的子类，注意，CGLIB是通过继承的方式做的动态代理，因此如果某个类被标记为final，那么它是无法使用CGLIB做动态代理的。

##### object等的含义?

E - Element (在集合中使用，因为集合中存放的是元素)

T - Type（Java 类）

K - Key（键）

V - Value（值）

N - Number（数值类型）

？ - 表示不确定的java类型（无限制通配符类型）

S、U、V - 2nd、3rd、4th types

Object - 是所有类的根类，任何类的对象都可以设置给该Object引用变量，使用的时候可能需要类型强制转换，但是用使用了泛型T、E等这些标识符后，在实际用之前类型就已经确定了，不需要再进行类型强制转换。

##### 死锁？

java级别死锁

## 一、什么是死锁

死锁不仅在个人学习中，甚至在开发中也并不常见。但是一旦出现死锁，后果将非常严重。 首先什么是死锁呢？打个比方，就好像有两个人打架，互相限制住了(锁住，抱住)彼此一样，互相动弹不得，而且互相欧气，你不松手我就不松手。好了谁也动弹不得。 在多线程的环境下，势必会对资源进行抢夺。当两个线程锁住了当前资源，但都需要对方的资源才能进行下一步操作，这个时候两方就会一直等待对方的资源释放。这就形成了死锁。这些永远在互相等待的进程称为死锁进程。

那么我们来总结一下死锁产生的条件：

1. 互斥:资源的锁是排他性的，加锁期间只能有一个线程拥有该资源。其他线程只能等待锁释放才能尝试获取该资源。
2. 请求和保持:当前线程已经拥有至少一个资源，但其同时又发出新的资源请求，而被请求的资源被其他线程拥有。此时进入保持当前资源并等待下个资源的状态。
3. 不剥夺：线程已拥有的资源，只能由自己释放，不能被其他线程剥夺。
4. 循环等待：是指有多个线程互相的请求对方的资源，但同时拥有对方下一步所需的资源。形成一种循环，类似2)请求和保持。但此处指多个线程的关系。并不是指单个线程一直在循环中等待。

什么？还是不理解？那我们直接上代码，动手写一个死锁。

## 二、动手写死锁

根据条件，我们让两个线程互相请求保持。

```
public class DeadLockDemo implements Runnable{

    public static int flag = 1;

    //static 变量是 类对象共享的
    static Object o1 = new Object();
    static Object o2 = new Object();

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName() + "：此时 flag = " + flag);
        if(flag == 1){
            synchronized (o1){
                try {
                    System.out.println("我是" + Thread.currentThread().getName() + "锁住 o1");
                    Thread.sleep(3000);
                    System.out.println(Thread.currentThread().getName() + "醒来->准备获取 o2");
                }catch (Exception e){
                    e.printStackTrace();
                }
                synchronized (o2){
                    System.out.println(Thread.currentThread().getName() + "拿到 o2");//第24行
                }
            }
        }
        if(flag == 0){
            synchronized (o2){
                try {
                    System.out.println("我是" + Thread.currentThread().getName() + "锁住 o2");
                    Thread.sleep(3000);
                    System.out.println(Thread.currentThread().getName() + "醒来->准备获取 o2");
                }catch (Exception e){
                    e.printStackTrace();
                }
                synchronized (o1){
                    System.out.println(Thread.currentThread().getName() + "拿到 o1");//第38行
                }
            }
        }
    }

    public static  void main(String args[]){

        DeadLockDemo t1 = new DeadLockDemo();
        DeadLockDemo t2 = new DeadLockDemo();
        t1.flag = 1;
        new Thread(t1).start();

        //让main线程休眠1秒钟,保证t2开启锁住o2.进入死锁
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        t2.flag = 0;
        new Thread(t2).start();

    }
}
```

代码中， t1创建，t1先拿到o1的锁，开始休眠3秒。然后 t2线程创建，t2拿到o2的锁，开始休眠3秒。然后 t1先醒来，准备拿o2的锁，发现o2已经加锁，只能等待o2的锁释放。 t2后醒来，准备拿o1的锁，发现o1已经加锁，只能等待o1的锁释放。 t1,t2形成死锁。

我们查看运行状态，

## 四、解决办法

死锁一旦发生，我们就无法解决了。所以我们只能避免死锁的发生。 既然死锁需要满足四种条件，那我们就从条件下手，只要打破任意规则即可。

1. （互斥）尽量少用互斥锁，能加读锁，不加写锁。当然这条无法避免。
2. （请求和保持）采用资源静态分配策略（进程资源静态分配方式是指一个进程在建立时就分配了它需要的全部资源）.我们尽量不让线程同时去请求多个锁，或者在拥有一个锁又请求不到下个锁时，不保持等待，先释放资源等待一段时间在重新请求。
3. （不剥夺）允许进程剥夺使用其他进程占有的资源。优先级。
4. （循环等待）尽量调整获得锁的顺序，不发生嵌套资源请求。加入超时。

##### synchronized是如何实现的?

在[再有人问你Java内存模型是什么，就把这篇文章发给他。](http://www.hollischuang.com/archives/2550)中我们曾经介绍过，Java语言为了解决并发编程中存在的原子性、可见性和有序性问题，提供了一系列和并发处理相关的关键字，比如`synchronized`、`volatile`、`final`、`concurren包`等。

在《深入理解Java虚拟机》中，有这样一段话：

> `synchronized`关键字在需要原子性、可见性和有序性这三种特性的时候都可以作为其中一种解决方案，看起来是“万能”的。的确，大部分并发控制操作都能使用synchronized来完成。

海明威在他的《午后之死》说过的：“冰山运动之雄伟壮观，是因为他只有八分之一在水面上。”对于程序员来说，`synchronized`只是个关键字而已，用起来很简单。之所以我们可以在处理多线程问题时可以不用考虑太多，就是因为这个关键字帮我们屏蔽了很多细节。

那么，本文就围绕`synchronized`展开，主要介绍`synchronized`的用法、`synchronized`的原理，以及`synchronized`是如何提供原子性、可见性和有序性保障的等。

### synchronized的用法

`synchronized`是Java提供的一个并发控制的关键字。主要有两种用法，分别是同步方法和同步代码块。也就是说，`synchronized`既可以修饰方法也可以修饰代码块。

```
/**
 * @author Hollis 18/08/04.
 */
public class SynchronizedDemo {
     //同步方法
    public synchronized void doSth(){
        System.out.println("Hello World");
    }

    //同步代码块
    public void doSth1(){
        synchronized (SynchronizedDemo.class){
            System.out.println("Hello World");
        }
    }
}
```

被`synchronized`修饰的代码块及方法，在同一时间，只能被单个线程访问。

### synchronized的实现原理

`synchronized`，是Java中用于解决并发情况下数据同步访问的一个很重要的关键字。当我们想要保证一个共享资源在同一时间只会被一个线程访问到时，我们可以在代码中使用`synchronized`关键字对类或者对象加锁。

在[深入理解多线程（一）——Synchronized的实现原理](http://www.hollischuang.com/archives/1883)中我曾经介绍过其实现原理，为了保证知识的完整性，这里再简单介绍一下，详细的内容请去原文阅读。

我们对上面的代码进行反编译，可以得到如下代码：

```
public synchronized void doSth();
    descriptor: ()V
    flags: ACC_PUBLIC, ACC_SYNCHRONIZED
    Code:
      stack=2, locals=1, args_size=1
         0: getstatic     #2                  // Field java/lang/System.out:Ljava/io/PrintStream;
         3: ldc           #3                  // String Hello World
         5: invokevirtual #4                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
         8: return

  public void doSth1();
    descriptor: ()V
    flags: ACC_PUBLIC
    Code:
      stack=2, locals=3, args_size=1
         0: ldc           #5                  // class com/hollis/SynchronizedTest
         2: dup
         3: astore_1
         4: monitorenter
         5: getstatic     #2                  // Field java/lang/System.out:Ljava/io/PrintStream;
         8: ldc           #3                  // String Hello World
        10: invokevirtual #4                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
        13: aload_1
        14: monitorexit
        15: goto          23
        18: astore_2
        19: aload_1
        20: monitorexit
        21: aload_2
        22: athrow
        23: return
```

通过反编译后代码可以看出：对于同步方法，JVM采用`ACC_SYNCHRONIZED`标记符来实现同步。 对于同步代码块。JVM采用`monitorenter`、`monitorexit`两个指令来实现同步。

在[The Java® Virtual Machine Specification](https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-2.html#jvms-2.11.10)中有关于同步方法和同步代码块的实现原理的介绍，我翻译成中文如下：

> 方法级的同步是隐式的。同步方法的常量池中会有一个`ACC_SYNCHRONIZED`标志。当某个线程要访问某个方法的时候，会检查是否有`ACC_SYNCHRONIZED`，如果有设置，则需要先获得监视器锁，然后开始执行方法，方法执行之后再释放监视器锁。这时如果其他线程来请求执行方法，会因为无法获得监视器锁而被阻断住。值得注意的是，如果在方法执行过程中，发生了异常，并且方法内部并没有处理该异常，那么在异常被抛到方法外面之前监视器锁会被自动释放。
>
> 同步代码块使用`monitorenter`和`monitorexit`两个指令实现。可以把执行`monitorenter`指令理解为加锁，执行`monitorexit`理解为释放锁。 每个对象维护着一个记录着被锁次数的计数器。未被锁定的对象的该计数器为0，当一个线程获得锁（执行`monitorenter`）后，该计数器自增变为 1 ，当同一个线程再次获得该对象的锁的时候，计数器再次自增。当同一个线程释放锁（执行`monitorexit`指令）的时候，计数器再自减。当计数器为0的时候。锁将被释放，其他线程便可以获得锁。

无论是`ACC_SYNCHRONIZED`还是`monitorenter`、`monitorexit`都是基于Monitor实现的，在Java虚拟机(HotSpot)中，Monitor是基于C++实现的，由ObjectMonitor实现。

ObjectMonitor类中提供了几个方法，如`enter`、`exit`、`wait`、`notify`、`notifyAll`等。`sychronized`加锁的时候，会调用objectMonitor的enter方法，解锁的时候会调用exit方法。（关于Monitor详见[深入理解多线程（四）—— Moniter的实现原理](http://www.hollischuang.com/archives/2030)）

### synchronized与原子性

原子性是指一个操作是不可中断的，要全部执行完成，要不就都不执行。

我们在[Java的并发编程中的多线程问题到底是怎么回事儿？](http://www.hollischuang.com/archives/2618)中分析过：线程是CPU调度的基本单位。CPU有时间片的概念，会根据不同的调度算法进行线程调度。当一个线程获得时间片之后开始执行，在时间片耗尽之后，就会失去CPU使用权。所以在多线程场景下，由于时间片在线程间轮换，就会发生原子性问题。

在Java中，为了保证原子性，提供了两个高级的字节码指令`monitorenter`和`monitorexit`。前面中，介绍过，这两个字节码指令，在Java中对应的关键字就是`synchronized`。

通过`monitorenter`和`monitorexit`指令，可以保证被`synchronized`修饰的代码在同一时间只能被一个线程访问，在锁未释放之前，无法被其他线程访问到。因此，在Java中可以使用`synchronized`来保证方法和代码块内的操作是原子性的。

> 线程1在执行`monitorenter`指令的时候，会对Monitor进行加锁，加锁后其他线程无法获得锁，除非线程1主动解锁。即使在执行过程中，由于某种原因，比如CPU时间片用完，线程1放弃了CPU，但是，他并没有进行解锁。而由于`synchronized`的锁是可重入的，下一个时间片还是只能被他自己获取到，还是会继续执行代码。直到所有代码执行完。这就保证了原子性。

### synchronized与可见性

可见性是指当多个线程访问同一个变量时，一个线程修改了这个变量的值，其他线程能够立即看得到修改的值。

我们在[再有人问你Java内存模型是什么，就把这篇文章发给他。](http://www.hollischuang.com/archives/2550)中分析过：Java内存模型规定了所有的变量都存储在主内存中，每条线程还有自己的工作内存，线程的工作内存中保存了该线程中是用到的变量的主内存副本拷贝，线程对变量的所有操作都必须在工作内存中进行，而不能直接读写主内存。不同的线程之间也无法直接访问对方工作内存中的变量，线程间变量的传递均需要自己的工作内存和主存之间进行数据同步进行。所以，就可能出现线程1改了某个变量的值，但是线程2不可见的情况。

前面我们介绍过，被`synchronized`修饰的代码，在开始执行时会加锁，执行完成后会进行解锁。而为了保证可见性，有一条规则是这样的：对一个变量解锁之前，必须先把此变量同步回主存中。这样解锁后，后续线程就可以访问到被修改后的值。

所以，synchronized关键字锁住的对象，其值是具有可见性的。

### synchronized与有序性

有序性即程序执行的顺序按照代码的先后顺序执行。

我们在[再有人问你Java内存模型是什么，就把这篇文章发给他。](http://www.hollischuang.com/archives/2550)中分析过：除了引入了时间片以外，由于处理器优化和指令重排等，CPU还可能对输入代码进行乱序执行，比如load->add->save 有可能被优化成load->save->add 。这就是可能存在有序性问题。

这里需要注意的是，`synchronized`是无法禁止指令重排和处理器优化的。也就是说，`synchronized`无法避免上述提到的问题。

那么，为什么还说`synchronized`也提供了有序性保证呢？

这就要再把有序性的概念扩展一下了。Java程序中天然的有序性可以总结为一句话：如果在本线程内观察，所有操作都是天然有序的。如果在一个线程中观察另一个线程，所有操作都是无序的。

以上这句话也是《深入理解Java虚拟机》中的原句，但是怎么理解呢？周志明并没有详细的解释。这里我简单扩展一下，这其实和`as-if-serial语义`有关。

`as-if-serial`语义的意思指：不管怎么重排序（编译器和处理器为了提高并行度），单线程程序的执行结果都不能被改变。编译器和处理器无论如何优化，都必须遵守`as-if-serial`语义。

这里不对`as-if-serial语义`详细展开了，简单说就是，`as-if-serial语义`保证了单线程中，指令重排是有一定的限制的，而只要编译器和处理器都遵守了这个语义，那么就可以认为单线程程序是按照顺序执行的。当然，实际上还是有重排的，只不过我们无须关心这种重排的干扰。

所以呢，由于`synchronized`修饰的代码，同一时间只能被同一线程访问。那么也就是单线程执行的。所以，可以保证其有序性。

### synchronized与锁优化

前面介绍了`synchronized`的用法、原理以及对并发编程的作用。是一个很好用的关键字。

`synchronized`其实是借助Monitor实现的，在加锁时会调用objectMonitor的`enter`方法，解锁的时候会调用`exit`方法。事实上，只有在JDK1.6之前，synchronized的实现才会直接调用ObjectMonitor的`enter`和`exit`，这种锁被称之为重量级锁。

所以，在JDK1.6中出现对锁进行了很多的优化，进而出现轻量级锁，偏向锁，锁消除，适应性自旋锁，锁粗化(自旋锁在1.4就有，只不过默认的是关闭的，jdk1.6是默认开启的)，这些操作都是为了在线程之间更高效的共享数据 ，解决竞争问题。

关于自旋锁、锁粗化和锁消除可以参考[深入理解多线程（五）—— Java虚拟机的锁优化技术](http://www.hollischuang.com/archives/2344)。