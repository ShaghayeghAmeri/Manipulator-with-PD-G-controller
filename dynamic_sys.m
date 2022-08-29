function qd = dynamic_sys(t, q)
q1 = q(1);  % teta_1
q2 = q(2);  % teta_2
q3 = q(3);  % teta_dot_1
q4 = q(4);  % teta_dot_2

qq=[q1;q2];
qqdot=[q3;q4];


% path design

q1d=cos(t);
q2d=cos(t);
qdesired=[q1d;q2d];

q1dot=-sin(t);
q2dot=-sin(t);
qdotdesired=[q1dot;q2dot];

qe=qdesired-qq;
qdote=qdotdesired-qqdot;


m1 = 2;
m2 = 1;
l1 = 1;
l2 = 0.5;
i1 = 0.01;
i2 = 0.005;
d = 2;
g = 9.81;

ta1 = 0-q3*d;
ta2 = 0-q4*d;

M=[m1*(l1/2)^2+m2*(l1^2+(l2/2)^2)+m2*l1*l2*cos(q2)+i1+i2 m2*(l2/2)^2+(1/2)*m2*l1*l2*cos(q2)+i2; m2*(l2/2)^2+(1/2)*m2*l1*l2*cos(q2)+i2 m2*(l2/2)^2+i2];
V=[(-1*m2*l1*l2*sin(q2)*q3*q4)-((1/2)*m2*l1*l2*sin(q2)*q4^2) ; -1*(1/2)*m2*l2*l1*sin(q2)*q3*q4];
G=[((m1*(l1/2)+m2*l1)*g*cos(q1)+m2*g*l2*(1/2)*cos(q1+q2)) ; m2*g*l2*0.5*cos(q1+q2)];

kp=20*eye(2);
kd=20*eye(2);

Q=G+kp*qe+kd*qdote;

qdot_1=q3;
qdot_2=q4;
qdot=inv(M)*(Q-V-G);
qd =[qdot_1;qdot_2;qdot(1,:);qdot(2,:)];