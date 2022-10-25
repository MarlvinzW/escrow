package zw.dreamhub.services.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import zw.dreamhub.services.Logger;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 14/6/2022
 */


@Service
@Slf4j
@RequiredArgsConstructor
public class LoggerImpl implements Logger {

    final HttpServletRequest request;

    private ObjectMapper mapper() {
        return new ObjectMapper();
    }

    @Override
    public void payload(String description, Object payload) throws JsonProcessingException {
        log.info("{} : {}",
                description,
                mapper().writeValueAsString(payload));
    }

    @Override
    public void payload(Object payload) throws JsonProcessingException {
        log.info("{}",
                mapper().writeValueAsString(payload));
    }
}
