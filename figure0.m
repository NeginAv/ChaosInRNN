clear all; 
clc;
randn('seed',0);
N=100;
m=randn(1,N);
n=randn(1,N);
g=1;
J = g/sqrt(N) * randn(N,N) + m' * n/N;
x = transpose(sym( 'x', [1 N]) );
Initial_condition=2+zeros(1,N);
f = @(t,x) [-x + J * tanh(x)]; 
T=1000;
[t,Activation]= ode45(f,[0,T],Initial_condition);
for i=1:N/10
  plot(t,Activation(:,i)); %we have N activation variable
  hold on;
end
xlabel('time');
ylabel('Activation x');