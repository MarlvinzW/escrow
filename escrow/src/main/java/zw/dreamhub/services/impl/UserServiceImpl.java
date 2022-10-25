package zw.dreamhub.services.impl;

import lombok.RequiredArgsConstructor;
import org.mapstruct.factory.Mappers;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import zw.dreamhub.domain.dto.payload.LoginDto;
import zw.dreamhub.domain.dto.payload.UserDto;
import zw.dreamhub.domain.dto.response.ApiResponse;
import zw.dreamhub.domain.dto.response.AuthResponse;
import zw.dreamhub.domain.mappers.UserMapper;
import zw.dreamhub.domain.models.Role;
import zw.dreamhub.domain.models.User;
import zw.dreamhub.domain.repositories.LocationRepository;
import zw.dreamhub.domain.repositories.RoleRepository;
import zw.dreamhub.domain.repositories.UserRepository;
import zw.dreamhub.domain.utils.UserRole;
import zw.dreamhub.security.jwt.JwtUtils;
import zw.dreamhub.services.UserService;

import java.util.Optional;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 14/10/2022
 */

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final LocationRepository locationRepository;
    private final RoleRepository roleRepository;
    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder encoder;
    private final JwtUtils jwtUtils;

    @Override
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public ResponseEntity<ApiResponse> login(LoginDto dto) {
        // filter users
        Optional<User> user = this.findByUsername(dto.getUsername());
        // user is present
        if (user.isPresent()) {
            // password matches
            if (encoder.matches(dto.getPassword(), user.get().getPassword())) {
                Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(dto.getUsername(), dto.getPassword()));
                // success response
                return ResponseEntity.ok().body(new ApiResponse(true, new AuthResponse(
                        new AuthResponse.Auth(user.get()),
                        new AuthResponse.Token(jwtUtils.generateJwtToken(authentication), "Bearer")
                )));
            }
            // invalid password
            else {
                return ResponseEntity.badRequest().body(new ApiResponse(false, "Bad credentials"));
            }
        }
        // user not found
        else {
            return ResponseEntity.status(404).body(new ApiResponse(false, "User not found"));
        }
    }

    @Override
    public ResponseEntity<ApiResponse> registerUser(UserDto dto) {
        // filter users
        Optional<User> user = this.findByUsername(dto.getUsername());
        // user not registered
        if (user.isEmpty()) {
            // dto mapping
            UserMapper userMapper = Mappers.getMapper(UserMapper.class);
            User newUser = userMapper.userDtoToUser(dto);
            // role
            Role role = new Role(UserRole.USER);
            // persist sub entities
            locationRepository.save(newUser.getLocation());
            roleRepository.save(role);
            // set password & roles
            newUser.setPassword(encoder.encode(dto.getPassword()));
            newUser.getRoles().add(role);
            userRepository.save(newUser);
            // success response
            return ResponseEntity.ok(new ApiResponse(true, "Success"));
        }
        // user is registered
        else {
            // response
            return ResponseEntity.badRequest().body(new ApiResponse(
                    false, String.format("%s is registered already", dto.getUsername())
            ));
        }
    }


}
