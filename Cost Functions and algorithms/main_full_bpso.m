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
sum111=0;
sum211=0;
sum311=0;
sum112=0;
sum212=0;
sum312=0;
sum412=0;
sum113=0;
sum213=0;
sum313=0;
sum114=0;
sum214=0;
sum314=0;
sum115=0;
sum215=0;
sum315=0;



% case 9:vmax=4, 9, 13

% for i=1:20
%     [gbest111,Fbest111,t111]=bpso(@fitness,tmax,S,N,L,U,4,mr,C1,C2,C3,n,m,1);
%       if i==1
%           min1=Fbest111;
%       end
%       sum111=sum111+Fbest111;
%       if Fbest111(end)<min1(end)
%           min1=Fbest111;
%       end
% end
% Fbest111=sum111/20;
% 
% for i=1:20
%     [gbest211,Fbest211,t211]=bpso(@fitness,tmax,S,N,L,U,9,mr,C1,C2,C3,n,m,1);
%       if i==1
%           min2=Fbest211;
%       end
%       sum211=sum211+Fbest211;
%       if Fbest211(end)<min2(end)
%           min2=Fbest211;
%       end
% end
% Fbest211=sum211/20;
% 
% for i=1:20
%     [gbest311,Fbest311,t311]=bpso(@fitness,tmax,S,N,L,U,13,mr,C1,C2,C3,n,m,1);
%       if i==1
%           min3=Fbest311;
%       end
%       sum311=sum311+Fbest311;
%       if Fbest311(end)<min3(end)
%           min3=Fbest311;
%       end
% end
% Fbest311=sum311/20;
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
% plot(1:t111,Fbest111)
% hold on
% plot(1:t211,Fbest211)
% plot(1:t311,Fbest311)
% plot(1:t111,best)
% legend('vmax=4','vmax=9','vmax=13','best')
% title('Rate of convergence (case 9)')
% xlabel('Iterations')
% ylabel('Fbest value')




% % case 10:mr=0, 0.04, 0.15 ,0.3

% for i=1:20
%     [gbest112,Fbest112,t112]=bpso(@fitness,tmax,S,N,L,U,vmax,0,C1,C2,C3,n,m,1);
%       if i==1
%           min1=Fbest112;
%       end
%       sum112=sum112+Fbest112;
%       if Fbest112(end)<min1(end)
%           min1=Fbest112;
%       end
% end
% Fbest112=sum112/20;
% 
% for i=1:20
%     [gbest212,Fbest212,t212]=bpso(@fitness,tmax,S,N,L,U,vmax,0.04,C1,C2,C3,n,m,1);
%       if i==1
%           min2=Fbest212;
%       end
%       sum212=sum212+Fbest212;
%       if Fbest212(end)<min2(end)
%           min2=Fbest212;
%       end
% end
% Fbest212=sum212/20;
% 
% for i=1:20
%     [gbest312,Fbest312,t312]=bpso(@fitness,tmax,S,N,L,U,vmax,0.15,C1,C2,C3,n,m,1);
%       if i==1
%           min3=Fbest312;
%       end
%       sum312=sum312+Fbest312;
%       if Fbest312(end)<min3(end)
%           min3=Fbest312;
%       end
% end
% Fbest312=sum312/20;
% 
% 
% 
% 
% for i=1:20
%     [gbest412,Fbest412,t412]=bpso(@fitness,tmax,S,N,L,U,vmax,0.3,C1,C2,C3,n,m,1);
%       if i==1
%           min4=Fbest412;
%       end
%       sum412=sum412+Fbest412;
%       if Fbest412(end)<min4(end)
%           min4=Fbest412;
%       end
% end
% Fbest412=sum412/20;
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
% plot(1:t112,Fbest112)
% hold on
% plot(1:t212,Fbest212)
% plot(1:t312,Fbest312)
% plot(1:t412,Fbest412)
% plot(1:t112,best)
% legend('mr=0','mr=0.04','mr=0.15','m=0.3','best')
% title('Rate of convergence (case 10)')
% xlabel('Iterations')
% ylabel('Fbest value')






