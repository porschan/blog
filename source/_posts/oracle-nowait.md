---
title: Oracle - 资源正忙, 但指定以 NOWAIT 方式获取资源, 或者超时失效
date: 2019-07-11 13:04:56
---

> 参考<<https://blog.csdn.net/qq_37151235/article/details/74612957>>

1.查询被锁的会话ID：

```sql
select session_id from v$locked_object;

-- 查询结果：SESSION_ID-------9
```

2.查询上面会话的详细信息：

```sql
SELECT sid, serial#, username, osuser FROM v$session where sid = 9;

-- sid serial# username osuser
-- 9	99		HB		WW
```

3.将上面锁定的会话关闭：

```sql
ALTER SYSTEM KILL SESSION '9,99';
```

4.锁定的会话关闭成功之后对之前的表就可以执行想要的操作了。

