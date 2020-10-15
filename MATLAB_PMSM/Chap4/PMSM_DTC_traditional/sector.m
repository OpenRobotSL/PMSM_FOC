function [sys,x0,str,ts] = sector(t,x,u,flag)

% The following outlines the general structure of an S-function.
%
switch flag,   %判断flag，看当前处于哪个状态

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
  [sys,x0,str,ts]=mdlInitializeSizes; 
  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);
  case {2,4,9},
    sys=[];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end

% end sfuntmpl

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes

%
% call simsizes for a sizes structure, fill it in and convert it to a
% sizes array.
%
% Note that in this example, the values are hard coded.  This is not a
% recommended practice as the characteristics of the block are typically
% defined by the S-function parameters.
%
sizes = simsizes; %用于设置参数的结构体用simsizes来生成

sizes.NumContStates  = 0; %连续状态变量的个数
sizes.NumDiscStates  = 0; %离散状态变量的个数
sizes.NumOutputs     = 1; %输出变量的个数
sizes.NumInputs      = 2; %输入变量的个数
sizes.DirFeedthrough = 1; %是否存在反馈
sizes.NumSampleTimes = 1; %采样时间个数，至少是一个

sys = simsizes(sizes); %设置完后赋给sys输出
x0  = [];  %状态变量设置为空，表示没有状态变量
str = [];
ts  = [-1 0]; %采样周期设为0表示是连续系统，-1表示采用当前的采样时间

% end mdlInitializeSizes

%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)
if(u(1)==0) 
    N=1;    %如果输入值为0，电压参考量在第一扇区
else
    a1=u(1); 
    b1=u(1)*(-0.5)+(sqrt(3)/2)*u(2); %%根据文章的计算公式得到
    c1=u(1)*(-0.5)-(sqrt(3)/2)*u(2);
    if a1>0
        a=0;
    else
        a=1;
    end
    if b1>0
        b=0;
    else
        b=1;
    end
    if c1>0
        c=0;
    else
        c=1;
    end
    N=4*a+2*b+c; %扇区计算
end
    sys=N;

% end mdlOutputs
