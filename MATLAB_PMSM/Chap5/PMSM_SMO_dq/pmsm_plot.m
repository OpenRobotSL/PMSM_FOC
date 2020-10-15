figure(1)
plot(wm.time,wm.signals.values);
grid on
xlabel('Times(s)');
ylabel('电机转速估计值与实际值(r/min)');

figure(2)
plot(wm1.time,wm1.signals.values);
grid on
xlabel('Times(s)');
ylabel('电机转速估计误差(r/min)');

figure(3)
plot(The.time,The.signals.values);
grid on
xlabel('Times(s)');
ylabel('电机转子位置估计值与实际值(rad)');

figure(4)
plot(The1.time,The1.signals.values);
grid on
xlabel('Times(s)');
ylabel('电机转子位置估计误差(rad)');

figure(5)
plot(Ed.time,Ed.signals.values,Eq.time,Eq.signals.values);
grid on
xlabel('Times(s)');
ylabel('反电感应动势Ed,Eq的估计值(V)');