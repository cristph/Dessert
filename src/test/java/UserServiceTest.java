import com.dessert.model.User;
import com.dessert.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/2/16.
 */

@ContextConfiguration(locations = {"../../../web/WEB-INF/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceTest {
    @Resource
    private UserService userService;

    @Test
    public void test(){
        User user = new User();
        user.setUsername("ww");
        user.setPassword("qqq");
        boolean result = userService.isExist(user);
        System.out.println("service test result:"+result);
    }
}
