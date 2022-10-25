package zw.dreamhub.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import zw.dreamhub.domain.models.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, String> {
}