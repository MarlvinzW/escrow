package zw.dreamhub.services;

import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 14/6/2022
 */


public interface Logger {
    void payload(String description, Object payload) throws JsonProcessingException;

    void payload(Object payload) throws JsonProcessingException;
}
