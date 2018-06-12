clear all; clc;
randn('seed',0);
N=100;
m=randn(1,N);
n=randn(1,N);
g=linspace(1,3,20);
p=(dot(m,n));
if p>2
    m=randn(1,N);
    n=randn(1,N);
end

 for i=1:21
   x = transpose(sym( 'x', [1 N]) );
   Initial_condition=2+zeros(1,N);
   g=(i-1)*(3-1)/20; %to have same dimension in equation for J
   J = g/sqrt(N) * randn(N,N) + m' * n/N;
   f = @(t,x) [-x + J * tanh(x)];
   T=1000;
   [t,Activation]= ode45(f,[0,T],Initial_condition);
   plot(t,Activation(:,i)); %we have N activation variable
   hold on;
   xlabel('time');
   ylabel('Activation x');
end
