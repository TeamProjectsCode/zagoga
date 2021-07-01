package com.javalec.project_zagoga.security;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final PrincipalOAuth2UserService principalOAuth2UserService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
//        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/user/**", "/sessionCheck").authenticated()
                .antMatchers("/host/**").hasRole("HOST")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().permitAll()
            .and()
                .logout()
                .logoutSuccessUrl("/main")
            .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/loginNormal")
                .defaultSuccessUrl("/main")
                .failureUrl("/login")
//                �젒洹� 沅뚰븳 �뿉�윭�씤 寃쎌슦 �떎�쓬 uri濡� �씠�룞�빀�땲�떎.
            .and()
                .exceptionHandling().accessDeniedPage("/error")
            .and()
                .oauth2Login()
                .loginPage("/login")
                .defaultSuccessUrl("/main")
                .failureUrl("/login")
                .userInfoEndpoint().userService(principalOAuth2UserService);
//        http.exceptionHandling().accessDeniedPage();
    }
}
