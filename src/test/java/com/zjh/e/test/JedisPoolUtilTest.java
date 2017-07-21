package com.zjh.e.test;

import com.zjh.e.utils.JedisPoolUtil;
import org.junit.Test;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * Created by Administrator on 2017/7/21.
 */
public class JedisPoolUtilTest {

    @Test
    public void test(){
        JedisPool jedisPool = JedisPoolUtil.getJedisPoolInstance();
        Jedis jedis = jedisPool.getResource();
        System.out.print(jedis.ping());
    }

}
