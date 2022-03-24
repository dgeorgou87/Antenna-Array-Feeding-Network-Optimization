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
sum18=0;
sum28=0;
sum38=0;
sum19=0;
sum29=0;
sum39=0;
sum110=0;
sum210=0;
sum310=0;


% case 6:Pc=0.25, 0.5, 0.7

% for i=1:20
%     [gbest18,Fbest18,t18]=clpso(@fitness,tmax,S,N,K,L,U,percent,0.25,w,c,1);
%       if i==1
%           min1=Fbest18;
%       end
%       sum18=sum18+Fbest18;
%       if Fbest18(end)<min1(end)
%           min1=Fbest18;
%       end
% end
% Fbest18=sum18/20;
% 
% for i=1:20
%     [gbest28,Fbest28,t28]=clpso(@fitness,tmax,S,N,K,L,U,percent,0.5,w,c,1);
%       if i==1
%           min2=Fbest28;
%       end
%       sum28=sum28+Fbest28;
%       if Fbest28(end)<min2(end)
%           min2=Fbest28;
%       end
% end
% Fbest28=sum28/20;
% 
% for i=1:20
%     [gbest38,Fbest38,t38]=clpso(@fitness,tmax,S,N,K,L,U,percent,0.75,w,c,1);
%       if i==1
%           min3=Fbest38;
%       end
%       sum38=sum38+Fbest38;
%       if Fbest38(end)<min3(end)
%           min3=Fbest38;
%       end
% end
% Fbest38=sum38/20;
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
% plot(1:t18,Fbest18)
% hold on
% plot(1:t28,Fbest28)
% plot(1:t38,Fbest38)
% plot(1:t18,best)
% legend('Pc=0.25','Pc=0.5','Pc=0.75','best')
% title('Rate of convergence (case 6)')
% xlabel('Iterations')
% ylabel('Fbest value')




% % case 7:w=0.33, 0.66, 1
% 
% for i=1:20
%     [gbest19,Fbest19,t19]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,0.33,c,1);
%       if i==1
%           min1=Fbest19;
%       end
%       sum19=sum19+Fbest19;
%       if Fbest19(end)<min1(end)
%           min1=Fbest19;
%       end
% end
% Fbest19=sum19/20;
% 
% for i=1:20
%     [gbest29,Fbest29,t29]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,0.66,c,1);
%       if i==1
%           min2=Fbest29;
%       end
%       sum29=sum29+Fbest29;
%       if Fbest29(end)<min2(end)
%           min2=Fbest29;
%       end
% end
% Fbest29=sum29/20;
% 
% for i=1:20
%     [gbest39,Fbest39,t39]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,1,c,1);
%       if i==1
%           min3=Fbest39;
%       end
%       sum39=sum39+Fbest39;
%       if Fbest39(end)<min3(end)
%           min3=Fbest39;
%       end
% end
% Fbest39=sum39/20;
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
% plot(1:t19,Fbest19)
% hold on
% plot(1:t29,Fbest29)
% plot(1:t39,Fbest39)
% plot(1:t19,best)
% legend('w=0.33','w=0.66','w=1','best')
% title('Rate of convergence (case 7)')
% xlabel('Iterations')
% ylabel('Fbest value')






% % case 8:c=0.33, 0.66, 1
% 
% for i=1:20
%     [gbest110,Fbest110,t110]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,0.33,1);
%       if i==1
%           min1=Fbest110;
%       end
%       sum110=sum110+Fbest110;
%       if Fbest110(end)<min1(end)
%           min1=Fbest110;
%       end
% end
% Fbest110=sum110/20;
% 
% for i=1:20
%     [gbest210,Fbest210,t210]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,0.66,1);
%       if i==1
%           min2=Fbest210;
%       end
%       sum210=sum210+Fbest210;
%       if Fbest210(end)<min2(end)
%           min2=Fbest210;
%       end
% end
% Fbest210=sum210/20;
% 
% for i=1:20
%     [gbest310,Fbest310,t310]=clpso(@fitness,tmax,S,N,K,L,U,percent,Pc,w,1,1);
%       if i==1
%           min3=Fbest310;
%       end
%       sum310=sum310+Fbest310;
%       if Fbest310(end)<min3(end)
%           min3=Fbest310;
%       end
% end
% Fbest310=sum310/20;
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
% plot(1:t110,Fbest110)
% hold on
% plot(1:t210,Fbest210)
% plot(1:t310,Fbest310)
% plot(1:t110,best)
% legend('c=0.33','c=0.66','c=1','best')
% title('Rate of convergence (case 10)')
% xlabel('Iterations')
% ylabel('Fbest value')
