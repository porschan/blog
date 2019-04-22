---
title: springboot - 使用 filter 过滤器
date: 2019-02-14 14:58:47
---

1.在springBootStudio项目中添加Module。

2.选择Spring Initializr，点击next。

![](springboot-filter/1.png)

3.Group填写com.chanchifeng，Artifact填写filter。

![](springboot-filter/2.png)

4.勾选SQL中的Web和Thymeleaf，点击next。

![](springboot-filter/3.png)

5.Content_root和Module file location选择springBootStudio项目路径。

![](springboot-filter/4.png)

6.在项目中创建一个controller包，在其下创建UserController的类，代码如下：

```

	@RestController
	public class UserController {
	
	    @RequestMapping("/home")
	    public String home(){
	        return "test Filter";
	    }
	
	}

```

7.在项目中创建一个filter包，在其下创建UserController的类，代码如下：

```

	@WebFilter(filterName = "userFilter", urlPatterns = "/*")
	public class UserFilter implements Filter {
	    @Override
	    public void init(FilterConfig filterConfig) throws ServletException {
	        System.out.println("---------->>> init");
	    }
	
	    @Override
	    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
	        System.out.println("---------->>> doFilter");
	        filterChain.doFilter(servletRequest,servletResponse);
	    }
	
	    @Override
	    public void destroy() {
	        System.out.println("---------->>> destory");
	    }
	}

```

8.追加FilterApplication，代码如下：

```

	@ServletComponentScan

```

9.运行项目，即可看到控制台打印init如下：

![](springboot-filter/5.png)

10.当用浏览器访问http://localhost:8080/home的时候，可以观察到控制台打印doFilter如下：

![](springboot-filter/6.png)