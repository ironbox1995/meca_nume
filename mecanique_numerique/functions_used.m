sqrt(9)
z = [1+1i];
real(z)
imag(z);
x = [-4:0.01:4];
y = sinh(x);
g = cosh(x);
h = tanh(x);
plot(x,y); hold on 
plot(x,g); hold on 
plot(x,h);

A\B; % Ω‚A*X=B
A/B; % Ω‚X*A=B

% newmark_implicite beta=0.25 gamma = 0.5
% newmark_explicite beta=0    gamma = 0.5
