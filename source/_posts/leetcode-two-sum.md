---
title: 数据结构练习 - leetcode - 两数之和
date: 2018-12-24 20:13:39
desc: chanchfieng.com
---

<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

## 题目 ##

https://leetcode.com/problems/two-sum/：[https://leetcode.com/problems/two-sum/](https://leetcode.com/problems/two-sum/ "https://leetcode.com/problems/two-sum/")

```

	给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
	
	你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
	
	示例:
	
	Given nums = [2, 7, 11, 15], target = 9,
	
	Because nums[0] + nums[1] = 2 + 7 = 9,
	return [0, 1].

```

```

		/*
			四、key-value形式（学习官方在插入值的时候进行一次查找目标值，发现即即可返回）：
			设置一个Map,key为nums中的值，value为记录nums出现的下标，循环遍历一次nums中由哪些值组成target
			
			Runtime: 5 ms, faster than 75.81% of Java online submissions for Two Sum.
		* */
	
	    public int[] twoSum4(int[] nums, int target) {
	        Map<Integer, Integer> map = new HashMap<>();
	        for (int i = 0; i < nums.length; i++) {
	            int complement = target - nums[i];
	            if (map.containsKey(complement)) {
	                return new int[] { map.get(complement), i };
	            }
	            map.put(nums[i], i);
	        }
	        return null;
	    }
	
	    /*
	        三、key-value形式（学习官方仅存储下标）：
	        设置一个Map,key为nums中的值，value为记录nums出现的下标，循环遍历一次nums中由哪些值组成target
	
	        Runtime: 9 ms, faster than 48.65% of Java online submissions for Two Sum.
	    * */
	    public int[] twoSum3(int[] nums, int target) {
	        Map<Integer, Integer> map = new HashMap<>();
	        for (int i = 0; i < nums.length; i++) {
	            map.put(nums[i], i);
	        }
	        for (int i = 0; i < nums.length; i++) {
	            int complement = target - nums[i];//获取目标值
	            if (map.containsKey(complement) && map.get(complement) != i) {
	                return new int[] { i, map.get(complement) };
	            }
	        }
	        return null;
	    }
	
	    /*
	        二、key-value形式：
	        设置一个Map,key为nums中的值，value为记录nums出现的下标，循环遍历一次nums中由哪些值组成target
	
	        Runtime: 13 ms, faster than 43.49% of Java online submissions for Two Sum.
	    * */
	    public int[] twoSum2(int[] nums, int target) {
	        Map<Integer,List<Integer>> aMap = new HashMap<>();
	        for (int i = 0, lenI = nums.length; i < lenI; i++) {
	            if (aMap.get(nums[i]) != null) {
	                List<Integer> integers = aMap.get(nums[i]);
	                integers.add(i);
	                aMap.put(nums[i],integers);
	            }else{
	                List<Integer> aList = new ArrayList<>();
	                aList.add(i);
	                aMap.put(nums[i],aList);
	            }
	        }
	
	        for(int i = 0,lenI = nums.length;i<lenI;i++){
	            if(target - nums[i] != nums[i] && aMap.get(target - nums[i]) != null){
	                List<Integer> integers = aMap.get(target - nums[i]);
	                return new int[]{i, integers.get(0)};
	            }
	        }
	
	        List<Integer> integers = aMap.get(target / 2);
	        if(integers != null && integers.size() >= 2){
	
	            return new int[]{integers.get(0),integers.get(1)};
	        }
	
	        return null;
	    }
	
	    /*
	        一、暴力破解法：
	        由题目可以知道答案不能重复利用相同的元素，则j不可以为nums数组的长度而组成的嵌套循环，而是从i坐标开始的下一位组成的嵌套循环
	
	        Runtime: 32 ms, faster than 28.82% of Java online submissions for Two Sum.
	    * */
	    public int[] twoSum(int[] nums, int target) {
	        for(int i = 0,lenI = nums.length;i<lenI;i++){
	            for(int j = i+1,lenJ = nums.length;j<lenJ;j++){
	                if(nums[i] + nums[j] == target){
	                    return new int[]{i,j};
	                }
	            }
	        }
	        return null;
	    }
	
	    @Test
	    public void twoSumTest(){
	//        int[] nums = new int[]{2,7,11,15};
	//        int target = 9;
	
	//        int[] nums = new int[]{3,2,4};
	//        int target = 6;
	
	        int[] nums = new int[]{3,3};
	        int target = 6;
	
	        int[] ints = twoSum4(nums, target);
	        if(ints != null && ints.length == 2){
	            System.out.println(ints[0] + "," + ints[1]);
	        }else{
	            System.out.println("not find");
	        }
	    }

```

<div class="tip">
	开始做的时候，发现逻辑清晰简单，但是做完，测试的时候，发现会有这种nums{3,3}，target：6的情况，做的时候没有发现containsKey()的函数，导致一度怀疑自己是不是写错了，还是一句话，java基础不扎实，还是努力一把，复习下java的基础。		
</div>