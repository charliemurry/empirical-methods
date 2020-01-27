clear all
close all

bids = csvread('bids1.csv',0,0);
histogram(bids,9,'Normalization','probability');
x = sort(bids);
p = normpdf(x,mean(bids),var(bids)^(1/2));
hold on
del = 2.6;
plot(x,p/del,'Color','g','LineStyle','-');

bw = 0.2;

pdEp = fitdist(bids,'kernel','Kernel','epanechnikov','BandWidth',bw);
pEp = pdf(pdEp,x);
plot(x,pEp/del,'Color','r','LineStyle','-.');

pdGa = fitdist(bids,'kernel','BandWidth',bw);
pGa = pdf(pdGa,x);
plot(x,pGa/del,'Color','b','LineStyle','--');

%% Cross Validation

%s = rng;
%save('randomiser.mat','s')
load('randomiser.mat');
rng(s);
bidsRand = bids(randperm(length(bids)));
k = 10; % # of bids in CV

func = @(bw) kCVfun(bidsRand,bw,k);

options = optimset('MaxFunEval', 1e6, 'MaxIter', 1e5, 'TolFun', 1e-10);
bwCV = fminsearch(func,0.05,options);

pdEpCV = fitdist(bids,'kernel','Kernel','epanechnikov','BandWidth',bwCV);
pEpCV = pdf(pdEpCV,x);
plot(x,pEpCV/del,'Color','r','LineStyle','--');

hname = {'histogram','normal' 'epanechnikov' 'gaussian' 'CV-epanechnikov'};
legend(hname);

title('Bids PDF')
xlabel('Bid')
ylabel('pdf')
%% Valuations

n = 3;
gB = pEpCV; %PDF for bids distr
GB =  cumtrapz(x,gB); %CDF for bids distr
v = x + GB./((n-1)*gB);
figure
histogram(v,15,'Normalization','probability');
hold on
pdEpV = fitdist(v,'kernel','Kernel','epanechnikov','BandWidth',1);
pEpV = pdf(pdEpV,sort(v));
plot(sort(v),pEpV,'Color','r','LineStyle','-');

y = wblpdf(sort(v),3.5,2);
plot(sort(v),y,'Color','g','LineStyle','-')

hname = {'histogram' 'epanechnikov' 'weibull'};
legend(hname);

title('Valuations PDF')
xlabel('Valuation')
ylabel('pdf')
















