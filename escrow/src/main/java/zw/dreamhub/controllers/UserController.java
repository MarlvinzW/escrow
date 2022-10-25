package zw.dreamhub.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import zw.dreamhub.domain.dto.payload.LoginDto;
import zw.dreamhub.domain.dto.payload.UserDto;
import zw.dreamhub.domain.dto.response.ApiResponse;
import zw.dreamhub.services.UserService;

import javax.validation.Valid;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 23/10/2022
 */

@RestController
@RequestMapping(path = "${app.url.unSecured}/auth")
@Produces(MediaType.APPLICATION_JSON_VALUE)
@Consumes(MediaType.APPLICATION_JSON_VALUE)
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("login")
    ResponseEntity<ApiResponse> login(@Valid @RequestBody LoginDto dto) {
        return userService.login(dto);
    }

    @PostMapping("register")
    ResponseEntity<ApiResponse> registerUser(@Valid @RequestBody UserDto dto) {
        return userService.registerUser(dto);
    }

}
