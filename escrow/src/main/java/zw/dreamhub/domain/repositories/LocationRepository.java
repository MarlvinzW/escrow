package zw.dreamhub.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import zw.dreamhub.domain.models.Location;

@Repository
public interface LocationRepository extends JpaRepository<Location, String> {
}