# Problem Set 1 - Estimating Auctions
#### Prof. Charlie Murry
#### PhD Empirical Methods

<br>

In the Nonparametrics lecture, we discussed a prominent application of nonparametric density estimation: auctions. In these problems, we are typically interested in recovering the distribution of values for some object given we observe the distribution of bids. Once we have valuations, we can project onto covariates of interest, or simulate an alternative mechanism.

Guerre, Perrigne and Voung (ECMA 2000) show that the distibution of (unobserved) bidder values can be recovered nonparametrically if we know how the auction works and can estimate the pdf and cdf of bids.

I simulated bids from a First Price Sealed Bid (FPSB) auction with three bidders. The bid data is in bids1.csv.

1. Estimate the density of bids using
    - an assumed normal distribution,
    - a Gaussian kernel,
    - an Epanechnikov kernel.

For the kernels, use a plug-in estimate for the optimal bandwidth.


2. Use a least-squares cross-validation to pick the bandwidth for the Epanechnikov kernel.

3. Plot the estimated density functions (you should have four), overlaid on top of a histogram of the bids. Which one appears to fit best?

4. Use GPV and the cross-validated Epanechnikov kernel to recover the valuation implied for each bid, $\hat v = b + \frac{\hat G_B (b)}{(n-1)\hat g_B(b)},$ where $n=3$ is the number of bidders.

5. Finally, estimate the distribution of $v$ using another Epanechnikov kernel (you can just use the plug-in bandwidth).

6. Guess what distribution the valuations were generated with. What are the estimated location and scale parameters (no need to provide standard errors, I just want a heuristic guess).
