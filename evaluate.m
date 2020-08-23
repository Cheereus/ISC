%clc;
%clear all;
load cell_515_type.mat;
load kk.mat;
val=purity(3, kk, cell_515_type);
[AR,RI,MI,HI]=RandIndex(kk,cell_515_type);
score = Cal_NMI(cell_515_type, kk);
[val,AR,RI,MI,HI,score]