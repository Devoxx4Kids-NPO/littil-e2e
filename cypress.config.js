module.exports = {
  e2e: {
    env : {
       "frontend_url" : "http://localhost:80",
       auth0_tenant: process.env.OIDC_TENANT,
       user1_username: process.env.USER1_USERNAME,
       user1_password: process.env.USER1_PASSWORD
    },
    experimentalStudio: true,
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
};
