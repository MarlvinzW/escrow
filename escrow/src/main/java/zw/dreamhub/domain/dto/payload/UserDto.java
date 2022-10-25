package zw.dreamhub.domain.dto.payload;

import lombok.Data;
import zw.dreamhub.domain.models.User;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


/**
 * A DTO for the {@link User} entity
 */
@Data
public class UserDto {
    @NotNull
    @NotBlank
    private String username;
    @NotNull
    @NotBlank
    private String firstName;
    @NotNull
    @NotBlank
    private String lastName;
    @NotNull
    @NotBlank
    @Size(min = 5)
    private String password;
    @NotNull
    private LocationDto location;
}