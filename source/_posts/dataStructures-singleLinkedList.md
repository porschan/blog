---
title: 根据编号有序的单向链表
date: 2019-06-28 16:18:43
---

##### 根据编号有序的单向链表

```java
public class SingleLinkedListDemo {

    public static void main(String[] args) {
        //test
        HeroNode hero1 = new HeroNode(1, "宋江", "及时雨");
        HeroNode hero2 = new HeroNode(2, "卢俊义", "玉麒麟");
        HeroNode hero3 = new HeroNode(3, "吴用", "智多星");
        HeroNode hero4 = new HeroNode(4, "林冲", "豹子头");

        //创建链表
        SingleLinkedList singleLinkedList = new SingleLinkedList();
//        singleLinkedList.add(hero1);
//        singleLinkedList.add(hero3);
//        singleLinkedList.add(hero2);
//        singleLinkedList.add(hero4);

        //加入按照编号
        singleLinkedList.addByOrder(hero1);
        singleLinkedList.addByOrder(hero3);
        singleLinkedList.addByOrder(hero2);
        singleLinkedList.addByOrder(hero4);
        singleLinkedList.addByOrder(hero2);

        //测试修改节点的代码
        HeroNode newHeroNode = new HeroNode(2, "小卢", "小麒麟");
        singleLinkedList.update(newHeroNode);

        //删除一个节点
        singleLinkedList.delete(4);
        singleLinkedList.delete(1);
        singleLinkedList.delete(2);
        singleLinkedList.delete(3);

        singleLinkedList.list();

    }

}

//定义SingleLinkedList管理我们的英雄。
class SingleLinkedList{
    //先初始化头节点，头节点不要动,不存放具体的数据
    private HeroNode head = new HeroNode(0,"","");

    //添加节点到单向链表
    //思路，不考虑编号顺序时
    // 1.找到当前链表的最后节点。
    //2.将最后这个节点的next指向新的节点
    public void add(HeroNode heroNode){
        //因为head节点不能动，因此我们需要一个赋值遍历 temp
        HeroNode temp = head;

        //遍历链表，找到最后
        while(true){
            //找到链表最后
            if(temp.next == null){
                break;
            }
            //如果不是链表最后，就后移一个
            temp = temp.next;
        }

        //当退出while循环是，temp就指向了链表最后

        temp.next = heroNode;
    }

    //有序的添加英雄
    //顺序为升序
    public void addByOrder(HeroNode heroNode){
        //因为头节点不能动，因此我们仍然通过一个辅助指针（变量）来帮助找到添加的位置。
        //因为单链表，因此我们找的temp是位于添加位置的前一个节点，否则插入不了。
        HeroNode temp = head;

        //标注添加的编号是否存在，默认为false
        boolean flag = false;
        while(true){
            //说明temp已经在链表的最后
            if(temp.next == null){
                break;
            }
            if(temp.next.no > heroNode.no){
                //位置找到了，就在temp的后面插入
                break;
            }else if(temp.next.no == heroNode.no){
                //heroNode的编号已经存在
                flag = true;
                break;
            }
            //后移，遍历当前链表
            temp = temp.next;
        }

        if(flag){
            //不能添加，编号已经存在
            System.out.printf("准备插入的英雄的编号%d 已经存在，不能存在\n",heroNode.no);
        }else{
            //插入到链表中
            heroNode.next = temp.next;
            temp.next = heroNode;
        }
    }

    //修改节点信息，根据no编号来修改，即no编号不能改
    //根据新的节点来修改
    public void update(HeroNode heroNode){
        //判断链表是否空的。
        if(head.next == null){
            System.out.println("链表为空。");
            return;
        }
        //找到需要修改的节点，根据弄编号。
        //定义一个辅助变量
        HeroNode temp = head.next;
        //表示是否找到节点
        boolean flag = false;
        while(true){
            //说明temp已经遍历完链表
            if(temp.next == null){
                break;
            }
            if(temp.no == heroNode.no){
                //找到
                flag = true;
                break;
            }
            temp = temp.next;
        }
        //根据flag判断是否找到需要修改的节点
        if(flag){
            temp.name = heroNode.name;
            temp.nickName = heroNode.nickName;
        }else{
            //没有找到节点
            System.out.printf("没有找到编号 %d 的节点",heroNode.no);
        }
    }

    //删除节点
    public void delete(int no){
        //1. head 不能动，因此我们需要一个temp辅助节点找到代删除节点的前一个节点。
        //2.说明我们在比较时，是temp.next.no和需要删除的节点no做比较
        HeroNode temp = head;
        //表示是否找到待删除节点的前一个节点
        boolean flag = false;
        while(true){
            if(temp.next == null){
                break;
            }
            if(temp.next.no == no){
                //找到待删除节点的前一个节点temp
                flag = true;
                break;
            }
            //temp 后移，遍历
            temp = temp.next;
        }
        //判断flag
        if(flag){
            //找到
            temp.next = temp.next.next;
        }else{
            System.out.printf("要删除的节点编号 %d不存在",no);
        }
    }

    //显示列表【遍历】
    public void list(){
        //判断链表是否为空
        if(head.next == null){
            System.out.println("链表为空~~");
            return;
        }
        //因为头节点不能动，所以我们需要一个辅助变量来遍历
        HeroNode temp = head.next;
        while(true){
            //判断是否链表最后
            if(temp == null){
                break;
            }
            //输出节点的信息
            System.out.println(temp.toString());
            temp = temp.next;
        }
    }
}

//定义Hero人Node，每个HeroNode对象就是一个节点
class HeroNode {

    public int no;

    public String name;

    public String nickName;

    //指向下一个节点
    public HeroNode next;

    //构造器
    public HeroNode(int no, String name, String nickName) {
        this.no = no;
        this.name = name;
        this.nickName = nickName;
    }

    //为了显示方便，我们重新同String

    @Override
    public String toString() {
        return "HeroNode{" +
                "no=" + no +
                ", name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                '}';
    }
}
```

