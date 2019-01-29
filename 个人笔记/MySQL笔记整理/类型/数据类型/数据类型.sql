
数据类型
	主要数据类型
	　－数值类型：整数　浮点数
	　－字符类型
	　－日期类型
	　－枚举类型：值相对较少　范围较固定

    1.数值类型
        1.－ int (大)整型 （占据4个字节）
            取值范围 ：
            无符号整型(unsigned) :0 ~ 2(32)-1
            有符号整型(signed 默认为有符号) : -2(31)~2(31)-1
		 -- tinyint 微小整型 （占据1个字节）
            有符号整型 ：-128 ~ 127
            无符号整型 ：0 ~ 255
            例 ：
                age tinyint unsigned
         -- smallint 小整型 (占据2个字节)
         -- bigint		(极)大整型 (占据8个字节)

		2. 浮点数
			1. float （4个字节，最多表示小数点后7位）
					用法 ：
						字段名 float(m,n)
						m表示总位数，n表示小数位的位数
			2. double（8个字节，最多表示小数点后15位）
			3. decimal 最多表示到小数点后28位
					用法 ：
						decimal(m,n)
		3. 练习
			1. 创建库 studb,在库中创建表stuInfo,要求
					id   大整型（int）
					name 字符型 char(10)
					age  无符号微小整型
					height 浮点型表示，2位小数位，3位整数位
					weight 浮点型,3位整数位，3位小数位
					---------------------------------
					create table stuInfo(
					id int,
					name char(10),
					age tinyint unsigned,
					height float(5,2),
					weight decimal(6,3)
					);
			2. 查看表结构
			3. 查看字符集
			4. 插入一条完整记录
			5. 在 id name两个字段下插入两条数据
			6. 查询所有学生的id和姓名

		4. 浮点型使用注意 ：
			1. 如果插入的是整数数据，小数位会自动补0
			2. 如果插入数据的小数位超出指定位数，会自动
				 四舍五入
			3. 整数位超出限制，插入失败
	2. 字符类型
		1. 定长 char(长度)
        　　最大能保存255字符，如果长度不足，使用空格填充
        　　超过规定长度，则无法存入，性能好于varchar

        2. 变长 varchar(长度)　可变长度
			 长度取值范围 ：1 ~ 65535
			 定长与变长的区别 ：
			 定长 ：根据指定的长度固定分配存储空间
				char(10)
				存储'a'，也要分配10个字符的空间
				优点 ：效率高，速度快
				缺点 ：浪费存储空间

			 变长 ：在不超过指定长度的情况下，动态分配存储
				空间
					varchar(10)
					存储'a',动态根据数据的字符长度分配空间
				优点 ：节省存储空间
				缺点 ：效率比定长存储要低
			 共同点 ：
				 给出的长度，就是最大输入的字符数，超出则
				 无法存储
				 例 ：
						name varchar(10)
						"wangzhaojun" 超出无法存储
		3. 长文本存储
			text
			longtext (4G)

		4.枚举类型：enum,set
		  -enum:　从给定范围选取一个
		  -set: 从给定范围选取一个或多个
		  - 示例：
		create table enum_test(
			name varchar(32),
			sex enum('boy','girl'),-- 从两者选一
			course set('music', 'dance','paint')
		);

		-- 在枚举范围内,可以插入
		insert into enum_test 
		values('Jerry', 'girl','music,dance');

		-- 在枚举范围之外,插入报错,football不在范围内
		insert into enum_test 
		values('Jerry', 'girl','music,football');