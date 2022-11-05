# Littil End-to-End testing

## Purpose
The purpose of end-to-end testing is to ensure a well-functioning system at the highest possible level of integration 
of its technical components. These are the Quarkus backend server, the Angular frontend, the database and all support services like authorization and email that are essential to the flow.

Without a minimal suite of such tests, deployment to a production or user-acceptance environment will require manual validation, however high the quality of unit- and component tests for the indivual parts of the system.

### Limitations 
Not even end-to-end tests can offer watertight certainty that the system performs as expected. There is a tendency in the industry to move away from extensive test suites that integrate all components, and instead opt for better testing at component level and provide better monitoring/logging in production to tackle bugs as they occur. In particular with non business critical software like littil this is preferable. Hence, the end-to-end suite will cover only the key scenarios to validate that the parts are properly connected and nothing more. 

Some steps in the process, particularly the registration, requires human intervention by following a link sent by email. While it is possible to simulate this using test software, the effort is likely not worth it.

### Requirements

* The test suites should be runnable on a developer workstation as well as in the CI pipeline.
* With a single command, the framework must take care of:
  * building the components from source (frontend, backend)
  * Setting up a database with minimal test data, including mock accounts for each essential role (teacher, school, admin)
  * Starting up the components in a containerized environment.
  * Running the test scripts in the same container environment 
  * Provide human-readable test reports that can be posted  
* Test scripts should be readable and manageable by both frontend and backend developers and ideally be self-documenting.

### Choice for [Cypress](https://cypress.io)

