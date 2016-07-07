import com.dessert.dao.UserDao;
import com.dessert.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/2/16.
 */

@ContextConfiguration(locations = {"../../../web/WEB-INF/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
// defaultRollback=true不会改变数据库，false会改变数据库
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
@Transactional
public class UserDaoTest {

    @Resource
    private UserDao userDao;

    @Test
    public void testIsExist() {
        User user = new User();
        user.setUsername("ww");
        user.setPassword("qq");
        boolean result = userDao.isExist(user);
        System.out.println("test result:"+result);
    }
}
