function c = fk_1d(sA,sB,qA,qB,N,K,T,c0)
% calcualte the mutant freqeuncy for disceter fisher-kolmogorov (diffusion-reaction)
% in 1d cycle
% N=island size, K=number of islands, T=total time, c0= initial condition

rA = 1+sA;
rB = 1+sB;
dA = 1+qA;
dB = 1+qB;

c = zeros(K,T);

%i.c.
c(:,1)=c0;


for(t=1:T-1)
for(i=1:K)  
c(i,t+1) = c(i,t) + (1/(N*K))*((1/2)*(c(mod(i,K)+1,t)+c(mod(i-2,K)+1,t)-2*c(i,t)) ...
    + ((rA*dB-rB*dA)/(rB*dB))*(c(i,t)*(1-c(i,t))));
% W_diff = (1./(2*K))*(c(mod(i,K)+1,t)+c(mod(i-2,K)+1,t))*(1-c(i,t))-(1./(2*K))*(1-c(mod(i,K)+1,t)+1-c(mod(i-2,K)+1,t))*c(i,t);
% W_reac = (1./(K))* (sA-qA).*c(i,t).*(1-c(i,t));
% c(i,t+1) = c(i,t) + (1/N).*(W_diff+W_reac);
end
end
