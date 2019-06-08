---
title: 冒泡排序
date: 2019-06-07 16:49:31
---

### 冒泡排序

```java
public static void main(String[] args) {
    int[] array = new int[]{1,2,3,2,5};
    Arrays.stream(bubbleSort(array)).forEach(System.out::println);
}

public static int[] bubbleSort(int[] array){
    if(array == null){
        return array;
    }
    int temp;
    for (int i = 0; i < array.length - 1; i++) {
        for (int j = 0; j < array.length - 1 - i; j++) {
            if(array[j] > array[j + 1]){
//                    两两交互，正常编写
//                    temp = array[j];
//                    array[j] = array[j+1];
//                    array[j + 1] = temp;

//                    两两交互，使用异或
                array[j + 1] = array[j + 1] ^ array[j];
                array[j] = array[j + 1] ^ array[j];
                array[j + 1] = array[j + 1] ^ array[j];
            }
        }
    }
    return array;
}
```

![](algorithm-sort/1.png)

> 对应异或的理解，可以参考李梵博客园的理解 java 使用 异或 交换两数https://www.cnblogs.com/bg7c/p/7998935.html