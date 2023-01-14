describe('Login', () => {
  it('Login LITTIL website : littil-frontend', () => {
    cy.visit(Cypress.env('frontend_url'))

    cy.contains('Inloggen').click()

cy.log(Cypress.env('auth0_tenant'))

    cy.origin('https://dev-g60bne29.eu.auth0.com', () => {
      cy.get('input#username').type('TODO')
      cy.get('input#password').type('TODO')
      cy.contains('button[value=default]', 'Doorgaan').click()
    })
    // cy.contains(Cypress.env('user1_username'))
    // cy.contains('button', 'Uitloggen')
    //.click()
  })
})