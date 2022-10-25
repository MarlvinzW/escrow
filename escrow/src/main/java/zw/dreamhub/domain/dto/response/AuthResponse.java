package zw.dreamhub.domain.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import zw.dreamhub.domain.models.Location;
import zw.dreamhub.domain.models.Role;
import zw.dreamhub.domain.models.User;

import java.util.Set;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 15/10/2022
 */

@Data
@AllArgsConstructor
public class AuthResponse {
    private Auth user;
    private Token token;

    @Data
    @AllArgsConstructor
    public static class Auth {
        private String firstName;
        private String username;
        private String lastName;
        private String email;
        private Location location;
        private Set<Role> roles;

        public Auth(User user) {
            this.firstName = user.getFirstName();
            this.username = user.getUsername();
            this.lastName = user.getLastName();
            this.location = user.getLocation();
            this.roles = user.getRoles();
        }
    }

    @Data
    @AllArgsConstructor
    public static class Token {
        private String access;
        private String accessTokenType;
    }
}
