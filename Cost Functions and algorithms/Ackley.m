function z=Ackley(W)

% L=-5*ones(2,1);
% U=5*ones(2,1);
z=-20*exp(-0.2*sqrt(0.5*(W(1)^2+W(2)^2)))-exp(0.5*(cosd(2*pi*W(1))+cosd(2*pi*W(2))))+20+exp(1);

end

