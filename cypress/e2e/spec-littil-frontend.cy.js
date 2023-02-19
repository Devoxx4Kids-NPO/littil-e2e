describe('Login', () => {

  it('User School 1 can login', () => {
    cy.visit(Cypress.env('frontend_url'))
    cy.login(Cypress.env('user_school1_username'), Cypress.env('user_school1_password'))
    
    // Uitloggen nog niet mogelijk vanwege redirect issue in frontend
    // cy.contains('button', 'Uitloggen').click()
    // cy.contains('Inloggen')
   
  })

 it('User School 2 can login', () => {
    cy.visit(Cypress.env('frontend_url'))
    cy.login(Cypress.env('user_school2_username'), Cypress.env('user_school2_password'))
  })

 it('User Docent 1 can login', () => {
    cy.visit(Cypress.env('frontend_url'))
    cy.login(Cypress.env('user_docent1_username'), Cypress.env('user_docent1_password'))
  })
  
   it('User Docent 2 can login', () => {
    cy.visit(Cypress.env('frontend_url'))
    cy.login(Cypress.env('user_docent2_username'), Cypress.env('user_docent2_password'))
  })

})