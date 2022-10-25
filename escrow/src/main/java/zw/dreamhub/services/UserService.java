package zw.dreamhub.services;

import org.springframework.http.ResponseEntity;
import zw.dreamhub.domain.dto.payload.LoginDto;
import zw.dreamhub.domain.dto.payload.UserDto;
import zw.dreamhub.domain.dto.response.ApiResponse;
import zw.dreamhub.domain.models.User;

import java.util.Optional;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 23/10/2022
 */

public interface UserService {
    Optional<User> findByUsername(String username);

    ResponseEntity<ApiResponse> login(LoginDto dto);

    ResponseEntity<ApiResponse> registerUser(UserDto dto);
}
