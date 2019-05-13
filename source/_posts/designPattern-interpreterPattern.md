---
title: 设计模式 - 解释器模式
date: 2019-05-13 15:16:26
---

### 感想 ###

解释器模式：定义一个语法，定义一个解释器，该解析器处理该语法句子，将某些复杂问题，表达为某种语法规则，让后构建解析器来处理这类句子。

解释器模式优点：

- 容易修改，修改语法规则只要修改相应非终结符即可。
- 扩展方便，扩展语法，只要添加非终结符类即可。

解释器模式缺点：

- 对于复杂语法的表示会产生复杂的类层次结构，不便管理和维护。
- 解析器采用递归方式，效率会受影响。

a.AbstractExpresstion：

```java
public abstract class AbstractExpresstion {
    public abstract Float interpreter(HashMap<String, Float> var);
}
```

b.AddExpresstion：

```java
public class AddExpresstion extends SymbolExpresstion {

    public AddExpresstion(AbstractExpresstion _left, AbstractExpresstion _right) {
        super(_left, _right);
    }

    @Override
    public Float interpreter(HashMap<String, Float> var) {
        return super.left.interpreter(var) + super.right.interpreter(var);
    }

}
```

c.DivExpresstion：

```java
public class DivExpresstion extends SymbolExpresstion {

    public DivExpresstion(AbstractExpresstion _left, AbstractExpresstion _right) {
        super(_left, _right);
    }

    @Override
    public Float interpreter(HashMap<String, Float> var) {
        return super.left.interpreter(var) / super.right.interpreter(var);
    }

}
```

d.MultiExpresstion：

```java
public class MultiExpresstion extends SymbolExpresstion {

    public MultiExpresstion(AbstractExpresstion _left, AbstractExpresstion _right) {
        super(_left, _right);
    }

    @Override
    public Float interpreter(HashMap<String, Float> var) {
        return super.left.interpreter(var) * super.right.interpreter(var);
    }

}
```

e.RPN：

```java
public class RPN {

    private ArrayList<String> expression = new ArrayList<String>();// 存储中序表达式

    private ArrayList<String> right = new ArrayList<String>();// 存储右序表达式

    private AbstractExpresstion result;// 结果

    // 依据输入信息创建对象，将数值与操作符放入ArrayList中
    public RPN(String input) {
        StringTokenizer st = new StringTokenizer(input, "+-*/()", true);
        while (st.hasMoreElements()) {
            expression.add(st.nextToken());
        }
    }

    // 将中序表达式转换为右序表达式
    private void toRight() {
        Stacks aStack = new Stacks();
        String operator;
        int position = 0;
        while (true) {
            if (Calculate.isOperator((String) expression.get(position))) {
                if (aStack.top == -1
                        || ((String) expression.get(position)).equals("(")) {
                    aStack.push(expression.get(position));
                } else {
                    if (((String) expression.get(position)).equals(")")) {
                        if (!((String) aStack.top()).equals("(")) {
                            operator = (String) aStack.pop();
                            right.add(operator);
                        }
                    } else {
                        if (Calculate.priority((String) expression
                                .get(position)) <= Calculate
                                .priority((String) aStack.top())
                                && aStack.top != -1) {
                            operator = (String) aStack.pop();
                            if (!operator.equals("(")) {
                                right.add(operator);
                            }
                        }
                        aStack.push(expression.get(position));
                    }
                }
            } else {
                right.add(expression.get(position));
            }
            position++;
            if (position >= expression.size()) {
                break;
            }
        }
        while (aStack.top != -1) {
            operator = (String) aStack.pop();
            right.add(operator);
        }
    }

    // 对右序表达式进行求值
    public void getResult(HashMap<String, Float> var) {
        this.toRight();
        Stack<AbstractExpresstion> stack = new Stack<AbstractExpresstion>();
        AbstractExpresstion op1, op2;
        String is = null;
        Iterator it = right.iterator();

        while (it.hasNext()) {
            is = (String) it.next();
            if (Calculate.isOperator(is)) {
                op2 = stack.pop();
                op1 = stack.pop();
                stack.push(Calculate.twoResult(is, op1, op2));
            } else {
                stack.push(new VarExpresstion(is));
            }
        }
        result = stack.pop();
        it = expression.iterator();
        while (it.hasNext()) {
            System.out.print((String) it.next());
        }
        System.out.println("=" + result.interpreter(var));
    }

    public static class Calculate {
        // 判断是否为操作符号
        public static boolean isOperator(String operator) {
            if (operator.equals("+") || operator.equals("-")
                    || operator.equals("*") || operator.equals("/")
                    || operator.equals("(") || operator.equals(")")) {
                return true;
            } else {
                return false;
            }
        }

        // 设置操作符号的优先级别
        public static int priority(String operator) {
            if (operator.equals("+") || operator.equals("-")
                    || operator.equals("(")) {
                return 1;
            } else if (operator.equals("*") || operator.equals("/")) {
                return 2;
            } else {
                return 0;
            }
        }

        // 做2值之间的计算
        public static AbstractExpresstion twoResult(String op, AbstractExpresstion a, AbstractExpresstion b) {
            try {

                AbstractExpresstion result = null;
                if (op.equals("+")) {
                    result = new AddExpresstion(a, b);
                } else if (op.equals("-")) {
                    result = new SubExpresstion(a, b);
                } else if (op.equals("*")) {
                    result = new MultiExpresstion(a, b);
                } else if (op.equals("/")) {
                    result = new DivExpresstion(a, b);
                } else {
                }
                return result;
            } catch (NumberFormatException e) {
                System.out.println("input has something wrong!");
                return null;
            }
        }
    }

    // 栈类
    public class Stacks {
        private LinkedList list = new LinkedList();
        int top = -1;

        public void push(Object value) {
            top++;
            list.addFirst(value);
        }

        public Object pop() {
            Object temp = list.getFirst();
            top--;
            list.removeFirst();
            return temp;

        }

        public Object top() {
            return list.getFirst();
        }
    }
}

```

