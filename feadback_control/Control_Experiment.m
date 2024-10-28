%% PathFollowing of Car-like Robot
% Moving to a point controller - proportional controller
% Peter Corke

clc;
clear all;
close all;


%% System Parameters

K_v = 200; % Porportional constant on velocity action
K_i = 10;  % Integral
% constant on velocity action
K_h = 20; % Proportional constant on angle action


%% Instantiate client object to run Motive API commands
% https://optitrack.com/software/natnet-sdk/

% Create Motive client object
dllPath = fullfile('d:','StDroneControl','NatNetSDK','lib','x64','NatNetML.dll');
assemblyInfo = NET.addAssembly(dllPath); % Add API function calls
theClient = NatNetML.NatNetClientML(0);

% Create connection to localhost, data is now being streamed through client object
HostIP = '127.0.0.1';
theClient.Initialize(HostIP, HostIP); 

Drone_ID = 1; % Rigid body ID of the drone from Motive
Des_ID = 2; % Rigid body ID of the destination point from Motive
udp = udpport;
%udp = udpport("EnablePortSharing",true); % intializing udp protocol
%udp.EnableBroadcast(true);
step = 0; % Iteration loop count

error=0; 

while(step <= 2500)
    
    % Retreving current position of drone
    [DronePos] = GetDronePosition(theClient, Drone_ID);
    [DesPos] = GetDronePosition(theClient, Des_ID);


    x = DronePos(2); % Taking x point of the drone
    y = DronePos(3); % Taking y point of the drone
    
    x_des = DesPos(2); % Taking x point of destination point
    y_des = DesPos(3); % Taking y point of destination point 
    currAngle = DronePos(7); % Taking current yaw angle of drone
    

    % Velocity
    error=error+sqrt((x_des - x)^2 + (y_des - y)^2);
    vel = K_v * sqrt((x_des - x)^2 + (y_des - y)^2)+0*K_i*error;

    % Vehicle-relative angle
    angleDes = -atan2((y_des-y),(x_des-x));

    % Angle Proportional controller
     steeringAngle = K_h*angdiff(angleDes, currAngle);

    %disp(angleDes)
    disp(x_des)
    disp(y_des)
    %disp(steeringAngle)
    x_desv(step+1)=x_des;%currAngle;
    y_desv(step+1)=y_des;%vel;
    xv(step+1)=x;%currAngle;
    yv(step+1)=y;%vel;
    velv(step+1) = vel;
    angleDesv(step+1)=angleDes;%steeringAngle;
    steeringAnglev(step+1)=steeringAngle;
    degsav(step+1)=round(steeringAngle*180/pi)+40;
    currAnglev(step+1) = currAngle;

    disp("--------")
    % Steering Angle is expected in [0, 80] where 40 is no steering
    write(udp, [round(steeringAngle*180/pi)+40,vel], 'uint8', '192.168.2.101', 11111);

    pause(0.05)
    step = step + 1;

    % Ending statement

    if sqrt((x_des - x)^2 + (y_des - y)^2) <= 0.1
        break
    end    

end

    write(udp, [40,0], 'uint8', '192.168.2.101', 11111);

%% Plotting Graphs

% X axis for all plots are loop iterations

figure()
subplot 121;
plot(xv);
title("X-Pos of Car");

subplot 122;
plot(yv)
title("Y-Pos of Car");
%----------------------
figure()
subplot 121;
plot(x_desv);
title("X-Pos of Objective");

subplot 122;
plot(y_desv)
title("Y-Pos of Objective");
%----------------------
figure()
plot(velv);
title("Velocity of Car");
%----------------------
figure()
subplot 121;
plot(currAnglev);
title("Angle of Direction for Car")

subplot 122;
plot(angleDesv);
title("Desired Angle of Direction for Car")
%----------------------
figure()
plot(steeringAnglev);
title("Steering Wheel Angle")