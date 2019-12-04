clc
for c = 0:430
    X = ['(',num2str(4095),'),'];
    disp(X)
end
for c = 0:2770
    Increment = round(c*4096/2600-269);
    if(Increment<0)
        Increment = 0;
    end
    X = ['(',num2str(Increment),'),'];
    disp(X)
end
for c = 3202:4095
    X = ['(',num2str(4095),'),'];
    disp(X)
end