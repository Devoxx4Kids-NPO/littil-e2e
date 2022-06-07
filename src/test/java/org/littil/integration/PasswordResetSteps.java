package org.littil.integration;

import io.cucumber.java8.En;

import static org.assertj.core.api.Assertions.assertThat;

public class PasswordResetSteps implements En {

    public PasswordResetSteps() {

        When("^(\\w+) indicates (?:he|she|they) (?:has|have) forgotten (?:his|her|their) password$", (String user) -> {
        });
        Then("^(?:he|she|they) can enter (?:his|her|their) email as (.*?)$", (String email) -> {
        });
        And("^(?:he|she|they) receives? an email at (.*?) with a link to a password page$", (String email) -> {
        });
        When("^(?:he|she|they) follows the link to the password reset page$", () -> {
        });
        Then("^(?:he|she|they) can enter a new password as (.*?)$", (String password) -> {
        });

    }


}
