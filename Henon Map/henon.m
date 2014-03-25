% MATLAB implementation of the Hénon Map
% Author: Lianne Meah <lianne.meah@gmail.com>

clc
clear all

%% PARAMETERS
iterations = 1000;
x = zeros(1, iterations);
y = zeros(1, iterations);
a = 1.4;
b = 0.3;
dt = 0.001;

%% FLAGS
drawing = 0; % set to 1 to plot at each step
bifurcation = 1; % set to 1 or 2 to plot birfurcation (x & a, x & b)
plotter = 0; % set to 1 for normal plot (x vs y)

%% PLOTTING
% Normal plot
if plotter==1
	% set initial value of x
	x(1,1) = 0.1;
	for i=1:iterations
		% apply update
		x(1,i+1) = 1-(a*x(1,i)^2) + y(1,i);
		y(1,i+1) = b*x(1,i);
		% plotting
		plot(x(5:iterations),y(5:iterations), '.k','MarkerSize',3)
		line1 = sprintf('Henon Map with %.0f iterations', iterations);
		line2 = sprintf('a = %.2f, b = %.4f', a, b);
		title({line1, line2});
		xlabel('x')
		ylabel('y')
		% if model is set to update after each iteration
		if drawing==1
			drawnow
		end
	end
end

% to demonstrate system dynamics with varying 'a' parameter
if bifurcation==1
	minAlpha = 0.1;
	for alpha = minAlpha:dt:(a)
		% set initial values
		x(1,1) = 0.1;
		y(1,1) = 0;
		% start iterating
		for i=1:iterations
			% apply Henon Map update
			x(1,i+1) = 1-(alpha*x(1,i)^2) + y(1,i);
			y(1,i+1) = b*x(1,i);
		end
		% plotting
		plot(alpha*ones(1,10), x(1,iterations-9:iterations),'.k','MarkerSize',1)
		line1 = sprintf('Bifurcation diagram for the Henon Map with %.0f iterations', iterations);
		line2 = sprintf('b = %.2f', b);
		title({line1, line2});
		xlabel('a')
		ylabel('x')
		if drawing==1
			drawnow
		end
		hold on
	end
end

% to demonstrate system dynamics with varying 'b' parameter
if bifurcation==2
	minBeta = -0.6;
	for beta1 = minBeta:dt:(b+0.1)
		% set initial values
		x(1,1) = 0.1;
		y(1,1) = 0;
		% start iterating
		for i=1:iterations
			% apply Henon Map update
			x(1,i+1) = 1-(a*x(1,i)^2) + y(1,i);
			y(1,i+1) = beta1*x(1,i);
		end
		% plotting
		plot(beta1*ones(1,10),x(1,iterations-9:iterations),'.k','MarkerSize',1)
		line1 = sprintf('Bifurcation diagram for the Henon Map with %.0f iterations', iterations);
		title({line1});
		xlabel('a')
		ylabel('x')
		if drawing==1
			drawnow
		end
		hold on
	end
end