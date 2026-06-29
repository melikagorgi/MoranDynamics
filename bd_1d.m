function c = bd_1d(sA,sB,qA,qB,N,K,T,c0)
% calcualte the mutant freqeuncy for bd upating rule in 1d cycle
% N=island size, K=number of islands, T=total time, c0= initial condition

rA = 1+sA;
rB = 1+sB;
dA = 1+qA;
dB = 1+qB;

c = zeros(K,T);
cc = zeros(1,T);

%i.c.
c(:,1)=c0;


for(t=1:T-1)
cc(t) = sum(c(:,t));
B = rA.*cc(t) + rB.*(K-cc(t));
for(i=1:K)   
D1 = dA.*(c(mod(i+2-1,K)+1,t)+c(i,t)) + dB.*(1-c(mod(i+2-1,K)+1,t)+1-c(i,t));
D2 = dA.*(c(mod(i-2-1,K)+1,t)+c(i,t)) + dB.*(1-c(mod(i-2-1,K)+1,t)+1-c(i,t));
W_plus  = (1./B) * rA.*dB.*(c(mod(i,K)+1,t)/D1+c(mod(i-2,K)+1,t)/D2).*(1-c(i,t));
W_minus = (1./B) * rB.*dA.*((1-c(mod(i,K)+1,t))/D1 + (1-c(mod(i-2,K)+1,t))/D2).*c(i,t);
c(i,t+1) = c(i,t) + (1/N)*(W_plus - W_minus);
end
end

end