f.SubExpresstion

```java
public class SubExpresstion extends SymbolExpresstion {

    public SubExpresstion(AbstractExpresstion _left, AbstractExpresstion _right) {
        super(_left, _right);
    }

    @Override
    public Float interpreter(HashMap<String, Float> var) {
        return super.left.interpreter(var) - super.right.interpreter(var);
    }

}
```

g.SymbolExpresstion：

```java
public abstract class SymbolExpresstion extends AbstractExpresstion {
	protected AbstractExpresstion left;
	protected AbstractExpresstion right;

	public SymbolExpresstion(AbstractExpresstion _left,
			AbstractExpresstion _right) {
		this.left = _left;

		this.right = _right;
	}

}
```

h.VarExpresstion：

```java
public class VarExpresstion extends AbstractExpresstion {
    private String key;

    public VarExpresstion(String _key) {

        this.key = _key;

    }

    @Override
    public Float interpreter(HashMap<String, Float> var) {
        return var.get(this.key);
    }

}
```

i.Calculator：

```java
public class Calculator {

	public Calculator() {
		float[][] dataSource = new float[3][6];
		System.out.println("data source:");
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 6; j++) {
				dataSource[i][j] = (float) (Math.random() * 100);
				System.out.print(dataSource[i][j] + ",");
			}
			System.out.println(";");
		}

		try {
			System.out.println("Input a expression:");
			BufferedReader is = new BufferedReader(new InputStreamReader(System.in));
			for (;;) {
				String input = new String();
				input = is.readLine().trim();
				if (input.equals("q")) {
					break;
				} else {
					RPN boya = new RPN(input);
					HashMap<String, Float> var;
					for (int i = 0; i < 3; i++) {
						var = new HashMap<String, Float>();
						var.put("a", dataSource[i][0]);
						var.put("b", dataSource[i][1]);
						var.put("c", dataSource[i][2]);
						var.put("d", dataSource[i][3]);
						var.put("e", dataSource[i][4]);
						var.put("f", dataSource[i][5]);

						boya.getResult(var);

					}

				}
				System.out.println("Input another expression or input 'q' to quit:");
			}
			is.close();
		} catch (IOException e) {
			System.out.println("Wrong input!!!");
		}

	}

}
```

j.客户端使用：

```java
public class MainTest {
	public static void main(String[] args) {

		new Calculator();
	}
}
```