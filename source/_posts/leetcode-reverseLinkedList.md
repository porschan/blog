---
title: 数据结构练习 - leetcode - 反转链表
date: 2019-01-30 21:10:41
---

## 题目 ##

反转链表：[https://leetcode.com/problems/reverse-linked-list/]("https://leetcode.com/problems/reverse-linked-list/")

```

	public class ReverseLinkedList {
	
	    public class ListNode {
	        int val;
	        ListNode next;
	
	        ListNode(int x) {
	            val = x;
	        }
	    }
	
	    @Test
	    public void test1() {
	
	        ListNode a = new ListNode(1);
	        ListNode b = new ListNode(2);
	        ListNode c = new ListNode(3);
	        ListNode d = new ListNode(4);
	        ListNode e = new ListNode(5);
	
	        a.next = b;
	        b.next = c;
	        c.next = d;
	        d.next = e;
	        e.next = null;
	
	        ListNode listNode = reverseList2(a);
	    }
	
	    //迭代
	    public ListNode reverseList2(ListNode head) {
	        //判断是链表是否为空或者只有一个值的列表
	        ListNode pre = null, cur = head;
	        while (cur != null){
	            ListNode next = cur.next;
	            cur.next = pre;
	            pre = cur;
	            cur = next;
	        }
	        return pre;
	    }
	
	}

```