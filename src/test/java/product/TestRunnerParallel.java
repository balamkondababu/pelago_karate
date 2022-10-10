package product;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class TestRunnerParallel {

    @Test
    void testFeaturesInParallel() {
    Results results = Runner.path("classpath:product/")
    .parallel(5);
    assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
