---
title: 设计模式 - 生成器模式
date: 2019-05-12 11:23:40
---

### 感想 ###

生成器模式：封装一个复杂对象构建过程，并允许按步骤构造。

生成器模式有点：

- 将复杂对象的创建过程封装起来。
- 允许对象通过几个步骤来创建，并且可以改变过程（工程模式只有一个步骤）。
- 只需指定具体生成器就能生成特定对象，隐藏类的内部结构。
- 对象的实现可以被替换。

a.以下以旅游社的行程表为例子，定义一个行程表：

```java
    public class Vacation {
        private ArrayList<VacationDay> mVacationDayLst;
        private Date mStDate;
        private int mDays = 0;
        private VacationDay mVacationDay;

        public Vacation(String std) {
            mVacationDayLst = new ArrayList<VacationDay>();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                mStDate = sdf.parse(std);
                mVacationDay = new VacationDay(mStDate);
                mVacationDayLst.add(mVacationDay);
                mDays++;
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        public void setStDate(String std) {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                mStDate = sdf.parse(std);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        }

        public Date getStDate() {
            return mStDate;
        }

        public void addDay() {

            mVacationDay = new VacationDay(nextDate(mDays));
            mVacationDayLst.add(mVacationDay);
            mDays++;
        }

        public boolean setVacationDay(int i) {
            if ((i > 0) && (i < mVacationDayLst.size())) {
                mVacationDay = mVacationDayLst.get(i);
                return true;
            }
            mVacationDay = null;
            return false;
        }

        public void setHotel(String mHotels) {
            mVacationDay.setHotel(mHotels);
        }

        public void addTicket(String ticket) {
            mVacationDay.addTicket(ticket);
        }

        public void addEvent(String event) {
            mVacationDay.addEvent(event);
        }

        public void showInfo() {
            for (int i = 0, len = mVacationDayLst.size(); i < len; i++) {
                System.out.println("** " + (i + 1) + " day**");
                System.out.println(mVacationDayLst.get(i).showInfo());
            }
        }

        private Date nextDate(int n) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(mStDate);
            cal.add(Calendar.DATE, n);
            return cal.getTime();
        }
    }
```

b.定义当天行程：

```java
    public class VacationDay {
        private Date mDate;
        private String mHotels;
        private ArrayList<String> mTickets = null;
        private ArrayList<String> mEvents = null;

        public VacationDay(Date date) {
            mDate = date;
            mTickets = new ArrayList<String>();
            mEvents = new ArrayList<String>();
        }

        public void setDate(Date date) {
            mDate = date;
        }

        public void setHotel(String mHotels) {
            this.mHotels = mHotels;
        }

        public void addTicket(String ticket) {
            mTickets.add(ticket);
        }

        public void addEvent(String event) {
            mEvents.add(event);
        }

        public String showInfo() {
            StringBuilder stb = new StringBuilder();
            stb.append("Date:" + mDate.toString() + "\n");
            stb.append("Hotel:" + mHotels + "\n");
            stb.append("Tickets:" + mTickets.toString() + "\n");
            stb.append("Events" + mEvents.toString() + "\n");

            return stb.toString();
        }
    }
```

c.定义一个抽象的生成器：

```java
    public abstract class AbsBuilder {

        public Vacation mVacation;

        public AbsBuilder(String std) {
            mVacation = new Vacation(std);
        }

        public abstract void buildvacation();

        public abstract void buildDay(int i);

        public abstract void addHotel(String hotel);

        public abstract void addTicket(String ticket);

        public abstract void addEvent(String tvent);

        public Vacation getVacation() {

            return mVacation;

        }

    }
```

d1.定义3天的行程表：

