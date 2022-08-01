%% Housekeeping
clear all; clc; close all;

% Load colors and format
global c
myColors();
% Load data
load('prices')
% Periods of payment
pp = ((Q==3)&(Y>2017));

% Add missing data
P1 = [P1;NaN];
P2 = [P2;NaN];

% X axis vector
tc = 1:24;


%% Initial figures

figure; 
hold on 
plot(tc,P1,'Color',c.nvyBlue)
scatter(tc(pp),P1(pp),'MarkerEdgeColor',c.maroon,'MarkerFaceColor',c.maroon)
xlabel('Fecha')
ylabel('COP')
xticks(1:2:24)
xticklabels(date(1:2:24))
xtickangle(90)
export_fig('Figures/Price_series','-pdf','-transparent')

%% Figure two

figure; 
hold on 
plot(tc(1:10),P1(1:10),'Color',c.nvyBlue)
scatter(tc(7),P1(7),60,'MarkerEdgeColor',c.maroon,'MarkerFaceColor',c.maroon)
xlabel('Fecha')
ylabel('COP (Miles)')
xticks(1:2:10)
xticklabels(date(1:2:10))
xtickangle(90)
yticklabels(strcat('$',string(yticks()/1e3)))
export_fig('Figures/oldCalc1','-pdf','-transparent')
% Extra lines
plot([1,10],P1(1)*[1,1],':k','LineWidth',1.4)
plot([1,10],P1(6)*[1,1],':k','LineWidth',1.4)
scatter(tc([1,6]),P1([1,6]),55,'x','MarkerEdgeColor','k','LineWidth',3)
export_fig('Figures/oldCalc2','-pdf','-transparent')
plot([1,10],mean(P1(1:6))*[1,1],'--k','LineWidth',1.5)
export_fig('Figures/oldCalc3','-pdf','-transparent')


%% Figure 3

figure; 
hold on 
plot(tc(1:10),P1(1:10),'Color',c.nvyBlue)
scatter(tc(7),P1(7),60,'MarkerEdgeColor',c.maroon,'MarkerFaceColor',c.maroon)
xlabel('Fecha')
ylabel('COP (Miles)')
xticks(1:2:10)
xticklabels(date(1:2:10))
xtickangle(90)
yticklabels(strcat('$',string(yticks()/1e3)))
% Extra lines
plot([1,10],mean(P1(1:6))*[1,1],'--k','LineWidth',1.5)
plot([7.2,7.8],mean(P1(1:6))*[1,1],'Color',c.dkGreen)
plot([7.2,7.8],mean(P1(7)),'Color',c.dkGreen)
plot([7.5,7.5],[mean(P1(1:6)),mean(P1(7))],'Color',c.dkGreen)
export_fig('Figures/oldCalc4','-pdf','-transparent')

%% Figure 4

nu = diff(P1);

figure; 
hold on 
plot(tc(1:10),P1(1:10),'Color',c.nvyBlue)
scatter(tc(7),P1(7),60,'MarkerEdgeColor',c.maroon,'MarkerFaceColor',c.maroon)
xlabel('Fecha')
ylabel('COP (Miles)')
xticks(1:2:10)
xticklabels(date(1:2:10))
xtickangle(90)
yticklabels(strcat('$',string(yticks()/1e3)))
% Extra lines
plot(1:7,P1(1)+mean(nu(1:5))*(0:6),'--k','LineWidth',1.5)
export_fig('Figures/newCalc','-pdf','-transparent')

%% Figure 5 

figure; 
hold on 
plot(tc(14:24),P1(14:24),'Color',c.nvyBlue)
scatter(tc([15:4:23]),P1([15:4:23]),60,'MarkerEdgeColor',c.maroon,'MarkerFaceColor',c.maroon)
xlabel('Fecha')
ylabel('COP (Miles)')
xticks(14:2:24)
xticklabels(date(14:2:24))
xtickangle(90)
yticklabels(strcat('$',string(yticks()/1e3)))
% Extra lines
plot([14,24],mean(P1(17:22))*[1,1],'--k','LineWidth',1.5)
plot(17:23,P1(17)+mean(nu(17:21))*(0:6),'--k','LineWidth',1.5)
export_fig('Figures/newCalc2','-pdf','-transparent')


