

日期时间类型
    －日期：DATE,范围'1000-01-01'~'9999-12-31'
    －时间：Time,时分秒
    －日期时间：DATETIME
        '100-01-01 00:00:00'~'9999-12-31 23:59:59'
    －时间戳：TIMESTAMP,　记录某个事件发生的时间点
    －日期时间函数：
    　　now()  取当前系统时间
    　　sysdate()　取当前系统事件    #select sysdate(now());
    　　curdate()　取当前系统日期    #select curdate(now());
       curtime()　取当前系统时间    #select curtime(now());
       year()     取指定日期中的年份 #
       month()    去指定值日期中的月份
       day()      取指定日期中的天
       date()     取指定日期时间中的年月日
       time()     取指定日期时间中的时分秒
       示例：＇
    select now(), sysdate(); --取当前系统日期时间
    select curdate(),curtime(); --取当前日期、时间

    --先取出系统日期时间，再取出年份、月份、天
    select year(now()),month(now()), day(now());
                                   
    -- 先 取出系统日期时间，再取出日期、时间部分
    select date(now()), time(now());
