function[dUc]=cal_fu(Uc,tc,w0c)
dUc=zeros(2,1);
dUc(1)=Uc(1)*(2/3-4/3*Uc(2));
dUc(2)=-Uc(2)*(1-Uc(1));
end