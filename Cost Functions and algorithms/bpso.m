function [gbest,Fbest,t]=bpso(fitness,tmax,S,N,L,U,vmax,mr,C1,C2,C3,n,m,stc)


tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART A - Initialisation

%part 1

D=n+m;

F=zeros(S,1);
gbest=rand(tmax,N);
Fmin=zeros(S,1);

%part 2

x=rand(S,N*D)>0.5;    %creating random binary matrices where each row has D bits for each of the N dimensions
v=rand(S,N*D)>0.5;
g=rand(S,N*D)>0.5;
xdec=zeros(S,N);

%part3

for i=1:S
    for j=1:D:N*D
        a=v(i,j:j+D-1);
        while(sum(a)>vmax)               %applying NS (Negative Selection)
            index=find(a==1);
            sw=index(randi(numel(index)));
            a(sw)=0;
        end
        v(i,j:j+D-1)=a;
    end
end

for i=1:S
    k=1;
    for j=1:D:N*D 
        b=x(i,j:j+D-1);
        xdec(i,k)=b*pow2(n-1:-1:-m).';                  %converting x to decimal form
        k=k+1;
    end
end


 
for j=1:N
    for i=1:S
        if xdec(i,j)>U(j)
            xdec(i,j)=U(j);                 %absorbing walls conditions
        elseif xdec(i,j)<L(j)
            xdec(i,j)=L(j);
        end
    end
end

%part 4

for i=1:S
    F(i)=fitness(xdec(i,:),stc);    %finding the fitness values for all particles
end


Fp=F;


Fmin1=min(Fp);               %finding the particle that gives the best fitness value so far
index=find(Fp==Fmin1,1);
gbest(1,:)=xdec(index,:);
Fbest(1)=Fmin1;

%part 5

p=x;
pdec=xdec;

for i=1:S
    k=1;
    for j=1:D:N*D
        g(i,j:j+D-1)=fix(rem(gbest(i,k)*pow2(-(n-1):m),2));    %g is the binary version of gbest
        k=k+1;
    end
end


    
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

    %part 6
    
    for i=1:S
        for j=1:D*N
            v(i,j)=(rand()<C1)&&v(i,j) || (rand()>C2)&&(xor(p(i,j),x(i,j))) || (rand()>C3)&&(xor(g(i,j),x(i,j)));
        end
    end
    
    
    %part7
 
    for i=1:S
        for j=1:D:N*D
            a=v(i,j:j+D-1);
            while(sum(a)>vmax)                  %applying NS (Negative Selection)
                index=find(a==1);
                sw=index(randi(numel(index)));
                a(sw)=0;
            end
            v(i,j:j+D-1)=a;
        end
    end

    
    %part 8
    
    for i=1:S
        for j=1:N*D
            if v(i,j)==0              %applying vm (velocity mutation)
                v(i,j)=rand()<mr;
            end
        end
    end
            
               

    %part 9
    
    
    for i=1:S
        for j=1:D*N
            x(i,j)=xor(x(i,j),v(i,j));     % updating position
        end
    end


    %part 10
    
    
    for i=1:S
        k=1;
        for j=1:D:N*D
            b=x(i,j:j+D-1);
            xdec(i,k)=b*pow2(n-1:-1:-m).';  %converting x to decimal form
            k=k+1;
        end
    end


    for j=1:N
        for i=1:S
            if xdec(i,j)>U(j)
                xdec(i,j)=U(j);                 %absorbing walls conditions
            elseif xdec(i,j)<L(j)
                xdec(i,j)=L(j);
            end
        end
    end
    
    

    Fpi=zeros(S,1);
    
    for i=1:S
        F(i)=fitness(xdec(i,:),stc);    %finding the fitness values for all particles
        Fpi(i)=fitness(pdec(i,:),stc);
    end

    
    %part 11

    
    
    for i=1:S
        if F(i)<Fpi(i)
            pdec(i,:)=xdec(i,:);       %the new position becomes pbest position for the i-th particle
        end
        if Fpi(i)<fitness(gbest(t+1,:),stc)     %the pbest position with the maximum fitness value becomes gbest position
            gbest(t+1,:)=pdec(i,:);
        end
    end


    
    Fbest(t+1)=fitness(gbest(t,:),stc);


    fprintf('   %d       %d             %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d  %1.3d',...
        t+1,Fbest(t+1),gbest(t+1,1),gbest(t+1,2)',gbest(t+1,3),gbest(t+1,4),gbest(t+1,5),gbest(t+1,6)',gbest(t+1,7),gbest(t+1,8),gbest(t+1,9),gbest(t+1,10)',gbest(t+1,11),gbest(t+1,12)...
        ,gbest(t+1,13),gbest(t+1,14))
    fprintf('\n')

    t=t+1;
    
    
    %converting matrices back to binary form
    
 
    
    for i=1:S
    k=1;
        for j=1:D:N*D
            p(i,j:j+D-1)=fix(rem(pdec(i,k)*pow2(-(n-1):m),2));    %p is the binary version of pdec
            k=k+1;
        end
    end
    
    for i=1:S
    k=1;
        for j=1:D:N*D
            g(i,j:j+D-1)=fix(rem(gbest(i,k)*pow2(-(n-1):m),2));    %g is the binary version of gbest
            k=k+1;
        end
    end
    


end

Fbest=[Fmin1 Fbest];
Fbest=Fbest(1:end-1);
gbest=gbest(1:t,:);




toc;




end

