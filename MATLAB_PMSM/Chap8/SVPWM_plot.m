figure(1)
plot(N.time,N.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('Sector');

figure(2)
plot(Van.time,Van.signals.values);
hold on
plot(Vbn.time,Vbn.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('œ‡µÁ—πVan,Vun');