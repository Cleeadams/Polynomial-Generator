% Jeff's polynomial generator
close all
clear
clc


% How many points do you want?
n = input('How many points do you want? ');

% Create points.
Px = 20*rand(n,1);
Py = 1000*rand(n,1);

% Size of your matrix.
sz = length(Px);

% Creates symbolic variables for the coefficients of the polynomial.
p = sym('c', [n 1]);

syms x
X = x*ones(sz,sz);

for i = 1:sz
    X(:,i) = Px.^(sz-i);
end
 
Eq = X*p;
S = vpasolve(Eq==Py,p);
S = reshape(struct2array(S), [], numel(S)).';

poly = 0;
for i = 1:sz
    poly = S(i)*x^(sz-i)+poly;
end

t = 0:.1:12;

y = subs(poly,x,t);

plot(t,y,'LineWidth',4,'Color','c')
grid on

