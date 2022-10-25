package zw.dreamhub.domain.dto.payload;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * A DTO for the {@link zw.dreamhub.domain.models.Location} entity
 */
@Data
public class LocationDto {
    @NotNull
    @NotBlank
    private  String address;
    @NotNull
    @NotBlank
    private  String city;
    @NotNull
    @NotBlank
    private  String province;
}