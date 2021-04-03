clc;
close all;
clear all; 

Results = readmatrix('Results.csv');
Results = Results(1:end,2)

standard_curve_quant = readmatrix('Standard curve.csv')
standard_curve_quant = standard_curve_quant(1:end,2)

standard_curve_mol = [10 20 40 80]

scatter(standard_curve_mol,standard_curve_quant);
xlabel('Moles [pM]')
ylabel('Intensity')
range= 0:0.1:200;
fit = (130.7.*range) -305.1;

experimental = (Results + 305.1)./130.7;

hold on
plot(range,fit)
scatter(experimental,Results,'*','k')
plot([0:0.1:200],Results(1))
plot([0:0.1:200],Results(2))
% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =       130.7  (106.7, 154.7)
%        p2 =      -305.1  (-1413, 802.7)
% 
% Goodness of fit:
%   SSE: 1.794e+05
%   R-square: 0.9964
%   Adjusted R-square: 0.9945
%   RMSE: 299.5
hold off


figure (2)
hold on
pmol_per_enzyme =[7.292  252.07475 328.612 411.799]
time = [0  20 30 40]
range2 = 0:0.1:40;
scatter(time,pmol_per_enzyme,'x','k')
fit2 = 10.14*range2 + 21.68;
plot(range2,fit2);
ylabel('Substrate cleaved per enzyme [Pico-mole]')
xlabel('Time [Minutes]')
% legend('Data','Fit')
xlim([0 40.5])
hold off
%    f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =       10.14  (6.559, 13.73)
%        p2 =       21.68  (-74.87, 118.2)
% 
% Goodness of fit:
%   SSE: 1216
%   R-square: 0.9867
%   Adjusted R-square: 0.98
%   RMSE: 24.65
