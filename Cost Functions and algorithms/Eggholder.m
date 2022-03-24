function z=Eggholder(W)

%L=-512*ones(2,1);
%U=512*ones(2,1);
z=-(W(2)+47)*sin(sqrt(abs((W(1)/2)+(W(2)+47))))-W(1)*sin(sqrt(abs(W(1)-(W(2)+47))));

end

