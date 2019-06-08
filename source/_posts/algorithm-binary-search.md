---
title: 二分查找
date: 2019-06-07 15:25:11
---

### 二分查找：

1. 数组内的值必须按顺序排列。

```java
public static void main(String[] args) {
    int[] array = new int[1000];
    for (int i = 0; i < array.length; i++) {
        array[i] = i;
    }
    System.out.println(binarySearch(array,173));
}

public static int binarySearch(int[] array,int target){
    //查找范围起点
    int start = 0;

    //查找范围终点
    int end = array.length - 1;

    //查找范围中位数
    int mid;
    while (start<=end){
        //mid = (start+end)/2 有可能溢出
        mid = start + (start + end) / 2;
        if(array[mid] == target){
            return mid;
        }else if(array[mid] < target){
            start = mid + 1;
        }else{
            end = mid - 1;
        }
    }
    return -1;
}
```

