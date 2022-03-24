function z=SchafferN4(W)
%L=-100*ones(2,1);
%U=100*ones(2,1);
z=0.5+(cos(sin(abs(W(1)^2-W(2)^2)))^2-0.5)/((1+0.001*(W(1)^2+W(2)^2))^2);

end

