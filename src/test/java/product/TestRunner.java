package product;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:product/").relativeTo(getClass());
    }

}
