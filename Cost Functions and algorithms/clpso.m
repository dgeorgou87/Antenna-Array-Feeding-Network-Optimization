function [gbest,Fbest,t]=clpso(fitness,tmax,S,N,K,L,U,percent,Pc,w,c,sw)

tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART A - Initialisation


%steps a,b and c
       
R=U-L;
Vmax=percent*R;

x=zeros(S,N);
F=zeros(S,1);
l_indx=zeros(S,1);
lbest=zeros(S,N);
gbest=rand(tmax,N);
Fmin=zeros(S,1);

%step d

for j=1:N
    for i=1:S
        x(i,j)=(U(j)-L(j)).*rand+L(j);      %random initial position ( in [L(i),U(i)] ) for each particle
    end      
end


%step e


v=rand(S,N);              %random initial velocity ( <=Vmax )for each particle

for j=1:N
    for i=1:S
        if v(i,j)>Vmax(j)
            v(i,j)=Vmax(j);
        elseif v(i,j)<-Vmax(j)
            v(i,j)=Vmax(j);
        end
    end
end


%step f


for i=1:S
    F(i)=fitness(x(i,:),sw);    %finding the fitness values for all particles
end

%step g


p=x;

Fp=F;


%step h


Fmin1=min(Fp);               %finding the particle that gives the best fitness value so far
index=find(Fp==Fmin1,1);
gbest(1,:)=x(index,:);
Fbest(1)=Fmin1;

Fpi=zeros(S,1);
Fpi(1)=Fmin1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART B - Optimisation

t=1;

fprintf('Iteration     Fbest                              gbest \n')
fprintf('   %d       %d             %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d',...
    t,Fmin1,gbest(t+1,1),gbest(1,2)',gbest(1,3),gbest(1,4),gbest(1,5),gbest(1,6)',gbest(1,7),gbest(1,8),gbest(1,9),gbest(1,10)',gbest(1,11),gbest(1,12)...
    ,gbest(1,13),gbest(1,14))
fprintf('\n')

while (t<tmax)
    
%step a
    
    
index=zeros(S,K+1);

for i=1:S
    index(i,:)=[i randperm(S,K)];     %finding K neighbours for each particle
end

Fl=zeros(S,K+1);

%step b
    for j=1:K+1
        for i=1:S
            Fl(i,j)=fitness(x(index(i,j),:),sw);  %matrix where each row has the fitness values of a neighbourhood
            Fmin(i)=min(Fl(i,:));               %lbest matrix contains the local best fitness value for each neighbourhood 
        end
    end



    for i=1:S
        l_indx(i)=find(Fl(i,:)==Fmin(i),1);
        lbest(i,:)=x(index(i,l_indx(i)),:);    %finding position of the local best fitness value
    end


    
%step c


    for j=1:N
        for i=1:S
            if rand()>Pc
                v(i,j)=w*v(i,j)+c*rand()*(p(i,j)-x(i,j)); %updating velocity
            else
                C1=randi(S);
                C2=randi(S);
                Fp1=Fpi(C1);
                Fp2=Fpi(C2);
                if Fp1<Fp2
                    v(i,j)=w*v(i,j)+c*rand()*(p(C1,j)-x(i,j));
                else
                    v(i,j)=w*v(i,j)+c*rand()*(p(C2,j)-x(i,j));
                end
            end
            
            if v(i,j)>Vmax(j)              %restricting velocity vaues within the preset boundaries
                v(i,j)=Vmax(j);
            elseif v(i,j)<-Vmax(j)      
                v(i,j)=-Vmax(j);
            end
        end
    end



    for j=1:N
        for i=1:S
            x(i,j)=x(i,j)+v(i,j);
            if x(i,j)>U(j)
                x(i,j)=U(j);                 %absorbing walls conditions
                v(i,j)=0;
            elseif x(i,j)<L(j)
                x(i,j)=L(j);
                v(i,j)=0;
            end
        end
    end


%steps e,f,g


    for i=1:S
        F(i)=fitness(x(i,:),sw);    %finding the fitness values for all particles
        Fpi(i)=fitness(p(i,:),sw);
        if F(i)<Fpi(i)
            p(i,:)=x(i,:);       %the new position becomes pbest position for the i-th particle
        end
        if Fpi(i)<fitness(gbest(t+1,:),sw)     %the pbest position with the maximum fitness value becomes gbest position
            gbest(t+1,:)=p(i,:);
        end
    end


    Fbest(t+1)=fitness(gbest(t,:),sw);


fprintf('   %d       %d             %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d',...
    t+1,Fbest(t+1),gbest(t+1,1),gbest(t+1,2)',gbest(t+1,3),gbest(t+1,4),gbest(t+1,5),gbest(t+1,6)',gbest(t+1,7),gbest(t+1,8),gbest(t+1,9),gbest(t+1,10)',gbest(t+1,11),gbest(t+1,12)...
    ,gbest(t+1,13),gbest(t+1,14))
fprintf('\n')

t=t+1;

end

Fbest=[Fmin1 Fbest];
Fbest=Fbest(1:end-1);
gbest=gbest(1:t,:);


toc 


end

