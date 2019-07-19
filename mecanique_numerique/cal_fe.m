function [dUc]=cal_fe(Uc,tc,w0c)
    k = 2464;
    A = 5;
    m = 0.1;
    a = 0.4;
    eps = 0.05;
    w0 = sqrt(w0c);
    dUc=zeros(2,1);
    dUc(1)=Uc(2);
    dUc(2)=50* cos(w0 * tc)-2*0.05*w0*dUc(1)-(w0c*Uc(1)*(1-0.4*Uc(1)*Uc(1)));
    
end