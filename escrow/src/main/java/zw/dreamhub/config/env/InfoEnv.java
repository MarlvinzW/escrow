package zw.dreamhub.config.env;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 14/6/2022
 */


@ConfigurationProperties(prefix = "info")
@Component
@Data
public class InfoEnv {
    private App app;
    private Contact contact;
    @Data
    public static class App {
        private String name;
        private String description;
        private double version;
        private String basePackage;
    }

    @Data
    public static class Contact {
        private String name;
        private String url;
        private String email;
    }
}
