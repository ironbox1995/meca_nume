clear all;
close all;
clc
T0=2;
dtc=0.01;
tc=(0:dtc:T0)';
npc=size(tc,1);
qc=zeros(npc,1);
dqc=zeros(npc,1);
qc(1)=1.0;
dqc(1)=0.0;
dtc1=0.02;
tc1=(0:dtc1:T0)';
npc1=size(tc1,1);
qc1=zeros(npc1,1);
dqc1=zeros(npc1,1);
qc1(1)=1.0;
dqc1(1)=0.0;
ind=1;
for ind=2:npc
    qc(ind)=qc(ind-1)+dqc(ind-1)*dtc;
    dqc(ind)=-2*(ind-1)*dtc*qc(ind)*qc(ind);
end;
qc=qc';
figure(1)
plot(tc,qc);

for ind=2:npc1
    qc1(ind)=qc1(ind-1)+dqc1(ind-1)*dtc;
    dqc1(ind)=-2*(ind-1)*dtc1*qc1(ind)*qc1(ind);
end;
qc1=qc1';
figure(2)
plot(tc1,qc1);

% plot(tc,energe)