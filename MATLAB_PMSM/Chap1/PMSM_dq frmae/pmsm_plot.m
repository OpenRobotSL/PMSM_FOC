figure(1)
plot(Nr.time,Nr.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电机转速（r/min）');

figure(2)
plot(Id.time,Id.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('d轴定子电流（A）');

figure(3)
plot(Iq.time,Iq.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('q轴定子电流（A）');