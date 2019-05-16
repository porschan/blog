---
title: 设计模式 - 原型模式
date: 2019-05-16 10:58:28
---

### 感想

原型模式：通过复制现有实例来创建新的实例，无须知道相应类的信息。

原型模式的优点：
- 使用原型模式创建对象比直接new一个对象更有效。
- 隐藏制造新实例的复杂性。
- 重复地创建相似对象可以考虑使用原型模式。

原型模式的缺点：
- 每一个类必须配备一个克隆方法。
- 深层复杂比较复杂。

原型模式的注意事项：
- 使用原型模式复制对象不会调用类的构造方法。所以，单例模式与原型模式是冲突的，在使用时要特别注意。
- Object类的clone方法只会拷贝对象中的基本的数据类型，对于数组、容器对象、引用对象等都不会拷贝，这就是浅拷贝。如果要实现深拷贝，必须将原型模式中的数组、容器对象、引用对象等另外拷贝。

以下例子以发送邮箱作为实际开发。

a.创建一个事件的模板：

```java
public class EventTemplate {
    private String eventSubject, eventContent;

    public EventTemplate(String eventSubject, String eventContent) {
        this.eventSubject = eventSubject;
        this.eventContent = eventContent;
    }

    public String geteventSubject() {
        return eventSubject;
    }

    public String geteventContent() {
        return eventContent;
    }
}
```

b.实现Cloneable接口的邮件对象：

```java
import java.util.ArrayList;

public class Mail implements Cloneable {
    private String receiver;
    private String content;
    private ArrayList<String> ars;

    private String tail;
    private String subject;

    public Mail(EventTemplate et) {
        this.tail = et.geteventContent();
        this.subject = et.geteventSubject();

    }

    @Override
    public Mail clone() {
        Mail mail = null;
        try {
            //实现深拷贝
            mail = (Mail) super.clone();
            mail.ars = (ArrayList<String>) this.ars.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return mail;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public String getTail() {
        return tail;
    }

    public void setTail(String tail) {
        this.tail = tail;
    }

}
```

c.客户端使用：

```java
import java.util.Random;

public class MainTest {
    public static void main(String[] args) {
        int i = 0;
        int MAX_COUNT = 10;
        EventTemplate et = new EventTemplate("9月份信用卡账单", "国庆抽奖活动...");

        Mail mail = new Mail(et);

        while (i < MAX_COUNT) {
            // 以下是每封邮件不同的地方
            Mail cloneMail = mail.clone();
            cloneMail.setContent(getRandString(5) + ",先生（女士）:你的信用卡账单..." + mail.getTail());
            cloneMail.setReceiver(getRandString(5) + "@" + getRandString(8) + ".com");
            // 然后发送邮件
            sendMail(cloneMail);
            i++;
        }

    }

    /**
     * 仅用于测试获取随机的字符串
     * @param maxLength
     * @return
     */
    public static String getRandString(int maxLength) {
        String source = "abcdefghijklmnopqrskuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuffer sb = new StringBuffer();
        Random rand = new Random();
        for (int i = 0; i < maxLength; i++) {
            sb.append(source.charAt(rand.nextInt(source.length())));
        }
        return sb.toString();
    }

    public static void sendMail(Mail mail) {
        System.out.println("标题：" + mail.getSubject() + "\t收件人："
                + mail.getReceiver() + "\t内容：" + mail.getContent()
                + "\t....发送成功！");
    }

}
```