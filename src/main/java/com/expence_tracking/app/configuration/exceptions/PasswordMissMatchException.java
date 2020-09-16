package com.expence_tracking.app.configuration.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class PasswordMissMatchException extends Throwable
{

    public PasswordMissMatchException(String message)
    {
        super(message);
    }
}