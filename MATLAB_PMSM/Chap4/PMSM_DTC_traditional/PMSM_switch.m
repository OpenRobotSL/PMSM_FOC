function [sys,x0,str,ts] = PMSM_switch(t,x,u,flag)

% The following outlines the general structure of an S-function.
%
switch flag, %判断flag，看当前处于哪个状态

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
sizes = simsizes;%用于设置参数的结构体用simsizes来生成

sizes.NumContStates  = 0;%连续状态变量的个数
sizes.NumDiscStates  = 0; %离散状态变量的个数
sizes.NumOutputs     = 1; %输出变量的个数 
sizes.NumInputs      = 3; %输入变量的个数
sizes.DirFeedthrough = 1; %是否存在反馈
sizes.NumSampleTimes = 1; %采样时间个数，至少是一个

sys = simsizes(sizes);%设置完后赋给sys输出
x0  = [];%状态变量设置为空，表示没有状态变量
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
 %%根据文章的表格计算得到
V_Table=[2 4 6 1 3 5;4 1 5 2 6 3;3 6 2 5 1 4 ;5 3 1 6 4 2];
x=2*u(1)+u(2)+1;
sys=V_Table(x,u(3));

% end mdlOutputs
