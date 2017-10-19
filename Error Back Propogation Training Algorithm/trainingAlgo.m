%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                PSEUDO CODE FOR BACK PROPOGRATION TRAINING ALGORITHM
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initialize network weights (often small random values)
%  do
%     forEach training example named ex
%        prediction = neural-net-output(network, ex)  // forward pass
%        actual = teacher-output(ex)
%        compute error (prediction - actual) at the output units
%        compute {\displaystyle \Delta w_{h}} \Delta w_h for all weights from hidden layer to output layer  // backward pass
%        compute {\displaystyle \Delta w_{i}} \Delta w_i for all weights from input layer to hidden layer   // backward pass continued
%        update network weights // input layer not modified by error estimate
%  until all examples classified correctly or another stopping criterion satisfied
%  return the network
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%












clear all;clc;trai_pairs=210;out_neurons=3;hid_neurons=6;in_nodes=3;
eata=0.25;emax=0.001;q=1;e=0;lamda=1;  t=1;
tic
load feature.mat result

%sample features (13 coefficients MFCC Features)
%zzz=[7.977	1.386	0.584	1.769	1.918	2.17	1.46	0.525	1.721	1.496	0.88	0.177	0.205;
%9.738	0.029	0.026	0.082	0.065	0.019	0.09	0.077	1.545	0.058	0.049	0.006	0.009;
%12.745	0.074	0.134	0.257	0.075	0.231	0.284	0.019	0.227	0.183	0.021	0.101	0.031;
%];


 zzz = [ 1 1 1 ;]
  for i=1:3:210
    zzz(i,:)=ceil(randn)*2;
    i=i+1;
    zzz(i,:)=ceil(rand)*3;
    i=i+1;
    zzz(i,:)=ceil(rand)*10;
end


tt=max(max(zzz));Z=zzz/tt;
d1=[1 0 0  ];
d2=[0 1 0 ];
d3=[0 0 1 ];
d4=[0 0 1];
%d4=[-1 -1 -1 1 -1 ];
%d5=[-1 -1 -1 -1 1 ];
% d6=[-1 -1 -1 -1 -1 1 -1 -1 -1 -1 ];
% d7=[-1 -1 -1 -1 -1 -1 1 -1 -1 -1 ];
% d8=[-1 -1 -1 -1 -1 -1 -1 1 -1 -1 ];
% d9=[-1 -1 -1 -1 -1 -1 -1 -1 1 -1 ];
% d10=[-1 -1 -1 -1 -1 -1 -1 -1 -1 1 ];
% d11=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
% d12=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1];
% d13=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1];
% d14=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1];
% d15=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1];
% d16=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1];
% d17=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1];
% d18=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1];
% d19=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1];
% d20=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];
 Dm=[d1;d2;d3];
 D=Dm;
% ;d11;d12;d13;d14;d15;d16;d17;d18;d19;d20];
%D=Xlsread('C:\Users\Admin\Desktop\d.xlsx');

%step 1 initialisation of weight matrices

W=randn(out_neurons,hid_neurons);
V=randn(hid_neurons,in_nodes);
for main_loop=1:300000000

% step 2 training step starts here compute layer responses

for p=1:trai_pairs
    z=transpose(Z(p,:));
    
  d=transpose(D(p,:));

   %calculate output of hidden and output layer

   y=(tansig(V*(z)));
   o=(tansig(W*(y))); 

% step 3 Error value is computed

        e=0.5*norm(d-o)^2+e;

% step 4 error signal vectors of both layers are computed
                 
                 % error signal vector for output layer
              
                 for k=1:out_neurons
                       delta_ok(k,:)=0.5*(d(k)-o(k))*(1-o(k)^2);
          end

                 %error signal vector for hidden layer

                 for j=1:hid_neurons
                        sum=0;
                 for k=1:out_neurons
                 sum=sum+delta_ok(k)*W(k,j);
                 end
                 delta_yj(j,:)=0.5*(1-y(j)^2)*sum;
          end

% step 5 Adjust weights of output and hidden layer

     W=W+eata*delta_ok*transpose(y);
     V=V+eata*delta_yj*transpose(z);
     q=q+1;                           % update step counter
 end

% step 6 training cycle is completed

fprintf('error=%f no of epcohes = %d \n',e,main_loop);
            if e>=emax
               e=0;
            else
               save backp20_2.mat W V Z;
                   break;
            end
                  
end 
save backp.mat W V Z;
V
Z
W
toc