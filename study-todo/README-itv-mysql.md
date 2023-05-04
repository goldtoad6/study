# study- Mysql #
## 简介

MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。在Java企业级开发中非常常用，因为 MySQL 是开源免费的，并且方便扩展。



TODO

## Key关键点

- 行业调研、优势、代替方案等
- 索引结构 
- 数据库页
- 分页机制
- 聚簇索引
- change buffer 优化机制
- 各种Log【3大Log】
- Bin Log
- RedoLog
- UndoLog
- WAL 机制【write ahead log】
- MySQL 恢复机制，比如CRASH后如何数据恢复
- MySQL大表查询为什么不会爆内存
- 数据库主从备份
- 主从切换过程 
- 并发链接和并发查询
- 叶子节点分裂
- 相关锁
- MySQL自带表
- 聚集索引
- 隔离级别
- 三大范式



## 关系 VS 非关系

参考链接 https://blog.csdn.net/weixin_51468875/article/details/114087402



## MyISAM vs InnoDB

InnoDB

插入缓冲（insert buffer)
二次写(double write)
自适应哈希索引(ahi)
预读(read ahead)



## MySQL 架构

参考链接 

https://blog.csdn.net/qq_39234967/article/details/126091672

https://blog.csdn.net/weixin_70730532/article/details/125164081

- 网络连接层：提供与Mysql服务器建立连接的支持
- 核心服务层：主要包含系统管理和控制工具、连接池、SQL接口、解析器、查询优化器和缓存六个部分
- 存储引擎：负责Mysql中数据的存储与提取，与底层系统文件进行交互
- 文件系统：负责将数据库的数据和日志存储在文件系统之上，并完成与存储引擎的交互，是文件的物理存储层
  

架构图

![转载而来](https://img-blog.csdnimg.cn/20210303232240506.png)



## SQL执行过程

参考链接 https://blog.csdn.net/qwer123451234123/article/details/124344299

https://www.cnblogs.com/roadwide/p/17149506.html

包含数据恢复 https://www.qycn.com/xzx/article/17076.html



sql执行原理

## 索引结构

https://blog.csdn.net/m0_50275872/article/details/124138516

https://www.cnblogs.com/xingchong/p/16478639.html



### 索引分类

B+树索引
Hash索引(底层是哈希表，哈希索引做区间查询的速度是很慢,要扫描链表，适合等值查询)
Full-Text全文索引： https://blog.csdn.net/qq_41993206/article/details/109548867
R-Tree索引

不同角度，不同分类



空间索引 

https://www.cnblogs.com/LBSer/p/3392491.html

https://www.cnblogs.com/LBSer/p/3403933.html

### 索引底层结构





## 事务提交过程

参考链接 http://c.biancheng.net/view/7290.html



## 主从备份

参考链接 https://www.yzktw.com.cn/post/523759.html



## 主从切换 

http://cnblogs.com/liang24/p/14149412.html



## DB LOG

### Bin Log

binlog有有几种录入格式：statement，row和mixed

### undo Log

### redolog



## 聚集索引 

- MyISAM（ 非聚集）

- InnoDB（ 聚集索引）

- InnoDB要求表必须有主键（MyISAM可以没有）



## 索引



https://zhuanlan.zhihu.com/p/112857507 有很多关于索引的点



## 隔离级别



## 数据库三范式



## MySQL 项目结构

MySQL 常用操作记录？

权限



## 备忘

https://www.bilibili.com/video/BV1Ca411R7GG?p=46&vd_source=72424c3da68577f00ea40a9e4f9001a1




索引相关解释说明 https://blog.csdn.net/taoqilin/article/details/121230649

聚簇索引非聚簇索引 

https://blog.csdn.net/weixin_42131383/article/details/125338068

https://blog.csdn.net/weixin_33709364/article/details/94728136

索引覆盖、索引下推

https://mp.weixin.qq.com/s?__biz=MzU3Mjk2NDc3Ng==&mid=2247483828&idx=1&sn=c21c6720a83240c2b899ed81ef57b912&chksm=fcc9ab73cbbe2265ac05ec67cca251bba661e995a00ad2acf2fabb69471bdc56987cdcf5b5e9&scene=27

https://zhuanlan.zhihu.com/p/470255206

https://baijiahao.baidu.com/s?id=1716515482593299829&wfr=spider&for=pc

SQL执行过程 

https://blog.csdn.net/qq_41116027/article/details/124135359