% % case 11:C1=0.33, 0.66, 1
% 
% for i=1:20
%     [gbest113,Fbest113,t113]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,0.33,C2,C3,n,m,1);
%       if i==1
%           min1=Fbest113;
%       end
%       sum113=sum113+Fbest113;
%       if Fbest113(end)<min1(end)
%           min1=Fbest113;
%       end
% end
% Fbest113=sum113/20;
% 
% for i=1:20
%     [gbest213,Fbest213,t213]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,0.66,C2,C3,n,m,1);
%       if i==1
%           min2=Fbest213;
%       end
%       sum213=sum213+Fbest213;
%       if Fbest213(end)<min2(end)
%           min2=Fbest213;
%       end
% end
% Fbest213=sum213/20;
% 
% for i=1:20
%     [gbest313,Fbest313,t313]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,1,C2,C3,n,m,1);
%       if i==1
%           min3=Fbest313;
%       end
%       sum313=sum313+Fbest313;
%       if Fbest313(end)<min3(end)
%           min3=Fbest313;
%       end
% end
% Fbest313=sum313/20;
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
% plot(1:t113,Fbest113)
% hold on
% plot(1:t213,Fbest213)
% plot(1:t313,Fbest313)
% plot(1:t113,best)
% legend('C1=0.33','C1=0.66','C1=1','best')
% title('Rate of convergence (case 11)')
% xlabel('Iterations')
% ylabel('Fbest value')




% % case 12:C2=0.33, 0.66, 1
% 
% for i=1:20
%     [gbest114,Fbest114,t114]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,0.33,C3,n,m,1);
%       if i==1
%           min1=Fbest114;
%       end
%       sum114=sum114+Fbest114;
%       if Fbest114(end)<min1(end)
%           min1=Fbest114;
%       end
% end
% Fbest114=sum114/20;
% 
% for i=1:20
%     [gbest214,Fbest214,t214]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,0.66,C3,n,m,1);
%       if i==1
%           min2=Fbest214;
%       end
%       sum214=sum214+Fbest214;
%       if Fbest214(end)<min2(end)
%           min2=Fbest214;
%       end
% end
% Fbest214=sum214/20;
% 
% for i=1:20
%     [gbest314,Fbest314,t314]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,1,C3,n,m,1);
%       if i==1
%           min3=Fbest314;
%       end
%       sum314=sum314+Fbest314;
%       if Fbest314(end)<min3(end)
%           min3=Fbest314;
%       end
% end
% Fbest314=sum314/20;
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
% plot(1:t114,Fbest114)
% hold on
% plot(1:t214,Fbest214)
% plot(1:t314,Fbest314)
% plot(1:t114,best)
% legend('C2=0.33','C2=0.66','C2=1','best')
% title('Rate of convergence (case 12)')
% xlabel('Iterations')
% ylabel('Fbest value')




% % case 13:C3=0.33, 0.66, 1
% 
for i=1:20
    [gbest115,Fbest115,t115]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,0.33,n,m,1);
      if i==1
          min1=Fbest115;
      end
      sum115=sum115+Fbest115;
      if Fbest115(end)<min1(end)
          min1=Fbest115;
      end
end
Fbest115=sum115/20;

for i=1:20
    [gbest215,Fbest215,t215]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,0.66,n,m,1);
      if i==1
          min2=Fbest215;
      end
      sum215=sum215+Fbest215;
      if Fbest215(end)<min2(end)
          min2=Fbest215;
      end
end
Fbest215=sum215/20;

for i=1:20
    [gbest315,Fbest315,t315]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,1,n,m,1);
      if i==1
          min3=Fbest315;
      end
      sum315=sum315+Fbest315;
      if Fbest315(end)<min3(end)
          min3=Fbest315;
      end
end
Fbest315=sum315/20;

indx=min([min1(end) min2(end) min3(end)]);
if indx==min1(end)
    best=min1;
elseif indx==min2(end)
    best=min2;
elseif indx==min3(end)
    best=min3;
end

plot(1:t115,Fbest115)
hold on
plot(1:t215,Fbest215)
plot(1:t315,Fbest315)
plot(1:t115,best)
legend('C3=0.33','C3=0.66','C3=1','best')
title('Rate of convergence (case 13)')
xlabel('Iterations')
ylabel('Fbest value')
