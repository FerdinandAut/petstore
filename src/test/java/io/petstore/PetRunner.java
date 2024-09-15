package io.petstore;

import com.intuit.karate.junit5.Karate;

public class PetRunner {
    @Karate.Test
    Karate testUser(){
        return Karate.run("src/test/resources/features/pets.feature");    }
}