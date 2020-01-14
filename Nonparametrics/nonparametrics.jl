using Plots

X = collect(range(0,stop=4*pi, length=200));
Y = sin.(X) + 0.3*randn(200,1)
plot(X,Y,seriestype=:scatter)
