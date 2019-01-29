from pymongo import  MongoClient
import bson.binary 

conn = MongoClient('localhost',27017)
db = conn.image
myset = db.boy

###########保存图片##############
# #读取图片
# with open('./timg.jpg','rb') as f:
#     data = f.read()

# #转换mongo格式
# content = bson.binary.Binary(data)

# #将内容插入集合
# doc = {'filaname':'timg.jpg','data':content}
# myset.insert_one(doc)

##################获取图片#######################
img = myset.find_one({'filaname':'timg.jpg'})

#写入本地
with open('boy.jpg','wb') as f:
    f.write(img['data'])


conn.close()

