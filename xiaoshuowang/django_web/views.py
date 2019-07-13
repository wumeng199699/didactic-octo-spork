from imp import reload
import gensim
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from gensim.similarities import SparseMatrixSimilarity
from django_web import models
import jieba
jieba.load_userdict("C:\\Users\\Administrator\\PycharmProjects\\xiaoshuowang\\venv\\userdict.txt")
import re
import jieba.analyse
import codecs,sys
import os
from textrank4zh import TextRank4Sentence
from string import punctuation
import pymysql
from gensim import corpora
if sys.getdefaultencoding() != 'utf-8':
    reload(sys)
    sys.setdefaultencoding('utf-8')
# Create your views here.
def add_write(request):
    return render(request, 'addwrite.html')

def write_action(request):
    if request.method == 'POST':
        textarea = request.POST.get('text', '')
        biaoti = request.POST.get('biaoti','')
        text_add = models.Add()
        text_add.text = textarea
        add_punc = '，。、【 】 “”：；（）《》‘’… ． {}？！⑦()、%^>℃：.”“^-——=&#@￥'
        all_punc = punctuation + add_punc
        # 停用词
        st = codecs.open(r"C:\Users\Administrator\PycharmProjects\xiaoshuowang\venv\stopwords.txt", encoding='utf-8')
        stopwords = []
        for line1 in st:
            line1 = line1.strip()
            stopwords.append(line1)
        text_add = re.sub(r'[A-Za-z0-9]|/d+', '', textarea)
        text_seg = " ".join(jieba.cut(text_add))
        # 移除空格
        textline = text_seg.split(" ")
        # 移除停用词
        final = ''
        for j in textline:
            seg = j.lower()
            if j not in stopwords:
                if len(seg) > 1:
                    final += j
        text_seg2 = "".join(jieba.cut(final))
        # 移除标点符号
        te2 = []
        for i in text_seg2:
            te2.append(i)
            if i in all_punc:
                te2.remove(i)
        text_seg3 = "".join(jieba.cut(''.join(te2)))
        #形成摘要（5句话）
        tr4s = TextRank4Sentence()
        tr4s.analyze(text=text_seg3, lower=True, source='all_filters')
        doc0 = ""
        for item in tr4s.get_key_sentences(5):
            print(item.sentence)
            doc0 += item.sentence
        doc0 = jieba.cut(doc0)
        #将提交文本分词
        data0 = ""
        for i in doc0:
            data0 += i + " "
        #获取数据库中已有数据
        conn = pymysql.Connect(
            host='rm-bp1vy9a80af682440lo.mysql.rds.aliyuncs.com',  ##mysql服务器地址
            port=3306,  ##mysql服务器端口号
            user='root',  ##用户名
            passwd='feiyuexushu1!',  ##密码
            db='feishu',  ##数据库名
            charset='utf8')
        cursor = conn.cursor()
        #提取全文摘要
        sql1 = "select 摘要 from 摘要 where id =0"
        cursor.execute(sql1)
        doc1 = cursor.fetchall()
        data01 = doc1[0][0]
        data01 = jieba.cut(data01)
        data1 = ""
        for i in data01:
            data1 += i + " "
        #提取后五章摘要
        sql2 = "select 摘要 from 摘要 where id =1"
        cursor.execute(sql2)
        doc2 = cursor.fetchall()
        data02 = doc2[0][0]
        data02 = jieba.cut(data02)
        data2 = ""
        for i in data02:
            data2 += i + " "
        # 将文本放在一个列表中
        data3 = " "
        all_doc = [data1, data2, data3]
        # 将词语提取出来放在text中
        texts = []
        for doc in all_doc:
            doc_list = [word for word in jieba.cut(doc)]
            texts.append(doc_list)
        # 词料库建立词典
        dictionary = corpora.Dictionary(texts)
        # 将要对比的文本转化为稀疏向量
        new_vec = dictionary.doc2bow(data0.split())
        # 得到新词料库
        corpus = [dictionary.doc2bow(text) for text in texts]
        # 得到tf-idf模型
        tfidf = gensim.models.TfidfModel(corpus)
        # 计算矩阵相似度
        sparse_matrix = SparseMatrixSimilarity(tfidf[corpus], num_features=len(dictionary.token2id.keys()))
        # 输出结果
        sim = sparse_matrix.get_similarities(tfidf[new_vec])
        #存进文本相似度
        similar = []
        for e, s in enumerate(sim, 1):
            print('kw 与 text%d 相似度为：%.2f' % (e, s))
            similar.append(s)
        # 后面比较，第一个文本相似度s>=0.01，第二个文本相似度>=0.5时，才能存进数据库
        if similar[0] >= 0.01:
            if similar[1] >= 0.2:
                #续写成功就写进数据库
                sql4 = "INSERT INTO xbook (xid,xbooknumber ,xbookauther,xbooktext,xintroduce,xname) VALUES (%s,%s,%s,%s,%s,%s)"
                val = ('', 2, '阿凡达', textarea, textarea, biaoti)
                cursor.execute(sql4, val)
                conn.commit()
                return HttpResponseRedirect('/success_action/')
            else:
                return HttpResponseRedirect('/fail_action/')
        else:
            return HttpResponseRedirect('/fail_action/')

