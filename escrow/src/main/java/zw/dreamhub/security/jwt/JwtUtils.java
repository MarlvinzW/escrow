package zw.dreamhub.security.jwt;

import com.fasterxml.jackson.core.JsonProcessingException;
import io.jsonwebtoken.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import zw.dreamhub.config.env.AppEnv;
import zw.dreamhub.security.services.UserDetailsImpl;
import zw.dreamhub.services.Logger;

import java.time.Instant;
import java.util.Date;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 29/4/2021
 */

@Component
@RequiredArgsConstructor
public class JwtUtils {

    final Logger logger;

    final AppEnv env;

    public String generateJwtToken(Authentication authentication) {

        UserDetailsImpl userPrincipal = (UserDetailsImpl) authentication.getPrincipal();

        return Jwts.builder()
                .setSubject((userPrincipal.getUsername()))
                .setIssuedAt(new Date())
                .setExpiration(Date.from(Instant.now().plusMillis(Long.parseLong(env.getSecurity().getJwt().getJwtExpirationMs()))))
                .signWith(SignatureAlgorithm.HS512, env.getSecurity().getJwt().getSecret())
                .compact();
    }

    public String getUserNameFromJwtToken(String token) {
        return Jwts.parser().setSigningKey(env.getSecurity().getJwt().getSecret()).parseClaimsJws(token).getBody().getSubject();
    }

    public boolean validateJwtToken(String authToken) throws JsonProcessingException {
        try {
            Jwts.parser().setSigningKey(env.getSecurity().getJwt().getSecret()).parseClaimsJws(authToken);
            return true;
        } catch (MalformedJwtException e) {
            logger.payload("Invalid JWT token", e.getStackTrace());
        } catch (ExpiredJwtException e) {
            logger.payload("JWT token is expired", e.getStackTrace());
        } catch (UnsupportedJwtException e) {
            logger.payload("JWT token is unsupported", e.getStackTrace());
        } catch (IllegalArgumentException e) {
            logger.payload("JWT claims string is empty", e.getStackTrace());
        }

        return false;
    }

}
