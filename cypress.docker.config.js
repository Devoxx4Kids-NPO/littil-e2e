module.exports = {
  e2e: {
    env : {
       frontend_url: "http://localhost:80",
       auth0_tenant: "TODO",
       
       user_school1_username: "e2etestschool1@littil.org",
       user_school1_password: "TODO",
       user_school2_username: "e2etestschool2@littil.org",
       user_school2_password: "TODO",

       user_docent1_username: "e2etestdocent1@littil.org",
       user_docent1_password: "TODO",
       user_docent2_username: "e2etestdocent2@littil.org",
       user_docent2_password: "TODO"
       
    },
    experimentalStudio: false,
    video: false,
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
};
