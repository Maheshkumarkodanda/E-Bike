% This script will configure and run the simulation.

disp( '#######################' );

%% first simulation run
% update model parameters for basic version of bike
disp( 'Updating model parameters for basic version of Bike.' );

M_Driver = 70;
disp( 'M_Driver - Mass of the driver is 70 kilograms.' );
M_Bike = 25;
disp( 'M_Bike - Mass of the Bike is 25 kilograms.' ); 
g = 9.8;
disp( 'g - gravity is 9.8m/s^2.' );
P = 1.225;
disp( 'P - density of air is 1.225 kg/m^3.' );
Cw = 1.1;
disp( 'Cw - air drag coefficient constant is 1.1.' );
Cr = 0.006;
disp( 'Cr - rolling friction coefficient is 0.006.' );
A = 0.5;
disp( 'A - frontal area of driver and bike is 0.5 m^2.' );

% run simulation
% compute statistics from simulation result

[x] = sim('ebike2k8b');
[sim1] = x.get('simout1').signals.values;
graph1 = [sim1]
time = graph1(:,5);
akku_rcc = graph1(:,1);
figure
subplot(4,1,1);
plot(time,akku_rcc);
xlabel( 'time' )
ylabel( 'akku_rcc' );

time = graph1(:,5);
supplied_energy = graph1(:,2);
subplot(4,1,2);
plot(time,supplied_energy);
xlabel( 'time' );
ylabel( 'supplied_energy' );

time = graph1(:,5);
driver_energy = graph1(:,3);
subplot(4,1,3);
plot(time,driver_energy);
xlabel( 'time' );
ylabel( 'driver_energy' );

time = graph1(:,5);
total_energy = graph1(:,4);
subplot(4,1,4);
plot(time,total_energy);
xlabel( 'time' );
ylabel( 'total_energy' );
    
disp( '#######################' );
disp( '#######################' );
%% second simulation run
% update model parameters for sports version of bike

disp( 'Updating model parameters of Sports version of Bike.' );

M_Driver = 60;
disp( 'M_Driver - Mass of the driver is 60 kilograms.' );
M_Bike = 20;
disp( 'M_Bike - Mass of the Bike is 20 kilograms.' );
g = 9.8;
disp( 'g - gravity is 9.8m/s^2.' );
P = 1.225;
disp( 'P - density of air is 1.225 kg/m^3.' );
Cw = 0.4;
disp( 'Cw - air drag coefficient constant is 0.4.' );
Cr = 0.003;
disp( 'Cr - rolling friction coefficient is 0.003.' );
A = 0.38;
disp( 'A - frontal area of driver and bike is 0.38 m^2.' );

% run simulation
% compute statistics from simulation result

[w] = sim('ebike');
[sim2] = w.get('simout2').signals.values;
graph2 = [sim2]
time = graph2(:,5);
akku_rcc2 = graph2(:,1);
figure
subplot(4,1,1);
plot(time,akku_rcc2);
xlabel( 'time' )
ylabel( 'akku_rcc2' );

time = graph2(:,5);
support_energy2 = graph2(:,2);
subplot(4,1,2);
plot(time,support_energy2);
xlabel( 'time' );
ylabel( 'support_energy2' );

time = graph1(:,5);
driver_energy2 = graph1(:,3);
subplot(4,1,3);
plot(time,driver_energy2);
xlabel( 'time' );
ylabel( 'driver_energy2' );

time = graph1(:,5);
total_energy2 = graph1(:,4);
subplot(4,1,4);
plot(time,total_energy2);
xlabel( 'time' );
ylabel( 'total_energy2' );
   
%% further simulation runs
% ...

%Calculating Battery status
[z] = sim('ebike');
[sim3] = z.get('simout').signals.values;
battery_status = [sim3]
if battery_status == 0
    display('battery is empty');
else
    display('batter is not empty');
end

%% clean up workspace
disp( 'Cleaning up Workspace.' );
% clear parameters

% clear simulation output

disp( 'Done.' );
disp( '#######################' );