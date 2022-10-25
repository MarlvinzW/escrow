package zw.dreamhub.security.services;

import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zw.dreamhub.domain.models.User;
import zw.dreamhub.services.UserService;

/**
 * @author Marlvin Chihota
 * Email marlvinchihota@gmail.com
 * Created on 29/4/2021
 */

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    final UserService userService;

    public UserDetailsServiceImpl(@Lazy UserService userService) {
        this.userService = userService;
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User  not found with username" + username));

        return UserDetailsImpl.build(user);
    }

}
