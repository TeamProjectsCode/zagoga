package com.javalec.project_zagoga.security;

import com.javalec.project_zagoga.vo.UsersVO;
import com.javalec.project_zagoga.mapper.UsersMapper;
import com.javalec.project_zagoga.security.provider.GoogleUserInfo;
import com.javalec.project_zagoga.security.provider.KakaoUserInfo;
import com.javalec.project_zagoga.security.provider.NaverUserInfo;
import com.javalec.project_zagoga.security.provider.OAuth2Info;
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
        String registrationID = userRequest.getClientRegistration().getRegistrationId();
        OAuth2User oAuth2User = super.loadUser(userRequest);

        OAuth2Info oAuth2Info = null;
        switch(registrationID) {
            case "google":
                oAuth2Info = new GoogleUserInfo(oAuth2User.getAttributes());
                break;
            case "naver":
                oAuth2Info = new NaverUserInfo(oAuth2User.getAttributes());
                break;
            case "kakao":
                oAuth2Info = new KakaoUserInfo(oAuth2User.getAttributes());
                break;
        }

        String snsID = oAuth2Info.getProvider()+"_"+oAuth2Info.getProviderID();
//        System.out.println("snsID: "+snsID);
        UsersVO userInfo = usersMapper.loadUserBySNS(snsID);

        if (userInfo == null) {
            userInfo = new UsersVO(oAuth2Info.getNickName(), oAuth2Info.getEmail());
            usersMapper.insertEmptyUser(userInfo);
            usersMapper.insertBySNS(snsID, userInfo);
        }

        AuthValue authValue = new AuthValue();
        authValue.setUsername(oAuth2Info.getEmail());
        authValue.setRole("USER");
        userInfo.setAuthValue(authValue);

        return new PrincipalUser(userInfo, oAuth2User.getAttributes());
    }
}
