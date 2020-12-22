function fn() {
  var env = karate.env; // get system property 'karate.env'

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
//    env: env,

  };

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';


  } else if (env == 'e2e') {
    // customize
  }

//    Testing configFile
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
  return config;
}