package zw.dreamhub.config.env;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 9/6/2022
 */

@ConfigurationProperties(prefix = "app")
@Component
@Data
public class AppEnv {
    private Application application;
    private Security security;
    private Url url;

    @Data
    public static class Url {
        private String unSecured;
        private String secured;
    }

    @Data
    public static class Security {
        private Password password;
        private Jwt jwt;
        @Data
        public static class Password {
            private String salt;
            private String saltChars;
        }
        @Data
        public static class Jwt {
            private String secret;
            private String jwtExpirationMs;
            private String jwtRefreshExpirationMs;
        }
    }

    @Data
    public static class Application {
        private String defaultAppName;
        private Roles roles;
        @Data
        public static class Roles {
            private String user;
        }
    }

}
