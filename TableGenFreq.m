clc
for c = 0:430
    X = ['(',num2str(55834575),'),'];
    disp(X)
end
for c = 0:2770
    Increment = round(2^32*(663E3-22000*c/2400)/50E6);
    X = ['(',num2str(Increment),'),'];
    disp(X)
end
for c = 3202:4095
    X = ['(',num2str(55834575),'),'];
    disp(X)
end