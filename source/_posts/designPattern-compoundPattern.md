---
title: 设计模式 - 复合模式
date: 2019-05-08 15:25:47
---

### 感想 ###

复合模式：模式常一起使用，组合在一个设计解决方案中，复合模式在一个解决方案中结合两个或多个模式，能解决一般性或一系列的问题，某些模式结合使用，并不就是复合模式。

MVC复合模式：

MVC：（Model - View - Controller）

Model：是程序主体，代表了业务数据和业务逻辑。

View：是与用户交互的页面，显示数据、接收输入，但不参与实际业务逻辑。

Controller：接收用户输入，并解析反馈给Model。

MVC里面的模式：

View和Controller都是Model的观察者模式。

View以组合模式来管理控件。

View与Controller是策略模式关系，Controller提供策略。