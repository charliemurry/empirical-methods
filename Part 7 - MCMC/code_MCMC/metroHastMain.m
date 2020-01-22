% This program generates the posterior distribution for a parameter vector
% theta supplied by the function fun3.m. All parameters are drawn at once 
% each time it samples from the proposal distribution.

clear all;

%   construct a data set of 500 draws from a N(2,4) distribution or load
%   an existing data set

% mu_a  = 2 ;
% var_a = 4 ;
% cases = 500;   
% data_n24 = mvnrnd(mu_a,var_a,cases);
% save data_n24;
% f_out = log(mvnpdf(data_n24,mu_a,var_a));

global data;
load data_n24;
data = data_n24;

%  set means and variances of the prior distribution

prsig      = zeros(2,2);
prsig(1,1) = 500;
prsig(2,2) = 500;
prmu       = zeros(1,2);
prmu(1)    = 10;
prmu(2)    = 2;
% Choose standard deviations for innovations in proposed theta

promu       = zeros(2,1);
prosig      = 0.1*eye(2);

% Choose initial values for the theta chain

theta0 = 5*ones(1,2);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Construct the Markov chain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(1,'HANDWRITEN MH TEST\n');
tic;
T          = 20000;            % total length of the chain
theta      = zeros(T,2);
theta(1,:) = theta0;
curr_pi    = logLike(theta0) + log(mvnpdf(theta0,prmu,prsig));

iaccept    = 0;               % counter for number of acceptances
t = 2;
while t <= T  
   innov = promu' + normrnd([0 0], [1 1])*prosig;
   propose   = theta(t-1,:) + innov;    
   propose(2)= abs(propose(2));
   lik       = logLike(propose) ;                 % log-likelihood at proposed theta
   prior     = log(mvnpdf(propose,prmu,prsig)) ; % log of prior at proposed theta 
   prop_pi   = lik + prior;
   delta     = prop_pi - curr_pi ;   %Log-ratio of proposal to current

   accprob = min(0,delta);                       % log of the acceptance probability
   u = unifrnd(0,1);
   u = log(u);
   if u < accprob
       iaccept = iaccept + 1;
       theta(t,:) = propose;
       curr_pi = prop_pi;
   else theta(t,:) = theta(t-1,:);
   end
   
   t = t+1;
end

save theta ;

%B is burn in period/
B=500;
mtheta = mean(theta(B:end, :))
vtheta = var(theta(B:end, :))
acc_rate = iaccept./T

figure(1)
plot(theta(1:1000,1))
title('Time Series Plot of First Thousand Draws of mu');

outfile=fopen('metroHastMain.out','w');
format('compact');
fprintf(outfile,'\n');
fprintf(outfile,'SUMMARY STATISTICS\n');
fprintf(outfile,'---------------------------------------------------------\n\n');
fprintf(outfile,'  Mean of posterior mu distribution:            %f\n',mtheta(1));
fprintf(outfile,'  Mean of posterior sigma distribution:         %f\n',mtheta(2));
fprintf(outfile,'  Variance of posterior mu distribution:        %f\n',vtheta(1));
fprintf(outfile,'  Variance of posterior sigma distribution:     %f\n',vtheta(2));
fprintf(outfile,'  Acceptance rate:                              %f\n',acc_rate);
toc;
%%
fprintf(1,'MATLAB SUPPLIED mhsample TEST\n');
tic;
start = [1 1];

%Anonymous function for the log posterior...
l_post = @(th) logLike(th) + log(mvnpdf(th, prmu, prsig));

%Don't need this since it is symmetric...cancels out...
%l_proppdf = @(x,y) log(mvnpdf((x-y), promu', prosig));

%Method for generating proposals...
proprnd = @(x) x + promu' + normrnd([0 0], [1 1])*prosig;
%Equivalent: Notice that normrnd uses stddev and mvnrnd uses variance!
%proprnd = @(x) x + mvnrnd(promu', prosig*prosig');

nsamples = 20000;
[t_samp, acc] = mhsample(start, nsamples, 'logpdf', l_post, 'proprnd', proprnd, 'symmetric', 1);
m_theta = mean(t_samp(B:end, :))
v_theta = var(t_samp(B:end, :))
acc
toc;

    
