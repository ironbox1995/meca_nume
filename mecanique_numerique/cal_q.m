function [dUc]=cal_q(Uc,tc)
   dUc=zeros(2,1);
   dUc(1)=Uc(2);
   dUc(2)=sinh(tc)*sqrt(Uc(1)-1);
end