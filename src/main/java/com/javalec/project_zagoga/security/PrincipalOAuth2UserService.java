package com.javalec.project_zagoga.security;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.UsersMapper;
import lombok.AllArgsConstructor;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class PrincipalOAuth2UserService extends DefaultOAuth2UserService {

    private final UsersMapper usersMapper;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        String provider = userRequest.getClientRegistration().getClientName();
        String providerID = "";

//        Google 계정
        if ("Google".equals(provider)) {
            providerID = provider+"_"+oAuth2User.getAttribute("sub");
        }

        Users user = usersMapper.loadUserBySNS(providerID);
        if (user == null) {
            user = new Users(oAuth2User.getAttribute("email"));
            usersMapper.insertUser(user);
            System.out.println(user.toString());
            usersMapper.insertBySNS(providerID, user);
        }
        System.out.println(user.toString());

        user.setU_role("USER");

        return new PrincipalUser(user, oAuth2User.getAttributes());
    }
//
//    public Users loadUserFromGoogle(OAuth2User oAuth2User) {
//        String provider = "google";
//        String providerID = provider+"_"+oAuth2User.getAttribute("sub");
//        Users user = usersMapper.loadUserBySNS(providerID);
//        if (user == null) {
//            user = new Users(oAuth2User.getAttribute("email"));
//            usersMapper.insertUser(user);
//            System.out.println(user.toString());
//            usersMapper.insertBySNS(providerID, user);
//        }
//        System.out.println(user.toString());
//        return user;
//    }
}
