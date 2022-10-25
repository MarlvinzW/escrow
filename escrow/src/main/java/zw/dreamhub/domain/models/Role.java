package zw.dreamhub.domain.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import zw.dreamhub.domain.utils.UserRole;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 23/10/2022
 */


@Entity
@Getter
@Setter
@NoArgsConstructor
public class Role extends  BaseEntity {
    @Column(name = "user_role")
    private UserRole userRole;

    public Role(UserRole role){
        this.userRole = role;
    }

}
