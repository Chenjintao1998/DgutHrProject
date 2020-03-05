package com.dgut.utils;

import java.util.Random;

public class RandomNumberUtil {
    public static String getCode(int length){
        Random random = new Random();
        String code = "";
        for(int i = 0; i < length;i++){
            code += random.nextInt(10);
        }
        return code;
    }
}
