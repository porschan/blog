---
title: 使用 VS 创建 React 的 Hello world项目
date: 2019-07-08 09:54:41
---

1.前期准备：

```shell
全局下载工具：npm install -g create-react-ap
下载模板项目：npx create-react-app my-app
```

2.使用Visual Studio Code打开模板项目，如下图所示：

![](react-helloworld\1.png)

3.在Terminal中输入`npm start`,如下图所示：

![](react-helloworld\2.png)

4.编译器会自动打开项目的首页，此时显示的就是react的默认页面，如下图所示：

![](react-helloworld\3.png)

5.将默认生成出来的src文件夹下的全部文件删掉，这里需要重新创建如下图的文件或者文件夹，如下图所示：

添加文件夹：`src/api`、`src/asset`、`src/components`、`src/config`、`src/pages`、`src/utils`、`public/css`

添加文件：`public/css/reset.css`、`src/App.js`、`src/index.js`

![](react-helloworld\4.png)

6.public/css/reset.css

```css
/*! minireset.css v0.0.4 | MIT License | github.com/jgthms/minireset.css */
html,
body,
p,
ol,
ul,
li,
dl,
dt,
dd,
blockquote,
figure,
fieldset,
legend,
textarea,
pre,
iframe,
hr,
h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 0;
  padding: 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-size: 100%;
  font-weight: normal;
}

ul {
  list-style: none;
}

button,
input,
select,
textarea {
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

img,
embed,
iframe,
object,
video {
  height: auto;
  max-width: 100%;
}

audio {
  max-width: 100%;
}

iframe {
  border: 0;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

td,
th {
  padding: 0;
  text-align: left;
}

html, body {
  height: 100%;
  width: 100%;
}

#root {
  height: 100%;
  width: 100%;
}
```

参考：<https://github.com/jgthms/minireset.css/blob/master/minireset.css>

7.public/index.html

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
    <link rel="stylesheet" href="/css/reset.css">
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>
```

8.src/App.js

```js
import React, {Component} from 'react'

/*
应用的根组件
 */
export default class App extends Component {
    render () {
        return <div>Hello world</div>
    }
}
```

9.index.js

```js
/*
入口js
 */
import React from 'react'
import ReactDOM from 'react-dom'

import App from './App'

// 将App组件标签渲染到index页面的div上
ReactDOM.render(<App />, document.getElementById('root'))
```

10.观察package.json是否有有react的对应的组件，如下图所示，保存上面的文件，服务会自动部署并显示最新的页面。

![](react-helloworld\5.png)

11.效果如下图所示：

![](react-helloworld\6.png)