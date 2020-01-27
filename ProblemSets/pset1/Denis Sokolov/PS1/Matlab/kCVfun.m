function MSEAll = kCVfun(data,bw,k)
% bw - bandwith
% k - # of data bids for CV

MSE = 0;
for num = 1:k
    MSE1 = CVfun(data,bw,k,num);
    MSE = MSE + MSE1;
end
MSEAll = MSE/k;

end