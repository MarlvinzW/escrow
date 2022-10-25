package zw.dreamhub.domain.dto.payload;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 15/10/2022
 */

@Data
public class LoginDto {
 @NotNull
 @NotBlank
 private String username;
 @NotNull
 @NotBlank
 @Size(min = 5)
 private String password;
}
