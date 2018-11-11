package com.dahua;

import org.perf4j.StopWatch;
import org.perf4j.log4j.Log4JStopWatch;

public class Perf4jDemo {

    public static void main(String[] args) throws Exception {

        method1 ();

    }

    public static void method1() throws InterruptedException {
        StopWatch stopWatch = new Log4JStopWatch ();
        for(int i=0;i<20;i++){

            Thread.sleep ((long) (Math.random() * 1000L));
            stopWatch.lap ("线条1");
            Thread.sleep ((long)(Math.random ()*2000L));
            stopWatch.lap ("线条2");

        }
        stopWatch.stop ();
    }
}
