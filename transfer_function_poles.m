Rload = 61;
Req = 40;
L = 1;
C = 2200*10^-6;
s = tf('s');
P = Rload/(L*Rload*C*s^2 + (Req*Rload*C + L)*s + Req + Rload)
pole(P)