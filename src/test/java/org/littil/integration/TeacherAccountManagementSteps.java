package org.littil.integration;

import io.cucumber.java8.En;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.littil.integration.pages.RegistrationPage;

import java.util.Set;

import static org.assertj.core.api.Assertions.*;

@Slf4j
public class TeacherAccountManagementSteps implements En {

    private UserState state;
    private final RegistrationPage page;
    WebDriverAdapter wd;

    public TeacherAccountManagementSteps(UserState scenarioState, RegistrationPage page) {
        this.state = scenarioState;
        this.page = page;

        Given("^user (.*?) is new to the platform", (String name) -> {
            assertThat(state.getCurrentUser()).isNull();
        });
        When("^(.*?) indicates (?:he|she|they) wants to register as a teacher", (String name) -> {
            assertThat(state.getCurrentUser()).isNull();
            wd.getDriver().navigate().to("http://localhost:4200");
            page.goToPage();

        });
        Then("^(?:he|she|they) (?:is|are) presented with a registration form", page::assertFormIsPresent);

        When("^(?:he|she|they) gives (?:her|his|their) first name as (.*?)$", page::enterFirstName);

        When("^(?:her|his|their) surname as (.*?)", page::enterSurname);

        When("^(?:her|his|their) email as (.*?)$", page::enterEmail);

        When("^(?:her|his|their) password (?:as|to) (.*?)$", (String pwd) -> {
            page.enterPassword(pwd);
            page.enterPasswordConfirmation(pwd);
        });

        When("^(?:her|his|their) post code (?:as|to) (\\d+)", page::enterPostcode);

        When("^(?:her|his|their) country as (.*?)$", page::enterCountry);

        And("^(?:her|his|their) profile text (?:as|to) (.*?)$", page::enterProfileText);

        And("^(?:her|his|their) available days (?:as|to) (.*?)$", (String list) -> {
            var uniqueDays = Set.of(StringUtils.split(list, ","));
            for (String weekday : uniqueDays) {
                page.selectAvailableDay(weekday);
            }
        });
        When("^indicates that (?:he|she|they) agrees? with the privacy statement", page::togglePrivacyStatement);

        When("^(?:he|she|they) confirms? the registration", page::sendRegistration);

        Then("^(?:he|she|they) receives? an email at (.*?) asking to activate (?:her|his|their) account", (String email) -> {

        });

        When("^(?:he|she|they) follows? the activation instructions in the email", () -> {

        });

        Then("^(?:her|his|their) account is activated", () -> {

        });


        // Updates (?:her|his|their) profile data
        Given("^a user with email (.*?) is known to the platform", (String email) -> {
            state.addUserByEmail(email);
        });
        When("(\\w+) logs into the system", (String user) -> {
            String currentUser = state.getCurrentUser();
        });
        And("^indicates (?:he|she|they) wants? to change (?:her|his|their) profile", () -> {

        });
        Then("^(?:he|she|they) can update (?:her|his|their) first name to (.*?) and surname to (.*?)$", (String firstName, String surname) -> {

        });

        And("^(?:he|she|they) receives? a confirmation that the changes have been made", () -> {

        });
        And("^indicates that (?:he|she|they) wants? to delete (?:her|his|their) account", () -> {

        });
        And("^confirms (?:her|his|their) decision to delete", () -> {

        });
        And("^(?:he|she|they) receives? email confirmation that the account has been deleted", () -> {
            String currentUser = state.getCurrentUser();
        });
        And("^(?:he|she|they) can no longer log in", () -> {
            String currentUser = state.getCurrentUser();
        });
        Then("^(?:her|his|their) account details (?:is|are) updated$", () -> {
        });

        And("^indicates (?:he|she|they) wants? to change (?:her|his|their) email$", () -> {
        });
        Then("^(?:he|she|they) can update (?:her|his|their) email to (.*?)$", (String email) -> {
        });
        And("^(?:he|she|they) receives? an email at (.*?) confirming the change$", (String email) -> {
        });

    }



}
