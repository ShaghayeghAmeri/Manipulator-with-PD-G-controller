clc
clear
close all

%%
tstep = linspace(0, 30, 100);
q0 = [pi/4;pi/4;0;0];
[t, q] = ode45(@dynamic_sys, tstep, q0);

%%
figure(1)
subplot 211
plot(t, q(:, 1))
hold on 
plot(t, cos(t))
xlabel('time')
ylabel('teta_1')

subplot 212
plot(t, q(:, 2))
hold on 
plot(t, cos(t))
xlabel('time')
ylabel('teta_2')
