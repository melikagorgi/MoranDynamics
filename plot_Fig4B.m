function plot_1d_heat4

N = 1;
K = 100;
T = 5000*N;

sA = 0;
sB = 0;
qA = -.5;
qB = 0;

%i.c.
c0 = zeros(1,K);
c0(K/2)=1/10;

%solve
c_bd = bd_1d(sA,sB,qA,qB,N,K,T,c0);
c_db = db_1d(sA,sB,qA,qB,N,K,T,c0);
c_fk = fk_1d(sA,sB,qA,qB,N,K,T,c0);

x=1:K;
t=1:T;
c_bd = c_bd(1:K,1:T); 
c_db = c_db(1:K,1:T);
c_fk = c_fk(1:K,1:T);

v = 2*sqrt((1/2)*(1/K^2)*sA);
t0 = 60;
x1 = +v.*(t-t0) + K/2;
x2 = -v.*(t-t0) + K/2;

figure;
colormap autumn
subplot(3,1,1)
contourf(t,x,c_bd,10); hold on 
colorbar;
caxis([0 1]);
set(0,'DefaultAxesFontSize', 14);
xlabel('time');
ylabel('distance');
% title('BD-1d');
axis([1 T 1 K]);
subplot(3,1,2)
colormap autumn
contourf(t,x,c_db,10); hold on 
colorbar;
caxis([0 1]);
set(0,'DefaultAxesFontSize', 14);
xlabel('time');
ylabel('distance');
% title('DB-1d');
axis([1 T 1 K]);
subplot(3,1,3)
colormap autumn
contourf(t,x,c_fk,10); hold on 
colorbar;
caxis([0 1]);
set(0,'DefaultAxesFontSize', 14);
xlabel('time');
ylabel('distance');
% title('FK-1d');
axis([1 T 1 K]);

% plot(t, x1, '- k',t,x2,'- k','LineWidth',1);



end