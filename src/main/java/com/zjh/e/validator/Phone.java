package com.zjh.e.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

/**
 * Created by Administrator on 2017/7/15.
 * 自定义手机号码验证
 */
@Constraint(validatedBy = PhoneImpl.class)
@Target( { java.lang.annotation.ElementType.METHOD,
        java.lang.annotation.ElementType.FIELD })
@Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@Documented
public @interface Phone {
    String message() default "{user.phone}"; //提示信息,可以写死,可以填写国际化的key

//    String phoneNumber() default "";

    //下面这两个属性必须添加
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
