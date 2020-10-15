figure(1)
plot(wm.time,wm.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电机机械角速度wm(rad/s)');

figure(2)
plot(Te.time,Te.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电磁转矩Te(N.m)');

figure(3)
plot(idq.time,idq.signals.values);
grid on
xlabel('Times(s)');
ylabel('定子电流idq(A)');

figure(4)
plot(ixy.time,ixy.signals.values);
grid on
xlabel('Times(s)');
ylabel('定子电流ixy(A)');

figure(5)
plot(iau.time,iau.signals.values);
grid on
xlabel('Times(s)');
ylabel('相电流iau(A)');