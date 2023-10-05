package firzap.restful.service;

import firzap.restful.entity.User;
import firzap.restful.model.LoginUserRequest;
import firzap.restful.model.TokenResponse;
import firzap.restful.repository.UserRepository;
import firzap.restful.security.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.UUID;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ValidationService validationService;

    @Transactional
    public TokenResponse login(LoginUserRequest request){
        validationService.validate(request);

        //cari ke db ada atau tidak
        User user = userRepository.findById(request.getUsername())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Username or password is wrong"));

        //cek apakah password yg dimasukkan sama dgn yg di db
        if (BCrypt.checkpw(request.getPassword(), user.getPassword())){
            //password match = success
            //bikin token
            user.setToken(UUID.randomUUID().toString());
            user.setTokenExpiredAt(next30Days());

            //save to db
            userRepository.save(user);

            //return response
            return TokenResponse.builder()
                    .token(user.getToken())
                    .expiredAt(user.getTokenExpiredAt())
                    .build();
        } else {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Username or password is wrong");
        }
    }

    //method 30 hari
    private Long next30Days(){
        return System.currentTimeMillis() + (1000 * 16 * 24 * 30);
    }

    @Transactional
    public void logout(User user){
        user.setToken(null);
        user.setTokenExpiredAt(null);

        userRepository.save(user);
    }
}
