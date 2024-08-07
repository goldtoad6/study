package com.bage.study.es;

import com.bage.study.es.crud.AdvancedEsService;
import com.bage.study.es.crud.DefaultEsService;
import com.bage.study.es.crud.EsCrudService;
import com.bage.study.es.model.Person;
import org.junit.Test;

import java.io.IOException;
import java.util.Date;
import java.util.List;

public class AdvancedEsServiceTest {

    private static AdvancedEsService esService = new AdvancedEsService();

    @Test
    public void withJson() {
        // CRUD
        String json =
                "{'@timestamp': '2022-04-08T13:55:32Z', 'level': 'warn', 'message': 'Some log message'}"
                        .replace('\'', '"');

        String insert = esService.withJson(json);
        System.out.println(insert);
    }

    @Test
    public void bulkMultiDocuments() {
        esService.bulkMultiDocuments();
    }

}
