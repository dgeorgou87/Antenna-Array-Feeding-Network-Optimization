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
e=1e-15;                                          %           Termination criterion
Pc=0.6;                                          %           CLPSO learning probability
w=0.5;                                           %           CLPSO Velocity weight
c=1;                                             %           CLPSO Position weight
n=0;                                             %           BPSO number of bits for the integer part of each number
m=13;                                            %           BPSO number of bits for the fraction part of each number
vmax=9;                                         %           BPSO maximum velocity
mr=0.04;                                          %           BPSO mutation probability
C1=0;                                          %           BPSO probability #1
C2=0.5;                                          %           BPSO probability #2
C3=0.5;                                          %           BPSO probability #3 

%case 1: Zr is real number and main lobe is directed at 0 degrees.
[gbest11,Fbest11,t11]=cfpso(@fitness,tmax,S,N,K,L,U,percent,1);
[gbest21,Fbest21,t21]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,c,1);
% [gbest31,Fbest31,t31]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,e,n,m,1);
% 
% %case 2: Zr is complex number and main lobe is directed at 0 degrees.
% [gbest12,Fbest12,t12]=cfpso(@fitness,tmax,S,N,K,L,U,percent,2);
% [gbest22,Fbest22,t22]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,c,2);
% [gbest32,Fbest32,t32]=bpso(@fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,n,m,2);
% 

%  
plot(1:t11,Fbest11)
hold on
plot(1:t21,Fbest21)
% plot(1:t31,Fbest31)
legend('cfpso','clpso','bpso')
title('Rate of convergence (case 1)')
xlabel('Iterations')
ylabel('Fbest value')
% 
% figure;
% plot(1:t12,Fbest12)
% hold on
% plot(1:t22,Fbest22)
% plot(1:t32,Fbest32)
% legend('cfpso','clpso','bpso')
% title('Rate of convergence (case 2)')
% xlabel('Iterations')
% ylabel('Fbest value')
% 
% figure;
% plot(1:t13,Fbest13)
% hold on
% plot(1:t23,Fbest23)
% plot(1:t33,Fbest33)
% legend('cfpso','clpso','bpso')
% title('Rate of convergence (case 3)')
% xlabel('Iterations')
% ylabel('Fbest value')
% 
% figure;
% plot(1:t14,Fbest14)
% hold on
% plot(1:t24,Fbest24)
% plot(1:t34,Fbest34)
% legend('cfpso','clpso','bpso')
% title('Rate of convergence (case 4)')
% xlabel('Iterations')
% ylabel('Fbest value')