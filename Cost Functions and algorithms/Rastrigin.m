function z=Rastrigin(W)

%L=-5.12*ones(3,1);
%U=5.12*ones(3,1);
sum=0;
for i=1:3
	xi=W(i);
	sum=sum+(xi^2-10*cosd(2*pi*xi));
end

z=30+sum;



end

