---
title: 最大公约数 & 最少公倍数
date: 2019-06-05 23:08:58
---

求最大公约数 &  最少公倍数

介绍从百度搜索出来，链接:https://baike.baidu.com/item/%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0/869308?fr=aladdin

![](algorithm-gcd/1.png)

a.在网上看到一种写法如下：

```java
	public static void main(String[] args){

		Scanner scan = new Scanner(System.in);

		System.out.println("请输入第一个正整数：");
		int m = scan.nextInt();

		System.out.println("请输入第二个正整数：");
		int n = scan.nextInt();

		//获取最大公约数
		//1.获取两个数中的较小值
		int min = (m <= n)? m : n;
		//2.遍历

		for(int i = min;i >= 1 ;i--){
			if(m % i == 0 && n % i == 0){
				System.out.println("最大公约数为：" + i);
				break;//一旦在循环中执行到break，就跳出循环
			}
		}

		//获取最小公倍数
		//1.获取两个数中的较大值
		int max = (m >= n)? m : n;
		//2.遍历
		for(int i = max;i <= m * n;i++){
			if(i % m == 0 && i % n == 0){

				System.out.println("最小公倍数：" + i);
				break;

			}
		}

	}
```

b.[推荐]自己了解什么是最大公约数和最小公倍数后进行再次编写：

```java
@Test
	public void test1(){

		System.out.println("最大公约数：" + gcd(319,377));
		System.out.println("最小公倍数：" +gcd_min(319,377));
	}

	public int gcd(int number1,int number2){
		if(number1 >0 && number2 >0){
			int tempNumber1 = number1,tempNumber2 = number2;
			//zsgps - 最大公约数，index - 倍数
			int zsgps = 1,index = 2;
			for(;;){
				if((index >= tempNumber1) && (index >= tempNumber2)){
					break;
				}
				if(tempNumber1 % index == 0 && tempNumber2 % index == 0){
					//找到一个质因数
					zsgps *= index;
					tempNumber1 = tempNumber1 / index;
					tempNumber2 = tempNumber2 / index;
					index = 2;
				}else{
					index++;
				}

			}
			return zsgps;
		}
		return -1;
	}

    public int gcd_min(int number1,int number2){
        if(number1 >0 && number2 >0){
            int tempNumber1 = number1,tempNumber2 = number2;
            //zsgbs - 最小公倍数，index - 倍数
            int zsgbs = 1,index = 2;
            for(;;){
                if((index >= tempNumber1) && (index >= tempNumber2)){
                    zsgbs *= tempNumber1 * tempNumber2;
                    break;
                }
                if(tempNumber1 % index == 0 && tempNumber2 % index == 0){
                    //找到一个质因数
                    zsgbs *= index;
                    tempNumber1 = tempNumber1 / index;
                    tempNumber2 = tempNumber2 / index;
                    index = 2;
                }else{
                    index++;
                }

            }
            return zsgbs;
        }
        return -1;
    }
```

