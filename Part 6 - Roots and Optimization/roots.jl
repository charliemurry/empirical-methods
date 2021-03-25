# code for the roots Jupyter notebook

# Load packages
using Printf

# simple fnc
f(x) = x.^3

a = -6.0
b = 12.0

tol = 1e-4
s = sign(f(a)); # sign if the left boundary 
x = (a+b)/2; # inital midpoint
d = (b-a)/2; 
xsave=[];

while d>tol
	d=d/2; # length to cut the next interval
	push!(xsave, x)
	if s == sign(f(x))
		x = x+d;
	else
		x = x-d;
	end
end
push!(xsave,x)



g(x) = x.^0.5
x = 0.1

sol = fncIteration(g,x)


function fncIteration(g::Function,x::Float64)

    d = 100.0
    # x = 0.1

    while d>tol
    
        d = abs(x-g(x))
        x = g(x)
    
    end

    return x
end




# Demand
q(p) = -12 + 2*p.^(-3);

# 1st derivative of demand
Dq(p) = -6*p.^(-4);


function nm(f, fp, x; tol=sqrt(sqrt(eps())))
   
    ctr, max_steps = 0, 100
     
    while (abs(f(x)) > tol) && ctr < max_steps
        x = x - f(x) / fp(x)
        ctr = ctr + 1
    end

    ctr >= max_steps ? error("Method did not converge") : return (x, ctr)
    
end

sol_nm = nm(q,Dq,0.1)