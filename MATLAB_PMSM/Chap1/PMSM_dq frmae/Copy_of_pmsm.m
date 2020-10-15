function[sys,x0]=pmsm(t,x,u,flag,Pn,Ld,Lq,R,Phi,J,B)
%==============参数说明============
%Pn,Ld,Lq,R,Phi,J,B分别为电机参数
%x(1),x(2),x(3)分别对应系统的三个状态变量id，iq和wm
%u(1),u(2),u(3)分别对应ud,uq和TL
%==========主函数pmsm说明==========
switch flag
    case 0                %调用初始化函数
        sys=[3;0;3;3;0;0];%定义输入输出的个数，系统状态变量个数以及其他参数
        x0=[0;0;0];       %系统的初始状态
    case 1                %定义连续系统的状态
        sys(1)=(1/Ld)*u(1)-(R/Ld)*x(1)+(Lq/Ld)*Pn*x(2)*x(3);
                          %对应微分方程（1-27）
        sys(2)=(1/Lq)*u(2)-(R/Lq)*x(2)-(Ld/Lq)*Pn*x(3)*x(2)-(Phi*Pn/Lq)*x(3);
                          %对应微分方程（1-27）
        sys(3)=(1/J)*(1.5*Pn*(Phi*x(2)+(Ld-Lq)*x(2)*x(3))-B*x(3)-u(3));
                          %对应微分方程（1-28）
        %sys(4)=x(3);      %theta          
    case 3                %设定系统输出 
        sys(1)=x(1);      
        sys(2)=x(2);
        sys(3)=x(3);
       %sys(4)=x(4);       %theta 
    case {2,4,9}           %其他的flag未用到
        sys=[];
end
