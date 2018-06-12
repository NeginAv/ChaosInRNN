clear all; 
clc;
randn('seed',0);
N=10;
m=randn(1,N);
n=randn(1,N);
while (m'*n/N) > 1
    m=randn(1,N);
    n=randn(1,N);
end

g=linspace(0,1,20);
   for i=1:21
   x = transpose(sym( 'x', [1 N]) );
   Initial_condition=2+zeros(1,N);
   g=(i-1)*(1-0)/20; %to have same dimension in equation for J
   J = g/sqrt(N) * randn(N,N) + m' * n/N;
   f = @(t,x) [-x + J * tanh(x)];
   T=100;
   [t,Activation]= ode45(f,[0,T],Initial_condition);
   plot(t,Activation(:,i)); %we have N activation variable
   hold on;
   xlabel('time');
   ylabel('Activation x');
   end