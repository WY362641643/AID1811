# mynumber.py

import math  # 系统内建的模块

import numpy  # 第三方模块

import mymod  # 自己的模块
# import os, sys
import os
import sys


class MyNumber:
    def __init__(self, value):
        self.data = value

    def __repr__(self):
        return 'MyNumber(%d)' % self.data

    def __add__(self, other):
        s = self.data + other.data
        return MyNumber(s)  # 创建一个新的对象并返回


n1 = MyNumber(100)
n2 = MyNumber(200)

# n3 = n1.__add__(n2)
n3 = n1 + n2  # 等同于 n3 = n1.__add__(n2)
print(n1, '+', n2, '=', n3)

a = 1 + 2
bb = 100
ccc = 300


def fx(a=0, b=1, c=100):
    pass


fx(1, b=100, c=200)

# a = 1 + 2;bb = 100;ccc = 300  # 不推荐
