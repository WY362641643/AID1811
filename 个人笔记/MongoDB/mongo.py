from pymongo import MongoClient

#创建数据库连接
conn = MongoClient('localhost',27017)

#创建数据库对象
db = conn.stu 

#创建集合对象
myset = db['class4']

#操作数据
# print(dir(myset))

#插入文档
# myset.insert_one({'name':'张铁林','King':'乾隆'})

# myset.insert_many([{'name':'张国立','King':'康熙'},\
# {'name':'陈道明','King':'康熙'}])

# myset.insert({'name':'唐国强','King':'雍正'})
# myset.insert([{'name':'陈建斌','King':'雍正'},\
# {'name':'聂远','King':'乾隆'}])

# myset.save({'_id':1,'name':'郑少秋','King':'乾隆'})

#查找操作

#获取游标对象
cursor = myset.find({'name':{'$exists':True}},{'_id':0})
# print(cursor)

#循环获 取每一条文档
# for i in cursor:
#     print(i['name'],'---',i['King'])

# print(cursor.next()) #获取下一个文档

# for i in cursor.skip(1).limit(3):
#     print(i)

#注意　排序写法同mongo shell不同，用元组表达
# for i in cursor.sort([('name',1)]):
#     print(i)

# dic = {'$or':[{'King':'乾隆'},{'name':'陈道明'}]}

#直接返回查找到的文档字典
# d = myset.find_one(dic)
# print(d)

#修改操作
# myset.update_one({'King':'康熙'},\
# {'$set':{'king_name':'玄烨'}},upsert=True)

# myset.update_many({'King':'乾隆'},\
# {'$set':{'king_name':'弘历'}})

#删除操作
# myset.delete_one({'King':'乾隆'})
# myset.delete_many({'king_name':{'$exists':False}})

#复合操作
print(myset.find_one_and_delete({'name':'郑少秋'}))


#关闭连接
conn.close()