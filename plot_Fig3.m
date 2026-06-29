function plot_front1

N = 10;
K = 100;
T = 1500*N;


sA = 2;
sB = 0;
qA = 0;
qB = 0;

%i.c.
c0 = zeros(1,K);
c0(K/2)=1/N;

%solve
c_bd = bd_1d(sA,sB,qA,qB,N,K,T,c0);
c_db = db_1d(sA,sB,qA,qB,N,K,T,c0);
c_fk = fk_1d(sA,sB,qA,qB,N,K,T,c0);

x=1:K;
t=1:N:T;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
dt = T./10;
subplot(3,2,1);
for(t=dt:dt:T)
plot(x,c_bd(x,t),'-'); hold on
end
axis([0 K 0 1.1]);
set(gca, 'FontSize',10);
% xlabel('location');
ylabel('frequnecy');
title('s=2,q=0','FontWeight','normal');

dt = T./10;
subplot(3,2,3);
for(t=1:dt:T)
plot(x,c_db(x,t),'-'); hold on
end
axis([0 K 0 1.1]);
set(gca, 'FontSize',10);
% xlabel('location');
ylabel('frequnecy');

dt = T./10;
subplot(3,2,5);
for(t=dt:dt:T)
plot(x,c_fk(x,t),'-'); hold on
end
axis([0 K 0 1.1]);
set(gca, 'FontSize',10);
xlabel('location');
ylabel('frequnecy');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sA = 1.2;
sB = 0;
qA = -.8;
qB = 0;

%i.c.
c0 = zeros(1,K);
c0(K/2)=1/N;

%solve
c_bd = bd_1d(sA,sB,qA,qB,N,K,2*T,c0);
c_db = db_1d(sA,sB,qA,qB,N,K,2*T,c0);
c_fk = fk_1d(sA,sB,qA,qB,N,K,2*T,c0);

x=1:K;
t=1:N:T;

dt = T./10;
subplot(3,2,2);
for(t=dt:dt:T)
plot(x,c_bd(x,t),'-'); hold on
end
axis([0 K 0 1.1]);
set(gca, 'FontSize',10);
% xlabel('location');
% ylabel('frequnecy');
title('s=1.2,q=-.8','FontWeight','normal');

dt = T./10;
subplot(3,2,4);
for(t=1:dt:T)
plot(x,c_db(x,t),'-'); hold on
end
axis([0 K 0 1.1]);
set(gca, 'FontSize',10);
% xlabel('location');
% ylabel('frequnecy');

dt = T./10;
subplot(3,2,6);
for(t=dt:dt:T)
plot(x,c_fk(x,t),'-'); hold on
end
axis([0 K 0 1.1]);
set(gca, 'FontSize',10);
xlabel('location');
% ylabel('frequnecy');

end