function z=Easom(W)

%L=-100*ones(2,1);
%U=100*ones(2,1);

z=-cosd(W(1))*cosd(W(2))*exp(-(W(1)-pi)^2-(W(2)-pi)^2);


end

