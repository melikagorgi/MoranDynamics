function c = db_1d(sA,sB,qA,qB,N,K,T,c0)
% calcualte the mutant freqeuncy for db upating rule in 1d cycle
% N=island size, K=number of islands, T=total time, c0= initial condition

rA = 1+sA;
rB = 1+sB;
dA = 1+qA;
dB = 1+qB;

c = zeros(K,T);
cc = zeros(1,T);

%i.c.
c(:,1)=c0;

% solve for freq c(i,t)
for(t=1:T-1)
cc(t) = sum(c(:,t));
D = dA.*cc(t) + dB.*(K-cc(t));
for(i=1:K)   
B = rA.*(c(mod(i,K)+1,t)+c(mod(i-2,K)+1,t)) + rB.*(1-c(mod(i,K)+1,t)+1-c(mod(i-2,K)+1,t));
W_plus = (1./(D*B)) * rA*dB*(c(mod(i,K)+1,t)+c(mod(i-2,K)+1,t))*(1-c(i,t));
W_minus = (1./(B*D)) * rB*dA*(1-c(mod(i,K)+1,t)+1-c(mod(i-2,K)+1,t))*c(i,t);
c(i,t+1) = c(i,t) + (1/N)*(W_plus - W_minus);
end
end