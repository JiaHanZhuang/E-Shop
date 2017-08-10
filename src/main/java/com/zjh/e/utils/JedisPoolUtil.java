package com.zjh.e.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by Administrator on 2017/7/21.
 */
public class JedisPoolUtil {

    private static volatile JedisPool jedisPool;

    private JedisPoolUtil(){}

    public static JedisPool getJedisPoolInstance(){
        if(jedisPool==null) {
            synchronized (JedisPool.class) {
                if(jedisPool==null) {
                    JedisPoolConfig poolConfig = new JedisPoolConfig();
                    poolConfig.setMaxTotal(1000);
                    poolConfig.setMaxIdle(32);
                    poolConfig.setMaxWaitMillis(100*1000);
                    poolConfig.setTestOnBorrow(true);
                    jedisPool = new JedisPool(poolConfig,"127.0.0.1",6379,10000,"123456");
                }
            }
        }
        return jedisPool;
    }

    public static void release(JedisPool jedisPool, Jedis jedis) {
        if(jedis!=null) {
            jedisPool.close();
        }
    }

}
