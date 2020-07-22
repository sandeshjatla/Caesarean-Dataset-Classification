clc;
clear all;
close all;
load maindata.txt;
colage = maindata(:,1);
coldelno = maindata(:,2);
coldeltime = maindata(:,3);
coldelBP = maindata(:,4);
coldelhearprob = maindata(:,5);
colyn = maindata(:,6);
n = 80;
for i=1:80
    for j=1:6
    rowsdata(i,j) = maindata(i,j) ;  
    end
end
t1 = 1;
t2 = 1;
for i=1:80
        if maindata(i,6)==1
            for j=1:5
                class1data(t1,j) = rowsdata(i,j);
            end
            t1 = t1 + 1;
        end    
        if maindata(i,6)==0
            for j=1:5
                class2data(t2,j) = rowsdata(i,j);
            end
            t2 = t2 + 1;
        end
end

t1 = t1 - 1;
t2 = t2 - 1;
Z1(1:1:length(class1data(:,1)),:)=class1data;
Z1(length(class1data(:,1))+1:1:80,:)=class2data;
TargetVector1(1:1:length(class1data(:,1)))=1;
TargetVector1(length(class1data(:,1)):1:80)=-1;
a1 = ones(46,1)*[1,0];
a2 = ones(34,1)*[0,1];
targ=[a1;a2];
z = [Z1,TargetVector1(:)];
for run=1:5
    Z1=[Z1;Z1];
    targ=[targ;targ];
end