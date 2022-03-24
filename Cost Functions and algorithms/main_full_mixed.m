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
c=1;                                
sum11=0;             %           CLPSO Position weight
n=0;                                             %           BPSO number of bits for the integer part of each number
m=13;                                            %           BPSO number of bits for the fraction part of each number
vmax=9;                                         %           BPSO maximum velocity
mr=0.04;                                          %           BPSO mutation probability
C1=0;                                          %           BPSO probability #1
C2=0.5;                                          %           BPSO probability #2
C3=0.5;                                          %           BPSO probability #3 
sum21=0;
sum31=0;
sum12=0;
sum22=0;
sum32=0;
sum13=0;
sum23=0;
sum33=0;
sum14=0;
sum24=0;
sum34=0;
sum15=0;
sum25=0;
sum35=0;

%case 1: Zr is real number and main lobe is directed at 0 degrees.
% for i=1:20
%     [gbest11,Fbest11,t11]=cfpso(@fitness,tmax,S,N,K,L,U,percent,1);
%       if i==1
%           min1=Fbest11;
%       end
%       sum11=sum11+Fbest11;
%       if Fbest11(end)<min1(end)
%           min1=Fbest11;
%       end
% end
% Fbest11=sum11/20;
% 
% for i=1:20
%     [gbest21,Fbest21,t21]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,c,1);
%       if i==1
%           min2=Fbest21;
%       end
%       sum21=sum21+Fbest21;
%       if Fbest21(end)<min2(end)
%           min2=Fbest21;
%       end
% end
% Fbest21=sum21/20;
% 
% for i=1:20
%     [gbest31,Fbest31,t31]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,n,m,1);
%       if i==1
%           min3=Fbest31;
%       end
%       sum31=sum31+Fbest31;
%       if Fbest31(end)<min3(end)
%           min3=Fbest31;
%       end
% end
% Fbest31=sum31/20;
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
% plot(1:t11,Fbest11)
% hold on
% plot(1:t21,Fbest21)
% plot(1:t31,Fbest31)
% plot(1:t11,best)
% legend('cfpso','clpso','bpso','best')
% title('Rate of convergence (case 1)')
% xlabel('Iterations')
% ylabel('Fbest value')






% %case 2: Zr is complex number and main lobe is directed at 0 degrees.
% for i=1:20
%     [gbest12,Fbest12,t12]=cfpso(@fitness,tmax,S,N,K,L,U,percent,2);
%       if i==1
%           min1=Fbest12;
%       end
%       sum12=sum12+Fbest12;
%       if Fbest12(end)<min1(end)
%           min1=Fbest12;
%       end
% end
% Fbest12=sum12/20;
% 
% for i=1:20
%     [gbest22,Fbest22,t22]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,c,2);
%       if i==1
%           min2=Fbest22;
%       end
%       sum22=sum22+Fbest22;
%       if Fbest22(end)<min2(end)
%           min2=Fbest22;
%       end
% end
% Fbest22=sum22/20;
% 
% for i=1:20
%     [gbest32,Fbest32,t32]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,n,m,2);
%       if i==1
%           min3=Fbest32;
%       end
%       sum32=sum32+Fbest32;
%       if Fbest32(end)<min3(end)
%           min3=Fbest32;
%       end
% end
% Fbest32=sum32/20;
% 
% best=min([min1 min2 min3]);
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
% plot(1:t12,Fbest12)
% hold on
% plot(1:t22,Fbest22)
% plot(1:t32,Fbest32)
% plot(1:t12,best)
% legend('cfpso','clpso','bpso','best')
% title('Rate of convergence (case 2)')
% xlabel('Iterations')
% ylabel('Fbest value')




% %case 3: Zr is real number and main lobe is directed at -5 degrees.
% for i=1:20
%     [gbest13,Fbest13,t13]=cfpso(@fitness,tmax,S,N,K,L,U,percent,3);
%       if i==1
%           min1=Fbest13;
%       end
%       sum13=sum13+Fbest13;
%       if Fbest13(end)<min1(end)
%           min1=Fbest13;
%       end
% end
% Fbest13=sum13/20;
% 
% for i=1:20
%     [gbest23,Fbest23,t23]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,c,3);
%       if i==1
%           min2=Fbest23;
%       end
%       sum23=sum23+Fbest23;
%       if Fbest23(end)<min2(end)
%           min2=Fbest23;
%       end
% end
% Fbest23=sum23/20;
% 
% for i=1:20
%     [gbest33,Fbest33,t33]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,n,m,3);
%       if i==1
%           min3=Fbest33;
%       end
%       sum33=sum33+Fbest33;
%       if Fbest33(end)<min3(end)
%           min3=Fbest33;
%       end
% end
% Fbest33=sum33/20;
% 
% best=min([min1 min2 min3]);
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
% plot(1:t13,Fbest13)
% hold on
% plot(1:t23,Fbest23)
% plot(1:t33,Fbest33)
% plot(1:t13,best)
% legend('cfpso','clpso','bpso','best')
% title('Rate of convergence (case 3)')
% xlabel('Iterations')
% ylabel('Fbest value')





%case 4: Zr is complex number and main lobe is directed at -10 degrees.
for i=1:20
    [gbest14,Fbest14,t14]=cfpso(@fitness,tmax,S,N,K,L,U,percent,2);
      if i==1
          min1=Fbest14;
      end
      sum14=sum14+Fbest14;
      if Fbest14(end)<min1(end)
          min1=Fbest14;
      end
end
Fbest14=sum14/20;

for i=1:20
    [gbest24,Fbest24,t24]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,c,2);
      if i==1
          min2=Fbest24;
      end
      sum24=sum24+Fbest24;
      if Fbest24(end)<min2(end)
          min2=Fbest24;
      end
end
Fbest24=sum24/20;

for i=1:20
    [gbest34,Fbest34,t34]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,n,m,2);
      if i==1
          min3=Fbest34;
      end
      sum34=sum34+Fbest34;
      if Fbest34(end)<min3(end)
          min3=Fbest34;
      end
end
Fbest34=sum34/20;

best=min([min1 min2 min3]);

indx=min([min1(end) min2(end) min3(end)]);
if indx==min1(end)
    best=min1;
elseif indx==min2(end)
    best=min2;
elseif indx==min3(end)
    best=min3;
end

plot(1:t14,Fbest14)
hold on
plot(1:t24,Fbest24)
plot(1:t34,Fbest34)
plot(1:t14,best)
legend('cfpso','clpso','bpso','best')
title('Rate of convergence (case 4)')
xlabel('Iterations')
ylabel('Fbest value')
