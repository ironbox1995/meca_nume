% 非线性情况
function [dUc]=cal_fc(Uc,tc,w0c)
   dUc=zeros(2,1);
   dUc(1)=Uc(2);
   dUc(2)=-w0c*sin(Uc(1));
end

% 线性情况
% function [dUc]=cal_fc(Uc,tc,w0c)
%   dUc=zeros(2,1);
%   dUc(1)=Uc(2);
%   dUc(2)=-w0c*Uc(1);
% end