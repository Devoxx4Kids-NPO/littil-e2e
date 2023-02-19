
Cypress.Commands.add('login', (username, password) => {

    cy.contains('Inloggen').click()

    cy.origin(Cypress.env('auth0_tenant'), { args: { username, password} }, ({ username, password}) => {
      cy.get('input#username').type(username)
      cy.get('input#password').type(password)
      cy.contains('button[value=default]', 'Doorgaan').click()
    })

    // Ensure Auth0 has redirected us back to the RWA.
    // TODO cy.url().should('equal', 'http://localhost:3000/')

    cy.contains('button', 'Uitloggen')
    cy.contains(username)

})
