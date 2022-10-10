function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: 'dev',
    baseUrl: 'https://traveller-core.dev.pelago.co/graphql'
  }
  if (env === 'dev') {
    config.baseUrl = 'https://traveller-core.dev.pelago.co/graphql';
  } else if (env === 'qa') {
    config.baseUrl = 'https://traveller-core.qa.pelago.co/graphql';
  }
  return config;
}