package com.bage.study.mockito;

import org.springframework.stereotype.Component;

@Component
public class RemoteServiceImpl implements RemoteService {

    @Override
    public String doSomething() {
        System.out.println("RemoteServiceImpl is work");
        return "RemoteServiceImpl is work";
    }
}
