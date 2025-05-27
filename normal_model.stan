
data {
  int<lower=0> N; // number of observations
  vector[N] y; // observed weights
  real<lower=0> sigma; // known standard deviation
  real mu_prior; // prior mean
  real<lower=0> sigma_prior; // prior standard deviation
}
parameters {
  real mu; // mean
}
model {
  mu ~ normal(mu_prior, sigma_prior); // prior
  y ~ normal(mu, sigma); // likelihood
}
generated quantities {
  real y_pred;
  y_pred = normal_rng(mu, sigma); // posterior predictive distribution
}

