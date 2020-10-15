figure(1)
plot(Nr.time,Nr.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电机转速Nr(r/min)');

figure(2)
plot(Te.time,Te.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电磁转矩Te(N.m)');

figure(3)
plot(Iabc.time,Iabc.signals.values);
grid on
xlabel('Times(s)');
ylabel('三相电流Iabc(A)');