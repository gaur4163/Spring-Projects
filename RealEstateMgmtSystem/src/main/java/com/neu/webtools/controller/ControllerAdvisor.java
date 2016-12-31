package com.neu.webtools.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
public class ControllerAdvisor {
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(Exception.class)
    public String handleBadRequest(Exception exception) {
        return "errorPage";
    }
}
