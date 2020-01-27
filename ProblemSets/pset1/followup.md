# Problem Set 1 follow-up - Auctions
## Prof. Charlie Murry


6. Plot this estimated density against the known density that generated the data.

7. Use this distribution to construct an estimate of the impact of adding an additional bidder on seller revenues. Steps:
    - Approximate the recovered distribution of values $\hat v$ using a log normal.
    - Use these estimated log normal parameters to recompute the bid function for actions with 3 and 4 bidders.
    - Simulate $M = 100$ sets of $N=100$ auction pairs (with 3 and 4 bidders), drawing $v$ from the recovered set of values $\hat v$ with replacement.
    - For each $m \in M$, compute $\theta_m$ equals the expected difference in the winning bid going from 3 to 4 bidders.
    - Report 95% confidence intervals on $\theta$
