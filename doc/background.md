# End-to-End testing of the Littil platform

## Purpose and scope
The purpose of end-to-end testing (e2e) is to ensure a well-functioning system at the highest possible level of integration 
of its technical components. These are the Quarkus backend server, the Angular frontend, the database and all support services like authorization and email that are essential to the flow.

Without a minimal suite of such tests, deployment to a production or user-acceptance environment will require manual validation, even when the quality of unit- and component tests for the individual parts of the system are high.

The e2e suite should cover only a very limited set of key scenarios to validate that the parts are properly connected. It is tempting to include detailed, field-level validation for such tests, taking into account many unhappy path scenarios. However, this level of details belongs to the unit- and component test levels of the pyramid.

### Choice for [Cypress](https://cypress.io)
Cypress is a full-featured, modern test framework under active development. Its JavaScript API should be easy to learn for frontend developers and pose no difficulty for backend developers.
A factory docker image is available, which allows it to be run cleanly inside a docker-compose environment.

### Limitations 
Not even e2e tests can offer watertight certainty that the system performs as expected in production. We must expect things to break and bugs to be encountered in production from time to time. That's where the 'courage' part of Agile comes in. The shift left/shift right tendency in the industry is to move away from extensive test suites that integrate all components, and instead opt for better testing at component level (shift left) while providing better monitoring/logging in production to tackle bugs as they occur (shift right). In particular with non business critical software like littil this is preferable.

We should not aim to test every interaction with the system. Some steps in the process, particularly the registration, requires human intervention by following a link sent by email. While it is possible to simulate this using test software, the effort is likely not worth it.

### Detailed requirements

* The test suites should be runnable on a developer workstation as well as in the CI pipeline.
* With a single command, the framework must take care of:
  * building the components from source (frontend, backend)
  * Setting up a database with minimal test data, including mock accounts for each essential role (teacher, school, admin)
  * Starting up the components in a containerized environment.
  * Running the test scripts in the same container environment 
  * Provide human-readable test reports that can be posted  
* Test scripts should be readable and manageable by both frontend and backend developers and ideally be self-documenting.

### Test doubles and setup
While the idea for e2E testing is to approach the production setup as closely as possible, this is not always easy or feasible, especially because Littil uses a third-party API for authorization (Auth0) and sends emails as part of the business flow.

It is however essential that e2e tests can run fully containerized, so there are only two options: either you provide authorization/email and other servers as dockerized services of the application, or the backend has a development-mode built-in to bypass these functions. Both have benefits and drawbacks.
* __Fully functional containerized test doubles.__  Pro: The backend can be fully agnostic with regard to the environment it runs in. Configuration need only differ by another URL to connect to. Conforms better to production. Con: More complex setup, learning curve, reliance on 3rd party software.
* __Backend provides its own stubs__ In this setup the backend can be run under a non-production profile which bypasses certain services and works with hard-coded responses, e.g. a limited set of username/password combinations. Pro: easier setup for the e2e project, greater flexibility. Con: extra programming work.

Note that the frontend should at all times be as agnostic as possible. It requires only the hostname to the backend to be configurable. 
