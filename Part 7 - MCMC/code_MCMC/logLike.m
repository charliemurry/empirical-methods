%This function computes the log-likelihood of the data for theta=propose
% for use with main_MCMC2.m
function f_out = logLike(propose)
%load data_n24;
%data = data_n24;
global data;
mu_a  = propose(1);
sig_a = propose(2);
ff = log(normpdf(data,mu_a,sig_a));
f_out = sum(ff);
end