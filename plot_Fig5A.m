function plot_1d_speed1

N = 1;
K = 1000;
T = 1000*K;

sA = .5;
sB = 0;
qA = 0;
qB = 0;


%i.c.
c0 = zeros(1,K);
c0(1)=1/N;

%solve
c_bd = bd_1d(sA,sB,qA,qB,N,K,T,c0);
c_db = db_1d(sA,sB,qA,qB,N,K,T,c0);
c_fk = fk_1d(sA,sB,qA,qB,N,K,T,c0);

dt=10;
v_bd = zeros(1,T-dt);
v_db = zeros(1,T-dt);
v_fk = zeros(1,T-dt);

c_ave_bd = zeros(1,T-dt);
c_ave_db = zeros(1,T-dt);
c_ave_fk = zeros(1,T-dt);

for(t=1:T-dt) v_bd(t)=(sum(c_bd(:,t+dt))-sum(c_bd(:,t)))./dt; c_ave_bd(t)=sum(c_bd(:,t))./K; end
for(t=1:T-dt) v_db(t)=(sum(c_db(:,t+dt))-sum(c_db(:,t)))./dt; c_ave_db(t)=sum(c_db(:,t))./K; end
for(t=1:T-dt) v_fk(t)=(sum(c_fk(:,t+dt))-sum(c_fk(:,t)))./dt; c_ave_fk(t)=sum(c_fk(:,t))./K; end

x=0:0.01:1;
v_1 = 2*sqrt(2.*sA*(1+sA)).*ones(1,length(c_ave_db(1:K:T-dt)));
v_2 = 2*sqrt(2.*sA).*ones(1,length(c_ave_db(1:K:T-dt)));
v_3 = 2*sqrt(2.*sA.*(1+sA)./(1+sA.*c_ave_bd(1:K:T-dt)).^2);

l=1:N:T-dt; 
v_bd = v_bd(1:K:T-dt); c_ave_bd = c_ave_bd(1:K:T-dt);
v_db = v_db(1:K:T-dt); c_ave_db = c_ave_db(1:K:T-dt);
v_fk = v_fk(1:K:T-dt); c_ave_fk = c_ave_fk(1:K:T-dt);


figure;
plot(c_ave_bd(1,:),K.*v_bd(1,:),'-b','DisplayName','BD num'); hold on
plot(c_ave_db(1,:),K.*v_db(1,:),'-m','DisplayName','DB num'); hold on
plot(c_ave_fk(1,:),K.*v_fk(1,:),'-r','DisplayName','FK num'); hold on
plot(c_ave_db,v_1,'-. m','DisplayName','DB analytic');
plot(c_ave_fk,v_2,'-. r','DisplayName','FK analytic');
plot(c_ave_bd,v_3,'-. b','DisplayName','BD anaytic');
axis([0 1 0 4]);
set(gca, 'FontSize',14);
xlabel('freqeuncy');
ylabel('Wave speed');
title('Selection wave speeds');
legend;

end