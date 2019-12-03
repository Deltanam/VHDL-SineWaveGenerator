clc
for c = 0:429
    X = ['("','1111111111','"),'];
    disp(X)
end
for c = 0:2732
    Increment = de2bi(round(0+c*1024/2800),10);
    Increment= num2str(Increment);
    Increment(Increment == ' ') = [];
    X = ['("',Increment,'"),'];
    disp(X)
end
for c = 3163:4095
    X = ['("','1111111111','"),'];
    disp(X)
end