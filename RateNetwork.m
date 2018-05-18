%% Mastrogiuseppe and Ostojic simulations. 5-18-2018. 
clear all; clc;

randn('seed',0); % Fix the seed. But only do this at the beginning. Once we 
% introduce different realizations, the seed should only be fixed at the
% beginning of the code.
N = 100;
g = 1;
m = randn(1,N);
n = randn(1,N);

x = transpose(sym( 'x', [1 N]) ); % Create the variable x used in the differential equation.
J = g /sqrt(N) * randn(N,N) + m' * n/N; % connectivity matrix.
T=1000; % Pick some time long enough for the units to reach steady state. 

f = @(t,x) [-x + J * tanh(x)]; 

InitialCondition = 2+zeros(1,N); %Initial condition: for now it is the same for all neurons.
[t, xSoln] = ode45(f, [0 T],InitialCondition); 
% t is the time vector and xSoln is a matrix where each row is time and
% each column is a different neuron.

% Next plot the activation variable x for different units and the mean response.
% This is optional, in case we'd like to look at the plots.
graphs=1; % 0 means no plots. Set to 1 to look at the plots.
if(graphs)
    figure; hold on
    for i = 1:N/10
        plot( t, xSoln(:,i) );
    end
    xlabel('time');
    ylabel('x');
end

m_net=mean( transpose (xSoln) ); % Average of x across units.

% Steady state rate.
AvgInput = mean( xSoln(T,:) ); % We take the steady state rate to be the 
%rate at final time T and this is the avergae of this quantity across units.


%% Next we need to generate different realizations of the network and then 
% calculate the quantities in eqn (20) and (21) of Ostojic's paper. 













