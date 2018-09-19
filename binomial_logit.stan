// logit parameterized binomial model
data { 
  int N;                  //number of data pairs (n,y)
  int<lower=1> n[N];      //number of trials in pair i
  int<lower=0> y[N];      //number of successes in pair i
  real x[N];              //time scale
} 
parameters {
  real beta0;             //intercept
  real beta1;             //slope
} 
model {
  beta0  ~ normal(0,100); //priors for slope and intercept
  beta1  ~ normal(0,50);
  
  for (i in 1:N){
    y[i] ~ binomial_logit(n[i],beta0+beta1*x[i]); //binomial logit likelihood
  }
}