```java
    public class Builder3d extends AbsBuilder {

        public Builder3d(String std) {
            super(std);
        }

        @Override
        public void buildDay(int i) {
            mVacation.setVacationDay(i);
        }

        @Override
        public void addHotel(String hotel) {
            mVacation.setHotel(hotel);
        }

        @Override
        public void addTicket(String ticket) {
            mVacation.addTicket(ticket);
        }

        @Override
        public void addEvent(String event) {
            mVacation.addEvent(event);
        }

        @Override
        public void buildvacation() {
            addTicket("Plane Ticket");
            addEvent("Fly to Destination");
            addEvent("Supper");
            addEvent("Dancing");
            addHotel("Four Seasons");

            mVacation.addDay();
            addTicket("Theme Park");
            addEvent("Bus to Park");
            addEvent("lunch");
            addHotel("Four Seasons");

            mVacation.addDay();

            addTicket("Plane Ticket");
            addEvent("City Tour");
            addEvent("Fly to Home");

        }

    }
```

d2.定义4天的行程表：

```java
    public class Builder4d extends AbsBuilder {

        public Builder4d(String std) {
            super(std);
        }

        @Override
        public void buildDay(int i) {
            mVacation.setVacationDay(i);
        }

        @Override
        public void addHotel(String hotel) {
            mVacation.setHotel(hotel);
        }

        @Override
        public void addTicket(String ticket) {
            mVacation.addTicket(ticket);
        }

        @Override
        public void addEvent(String event) {
            mVacation.addEvent(event);
        }

        @Override
        public void buildvacation() {

            addTicket("Plane Ticket");
            addEvent("Fly to Destination");
            addEvent("Supper");
            addHotel("Hilton");

            mVacation.addDay();
            addTicket("Zoo Ticket");
            addEvent("Bus to Zoo");
            addEvent("Feed animals");
            addHotel("Hilton");

            mVacation.addDay();
            addTicket("Beach");
            addEvent("Swimming");
            addHotel("Home inn");

            mVacation.addDay();
            addTicket("Plane Ticket");
            addEvent("Fly to Home");
        }

    }
```

d3.定义自定义的行程表：

```java
    public class BuilderSelf {
        public Vacation mVacation;

        private String std;

        public BuilderSelf(String std) {
            this.std = std;
    //        mVacation = new Vacation(std);
        }

        public BuilderSelf addDay() {
            if(mVacation == null){
                mVacation = new Vacation(std);
            }else{
                mVacation.addDay();
            }

            return this;
        }

        public BuilderSelf buildDay(int i) {
            mVacation.setVacationDay(i);
            return this;
        }

        public BuilderSelf addHotel(String hotel) {
            mVacation.setHotel(hotel);
            return this;
        }

        public BuilderSelf addTicket(String ticket) {
            mVacation.addTicket(ticket);
            return this;
        }

        public BuilderSelf addEvent(String event) {
            mVacation.addEvent(event);
            return this;
        }

        public Vacation getVacation() {
            return mVacation;
        }
    }
```

e.定义一个在代办人：

```java
    public class Director {
        private AbsBuilder builder;

        public Director(AbsBuilder builder) {
            this.builder = builder;
        }

        public void setBuilder(AbsBuilder builder) {
            this.builder = builder;
        }

        public void construct() {
            builder.buildvacation();
            builder.getVacation().showInfo();
        }
    }
```
f.客户端使用：

```java
    public class App {

        public static void main(String[] args) {

            Director mDirector = new Director(new Builder4d("2015-12-29"));
            mDirector.construct();

            mDirector.setBuilder(new Builder3d("2015-8-30"));
            mDirector.construct();

            testself();
        }

        /**
         * 自定义
         */
        public static void testself() {

            BuilderSelf builder = new BuilderSelf("2015-9-29");

            builder.addDay().addTicket("Plane Ticket").addEvent("Fly to Destination")
                    .addEvent("Supper").addHotel("Hilton");

            builder.addDay().addTicket("Zoo Ticket").addEvent("Bus to Zoo")
                    .addEvent("Feed animals").addHotel("Home Inn");

            builder.addDay();
            builder.addTicket("Beach");
            builder.addEvent("Swimming");
            builder.addHotel("Home inn");

            builder.addDay().addTicket("Plane Ticket").addEvent("Fly to Home");
            builder.getVacation().showInfo();
        }

    }
```