## Empirical Methods for Applied Micro

This is a PhD level course in applied econometrics and computational economics, targeted at students conducting applied research (as opposed to econometricians), taught by Charlie Murry (and in other years, Richard Sweeney).

In addition to traditional econometric approaches, this course draws connections to recent literature on machine learning.

BC students should also checkout the [syllabus](syllabus.md). Please interact with the course by forking this repo. I will expect each student to initiate a pull-request during the semester to either correct an error in the slides/homework or just add some info to a slide. 

There are many great resources for getting started with git/Github. Here is a very incomplete list:
1. Rich Sweeney's RA tips. https://github.com/rlsweeney/Sweeney_RA_Manual/wiki/Git-tips-and-tricks
2. Intro to Programming by Clément Mazet-Sonilhac @ Sciences Po https://github.com/CMS27/IP2019/blob/master/Lectures/IP_Git_S46.pdf
3. A more general research best practices is Matt Gentzkow and Jesse Shapiro's RA Guide, https://www.brown.edu/Research/Shapiro/pdfs/CodeAndData.pdf. There are more resources on Jesse's website. 
4. One of many git cheatsheets: https://education.github.com/git-cheat-sheet-education.pdf

Much of the material was (gratefully) forked from Chris Conlon's [micro-metrics](https://github.com/chrisconlon/micro-metrics) repo and other material is based of a PhD course Charlie used to co-teach with Paul Grieco and Mark Roberts at Penn State. 

The course is based on some combination of 
- [Microeconometrics by Cameron and Trivedi](https://www.amazon.com/Microeconometrics-Methods-Applications-Colin-Cameron/dp/0521848059)
- [Elements of Statistical Learning by Hastie, Tibshirani, and Friedman](https://statweb.stanford.edu/~tibs/ElemStatLearn/)
- Other lectures borrowed/stolen from various sources
	- Bruce Hansen's [online text](https://www.ssc.wisc.edu/~bhansen/econometrics/)
- [Numerical Methods in Economics](https://www.amazon.com/Numerical-Methods-Economics-MIT-Press/dp/0262100711/)
	
The goal is to provide an overview of a number of topics in Microeconometrics including:

1. Nonparametrics and Identification
	- Density estimatation, k-NN, Kernels, Nadaraya-Watson
	- Bootstrap and Cross Validation
2. Model Selection and Penalized Regression
	- Ridge, Lasso, LAR, BIC, AIC
3. Treatment Effects and Selection
	- Potential Outcomes, LATE, Diff in Diff, RDD, MTE
4. Binary Discrete Choice (including endogeneity)
	- MLE, Special Regressors, Control Functions
5. Computational 
	- Root finding, Optimization
	- Differentiation, Integration
6. Multinomial Discrete Choice
	- Logit, Nested Logit, Mixed Logit
7. Bayesian Methods
	- Gibbs Sampling
	- Data augmentation
	- Metropolis-Hastings
8. Partial Identificaton (if time permits)

Repo material likely not covered: 
- Duration Models
