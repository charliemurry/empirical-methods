# Quadrature Examples


using Plots


function trapInt(f::Function, a::Real, b::Real, n::Int)

    intEval(f,l,r) = (1/2) * (f(l) + f(r)) * (r-l)

    xs = a .+ (0:n) * (b-a)/n
    as = [intEval(f, l, r) for (l,r) in zip(xs[1:end-1], xs[2:end])]
    sum(as)

end

function simpsonInt(f::Function, a::Real, b::Real, n::Int)

    intEval(f,l,r) = (1/6) * (f(l) + 4*(f((l+r)/2)) + f(r)) * (r-l)

    xs = a .+ (0:n) * (b-a)/n
    as = [intEval(f, l, r) for (l,r) in zip(xs[1:end-1], xs[2:end])]
    sum(as)

end

# Simple function
f(x) = x^2

plot(f,0,1)


trapInt(f,0,0.1,1)
trapInt(f,0,0.5,1)
trapInt(f,0,1,1)
trapInt(f,0,2,1)


simpsonInt(f,0,1,1)

# What is the truth?
F(x) = (1/3)*x^3


F(1) - F(0)
trapInt(f,0,1,1)
simpsonInt(f,0,1,1)

# Trap is pretty terrible with one nodes, what about 5?
trapInt(f,0,1,5)
simpsonInt(f,0,1,5)


# Noe what about higher order polynomials?
g(x) = x^4
G(x) = (1/5)*x^4

G(1) - G(0)
trapInt(g,0,1,1)
simpsonInt(g,0,1,1)

trapInt(g,0,1,5)
simpsonInt(g,0,1,5)



h(x) = 10x^7 + 5x^4 + (1/4)x^3 + 6
H(x) = (5/4)x^8 + x^5 + (1/16)x^4 +6x

H(1) - H(0)  # Truth 

trapInt(h,0,1,5)
simpsonInt(h,0,1,5)


# But with Gaussian quadrature we should be able to do this exactly
using FastGaussQuadrature, QuadGK
using LinearAlgebra

x, w = gauss(4,0,1)
dot(w, h.(x))


x, w = gauss(10,0,1)
dot(w, h.(x))

# The extra precision doesn't get us anything because with GQ we 
# are already exact at P_{2n-1} for n nodes.

# But the function quadgk (from the QuadGK package) will worry about the function evaluation and precision for us!!

quadgk(h,0,1)

quadgk(exp,0,1)
quadgk(sin,0,1)
quadgk(cos,0,1)

# Also, I think quadgk automatically uses refinement to GQ called Kronrod points, which 
# essentially smartly uses nodes times for 


# What if we have a different "Weight" function? This will typically be the case 
# because the typical empirical example involves taking an expected value of a 
# function of a random variable.



