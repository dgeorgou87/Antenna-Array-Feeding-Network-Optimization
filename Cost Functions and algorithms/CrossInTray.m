function z=CrossInTray(W)

%L=-10*ones(2,1);
%U=10*ones(2,1);

z=-0.0001*(abs(sin(W(1))*sin(W(2))*exp(abs(100-(sqrt(W(1)^2+W(2)^2)/pi))))+1)^0.1;

end