def add_write1(request):
    return render(request, 'addwrite1.html')

def write_action1(request):
    if request.method == 'POST':
        textarea = request.POST.get('text', '')
        biaoti = request.POST.get('biaoti', '')
        text_add = models.Add()
        text_add.text = textarea
        add_punc = '，。、【 】 “”：；（）《》‘’… ． {}？！⑦()、%^>℃：.”“^-——=&#@￥'
        all_punc = punctuation + add_punc
        # 停用词
        st = codecs.open(r"C:\Users\Administrator\PycharmProjects\xiaoshuowang\venv\stopwords.txt", encoding='utf-8')
        stopwords = []
        for line1 in st:
            line1 = line1.strip()
            stopwords.append(line1)
        text_add = re.sub(r'[A-Za-z0-9]|/d+', '', textarea)
        text_seg = " ".join(jieba.cut(text_add))
        # 移除空格
        textline = text_seg.split(" ")
        # 移除停用词
        final = ''
        for j in textline:
            seg = j.lower()
            if j not in stopwords:
                if len(seg) > 1:
                    final += j
        text_seg2 = "".join(jieba.cut(final))
        # 移除标点符号
        te2 = []
        for i in text_seg2:
            te2.append(i)
            if i in all_punc:
                te2.remove(i)
        text_seg3 = "".join(jieba.cut(''.join(te2)))
        #形成摘要（5句话）
        tr4s = TextRank4Sentence()
        tr4s.analyze(text=text_seg3, lower=True, source='all_filters')
        doc0 = ""
        for item in tr4s.get_key_sentences(5):
            print(item.sentence)
            doc0 += item.sentence
        doc0 = jieba.cut(doc0)
        #将提交文本分词
        data0 = ""
        for i in doc0:
            data0 += i + " "
        #获取数据库中已有数据
        conn = pymysql.Connect(
            host='rm-bp1vy9a80af682440lo.mysql.rds.aliyuncs.com',  ##mysql服务器地址
            port=3306,  ##mysql服务器端口号
            user='root',  ##用户名
            passwd='feiyuexushu1!',  ##密码
            db='feishu',  ##数据库名
            charset='utf8')
        cursor = conn.cursor()
        #提取全文摘要
        sql1 = "select 摘要 from 摘要 where id =2"
        cursor.execute(sql1)
        doc1 = cursor.fetchall()
        data01 = doc1[0][0]
        data01 = jieba.cut(data01)
        data1 = ""
        for i in data01:
            data1 += i + " "
        #提取后五章摘要
        sql2 = "select 摘要 from 摘要 where id =3"
        cursor.execute(sql2)
        doc2 = cursor.fetchall()
        data02 = doc2[0][0]
        data02 = jieba.cut(data02)
        data2 = ""
        for i in data02:
            data2 += i + " "
        # 将文本放在一个列表中
        data3 = " "
        all_doc = [data1, data2, data3]
        # 将词语提取出来放在text中
        texts = []
        for doc in all_doc:
            doc_list = [word for word in jieba.cut(doc)]
            texts.append(doc_list)
        # 词料库建立词典
        dictionary = corpora.Dictionary(texts)
        # 将要对比的文本转化为稀疏向量
        new_vec = dictionary.doc2bow(data0.split())
        # 得到新词料库
        corpus = [dictionary.doc2bow(text) for text in texts]
        # 得到tf-idf模型
        tfidf = gensim.models.TfidfModel(corpus)
        # 计算矩阵相似度
        sparse_matrix = SparseMatrixSimilarity(tfidf[corpus], num_features=len(dictionary.token2id.keys()))
        # 输出结果
        sim = sparse_matrix.get_similarities(tfidf[new_vec])
        #存进文本相似度
        similar = []
        for e, s in enumerate(sim, 1):
            print('kw 与 text%d 相似度为：%.2f' % (e, s))
            similar.append(s)
        # 后面比较，第一个文本相似度s>=0.01，第二个文本相似度>=0.5时，才能存进数据库
        if similar[0] >= 0.01:
            if similar[1] >= 0.2:
                #续写成功就写进数据库
                sql4 = "INSERT INTO xbook (xid,xbooknumber ,xbookauther,xbooktext,xintroduce,xname) VALUES (%s,%s,%s,%s,%s,%s)"
                val = ('', 5, '阿凡达', textarea, textarea, biaoti)
                cursor.execute(sql4, val)
                conn.commit()
                return HttpResponseRedirect('/success_action/')
            else:
                return HttpResponseRedirect('/fail_action/')
        else:
            return HttpResponseRedirect('/fail_action/')

def success_action(request):
    result = "续写成功啦！！！"
    return render(request, 'chenggong.html', {'data': result})

def fail_action(request):
    result = "很抱歉，续写失败！！！"
    return render(request, 'shibai.html', {'data': result})