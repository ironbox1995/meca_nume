%Ô­·½³Ì£ºx''+(x^2-1)*x'+x=0
function dx=vdp1(t,x)
dx(1)=x(2);
dx(2)=exp(-1*t)+sin(2*t)-2*x(2)-5*x(1);
dx=dx';
end