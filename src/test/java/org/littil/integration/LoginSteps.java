package org.littil.integration;

import io.cucumber.java8.En;

public class LoginSteps implements En {

    public LoginSteps() {
        And("^(?:he|she|they) can log in with email (.*?) and password (.*?)$", (String email, String password) -> {
        });
    }
}
