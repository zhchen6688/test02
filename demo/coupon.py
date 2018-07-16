import hashlib
import hmac
import base64

def hash_demo():
    m = hashlib.md5()
    # m.update(b"hello")
    # m.update(b"world!")  # = hello + world!
    m.update(b'python isinteresting')
    hash_hex = hashlib.sha3_512(b"python isinteresting").hexdigest()
    print(m.digest_size)
    print(m.digest())     # 二进制hash
    print(m.hexdigest())  # 十六进制hash
    print(hash_hex)       # SHA 512哈希加密算法

    '''
    密码加盐。
    盐是一个添加到用户的密码哈希过程中的一段随机序列。这个机制能够防止通过预先计算结果的彩虹表破解。
    每个用户都有自己的盐，这样的结果就是即使用户的密码相同，通过加盐后哈希值也将不同。
    为了校验密码是否正确，我们需要储存盐值。通常和密码哈希值一起存放在账户数据库中，或者直接存为哈希字符串的一部分。
    '''
    # 加盐加密
    hash_bytes = hashlib.pbkdf2_hmac('sha256', b'python isinteresting', b'80', 100000)
    print(hash_bytes)

def hash_func():
    # hashlib.new(name[, data])  // 创建hashlib(非首选), name=算法名, data:数据
    # hash = hashlib.new('ripemd160', b'python isinteresting')
    hash = hashlib.new('sha1', b'595f23df1512041814')
    print(hash.hexdigest())


    # 常量
    dics = hashlib.algorithms_guaranteed  # 所有平台支持的hash算法的名称
    dics = hashlib.algorithms_available  # 在Python解析器中可用的hash算法的名称, 传递给new()时, 可识别

    # hashlib.pbkdf2_hmac(hash_name, password, salt, iterations, dklen=None) // 加盐加密 hash_name:hash名称, password:数据, salt:盐, iterations:循环次数, dklen:密钥长度
    hash_bytes = hashlib.pbkdf2_hmac('sha256', b'python isinteresting', b'80', 100000)

    # hash对象
    num = hash.digest_size  # hash结果的大小
    num = hash.block_size  # hash算法的内部块的大小
    strs = hash.name  # hash名称, 可传给new()使用
    hash.update(b"data")  # 字节缓冲区 hash.update(a) hash.update(b) == hash.update(a+b)
    hash_bytes = hash.digest()  # 字节hash
    hash_str = hash.hexdigest()  # 16进制字符串hash
    hash = hash.copy()  # 拷贝hash对象副本


# HMAC算法 与hashlib不同之处在于多了key

def hmac_demo():
    # 加密
    h = hmac.new(b"595f23df")
    h.update(b"1512041814")
    h_str = h.hexdigest()
    print(h_str)
    print(hmac.new(b'595f23df', b'1512041814').hexdigest())
    print(hmac.new(bytes('595f23df','utf-8'), bytes('1512041814', 'utf-8')).hexdigest())
    print(hmac.new(b'595f23df', b'1512041814',hashlib.sha1).hexdigest())

    # 比较密码
    boolean = hmac.compare_digest(h_str, hmac.new(b"net", b"luzhuo.me").hexdigest())
    print(boolean)

def hmac_demo2():
    # 加密
    # h = hmac.new(b"595f23df")
    # h.update(b"1512041814")
    # h_str = h.hexdigest()
    # print(h_str)

    m = hashlib.md5()
    m.update(b'595f23df1512041814')
    mymd5 = m.hexdigest()
    print(mymd5)

    # print(hmac.new(b'595f23df', b'1512041814').hexdigest())
    # print(hmac.new(bytes('595f23df','utf-8'), bytes('1512041814', 'utf-8')).hexdigest())
    print(hmac.new(bytes(mymd5,'utf-8'), b'd9f4aa7ea6d94faca62cd88a28fd5234',hashlib.sha1).hexdigest())

    # 比较密码
    # boolean = hmac.compare_digest(h_str, hmac.new(b"net", b"luzhuo.me").hexdigest())
    # print(boolean)

def hmac_func():
    # 创建key和内容,再都进行加密
    # hmac.new(key, msg=None, digestmod=None) // 创建新的hmac对象, key:键, msg:update(msg), digestmod:hash名称(同hashlib.new())(默认md5)
    hc = hmac.new(b"key")

    # hmac对象
    hc.update(b"msg")          # 字节缓冲区  hc.update(a) hc.update(b) == hc.update(a+b)
    hash_bytes = hc.digest()   # 字节hash
    hash_str = hc.hexdigest()  # 16进制hash字符串
    hc = hc.copy()        # 拷贝hmac副本
    num = hc.digest_size  # hash大小
    num = hc.block_size   # hash算法内部块大小
    strs = hc.name  # hash名称
    # hmac.compare_digest(a, b) // 比较两个hash密钥是否相同, 参数可为: str / bytes-like object, (注:建议使用,不建议使用a==b)
    boolean = hmac.compare_digest(hmac.new(b"net", b"luzhuo.me").digest(), hmac.new(b"net", b"luzhuo.me").digest())

if __name__ == "__main__":
    # hash_demo()
    # hash_func()
    hmac_demo2()
    # hmac_func()
