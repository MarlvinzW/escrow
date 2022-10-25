package zw.dreamhub.config.health;

import org.springframework.boot.actuate.availability.AvailabilityStateHealthIndicator;
import org.springframework.boot.actuate.health.Status;
import org.springframework.boot.availability.ApplicationAvailability;
import org.springframework.boot.availability.AvailabilityState;
import org.springframework.boot.availability.ReadinessState;
import org.springframework.stereotype.Component;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 11/08/2021
 */

@Component
public class ReadinessStateHealthIndicator extends AvailabilityStateHealthIndicator {

    public ReadinessStateHealthIndicator(ApplicationAvailability availability) {
        super(availability, ReadinessState.class, statusMappings -> {
            statusMappings.add(ReadinessState.ACCEPTING_TRAFFIC, Status.UP);
            statusMappings.add(ReadinessState.REFUSING_TRAFFIC, Status.OUT_OF_SERVICE);
        });
    }

    @Override
    protected AvailabilityState getState(ApplicationAvailability applicationAvailability) {
        return applicationAvailability.getReadinessState();
    }

}

