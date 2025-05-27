
data {
  int<lower=0> N; // number of observations
  array[N] int<lower=0> y; // observed counts
  real<lower=0.1> alpha; // prior hyperparameter
  real<lower=0.1> beta; // prior hyperparameter
}
parameters {
  real<lower=0> lambda; // Poisson rate parameter
}
model {
  lambda ~ gamma(alpha, beta); // prior
  y ~ poisson(lambda); // likelihood
}
generated quantities {
  int y_pred;
  y_pred = poisson_rng(lambda); // posterior predictive distribution
}

