clc
clear
close all
tmax=2000;                                       %           Number of iterations
S=30;                                            %           Number of particles
N=14;                                            %           Dimensions of the problem
K=5;                                             %           Number of closest neighbours
L=[0.3e-3*ones(7,1);1e-2*ones(7,1)];             %           Lower limit boundary
U=[10e-3*ones(7,1);10e-2*ones(7,1)];             %           Upper limit boundary
percent=0.5;                                     %           Velocity percentage of (U-L)
Pc=0.3;                                          %           CLPSO learning probability
w=0.5;                                           %           CLPSO Velocity weight
c=1;                                             %           CLPSO Position weight
n=0;                                             %           BPSO number of bits for the integer part of each number
m=10;                                            %           BPSO number of bits for the fraction part of each number
vmax=9;                                         %           BPSO maximum velocity
mr=0.04;                                          %           BPSO mutation probability
C1=0;                                          %           BPSO probability #1
C2=0.5;                                          %           BPSO probability #2
C3=0.5;                                          %           BPSO probability #3 
sum15=0;
sum25=0;
sum35=0;
sum16=0;
sum26=0;
sum36=0;
sum46=0;
sum17=0;
sum27=0;
sum37=0;

%case 3:S=20,30,50

% for i=1:20
%     [gbest15,Fbest15,t15]=cfpso(@fitness,tmax,20,N,K,L,U,percent,1);
%       if i==1
%           min1=Fbest15;
%       end
%       sum15=sum15+Fbest15;
%       if Fbest15(end)<min1(end)
%           min1=Fbest15;
%       end
% end
% Fbest15=sum15/20;
% 
% for i=1:20
%     [gbest25,Fbest25,t25]=cfpso(@fitness,tmax,30,N,K,L,U,percent,1);
%       if i==1
%           min2=Fbest25;
%       end
%       sum25=sum25+Fbest25;
%       if Fbest25(end)<min2(end)
%           min2=Fbest25;
%       end
% end
% Fbest25=sum25/20;
% 
% for i=1:20
%     [gbest35,Fbest35,t35]=cfpso(@fitness,tmax,50,N,K,L,U,percent,1);
%       if i==1
%           min3=Fbest35;
%       end
%       sum35=sum35+Fbest35;
%       if Fbest35(end)<min3(end)
%           min3=Fbest35;
%       end
% end
% Fbest35=sum35/20;
% 
% indx=min([min1(end) min2(end) min3(end)]);
% if indx==min1(end)
%     best=min1;
% elseif indx==min2(end)
%     best=min2;
% elseif indx==min3(end)
%     best=min3;
% end
% 
% plot(1:t15,Fbest15)
% hold on
% plot(1:t25,Fbest25)
% plot(1:t35,Fbest35)
% plot(1:t15,best)
% legend('S=20','S=30','S=50','best')
% title('Rate of convergence (case 3)')
% xlabel('Iterations')
% ylabel('Fbest value')






%case 4:K=5,10,15

% for i=1:20
%     [gbest16,Fbest16,t16]=cfpso(@fitness,tmax,S,N,5,L,U,percent,1);
%       if i==1
%           min1=Fbest16;
%       end
%       sum16=sum16+Fbest16;
%       if Fbest16(end)<min1(end)
%           min1=Fbest16;
%       end
% end
% Fbest16=sum16/20;
% 
% for i=1:20
%     [gbest26,Fbest26,t26]=cfpso(@fitness,tmax,S,N,10,L,U,percent,1);
%       if i==1
%           min2=Fbest26;
%       end
%       sum26=sum26+Fbest26;
%       if Fbest26(end)<min2(end)
%           min2=Fbest26;
%       end
% end
% Fbest26=sum26/20;
% 
% for i=1:20
%     [gbest36,Fbest36,t36]=cfpso(@fitness,tmax,S,N,15,L,U,percent,1);
%       if i==1
%           min3=Fbest36;
%       end
%       sum36=sum36+Fbest36;
%       if Fbest36(end)<min3(end)
%           min3=Fbest36;
%       end
% end
% Fbest36=sum36/20;
% 
% 
% for i=1:20
%     [gbest46,Fbest46,t46]=cfpso(@fitness,tmax,S,N,30,L,U,percent,1);
%       if i==1
%           min4=Fbest46;
%       end
%       sum46=sum46+Fbest46;
%       if Fbest46(end)<min4(end)
%           min4=Fbest46;
%       end
% end
% Fbest46=sum46/20;
% 
% 
% 
% indx=min([min1(end) min2(end) min3(end) min4(end)]);
% if indx==min1(end)
%     best=min1;
% elseif indx==min2(end)
%     best=min2;
% elseif indx==min3(end)
%     best=min3;
% elseif indx==min4(end)
%     best=min4;
% end
% 
% plot(1:t16,Fbest16)
% hold on
% plot(1:t26,Fbest26)
% plot(1:t36,Fbest36)
% plot(1:t46,Fbest46)
% plot(1:t16,best)
% legend('K=5','K=10','K=15','K=30','best')
% title('Rate of convergence (case 4)')
% xlabel('Iterations')
% ylabel('Fbest value')

% 
% 
% 
% 
% %case 5:Percent=0.2,0.5,0.7

for i=1:20
    [gbest17,Fbest17,t17]=cfpso(@fitness,tmax,S,N,K,L,U,0.2,1);
      if i==1
          min1=Fbest17;
      end
      sum17=sum17+Fbest17;
      if Fbest17(end)<min1(end)
          min1=Fbest17;
      end
end
Fbest17=sum17/20;

for i=1:20
    [gbest27,Fbest27,t27]=cfpso(@fitness,tmax,S,N,K,L,U,0.5,1);
      if i==1
          min2=Fbest27;
      end
      sum27=sum27+Fbest27;
      if Fbest27(end)<min2(end)
          min2=Fbest27;
      end
end
Fbest27=sum27/20;

for i=1:20
    [gbest37,Fbest37,t37]=cfpso(@fitness,tmax,S,N,K,L,U,0.7,1);
      if i==1
          min3=Fbest37;
      end
      sum37=sum37+Fbest37;
      if Fbest37(end)<min3(end)
          min3=Fbest37;
      end
end
Fbest37=sum37/20;

indx=min([min1(end) min2(end) min3(end)]);
if indx==min1(end)
    best=min1;
elseif indx==min2(end)
    best=min2;
elseif indx==min3(end)
    best=min3;
end

plot(1:t17,Fbest17)
hold on
plot(1:t27,Fbest27)
plot(1:t37,Fbest37)
plot(1:t17,best)
legend('percent=0.2','percent=0.5','percent=0.7','best')
title('Rate of convergence (case 5)')
xlabel('Iterations')
ylabel('Fbest value')
