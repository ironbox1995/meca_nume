function dx = fun(t,x) 
K=[3 -1;-1,3];
M=[2 0;0 2];
w0c=M\K;
dx(1)=x(3);
dx(2)=x(4);
dx(3)= -(x(1)*w0c(1,1)+x(2)*w0c(1,2));
dx(4)= -(x(1)*w0c(2,1)+x(2)*w0c(2,2));
dx = dx' % dx, vecteur colonne
end