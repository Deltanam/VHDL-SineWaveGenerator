clc
for c = 0:429
    X = ['(',num2str(55834575),'),'];
    disp(X)
end
for c = 0:2732
    Increment = round(2^32*(640E3+21500*c/2733)/50E6);
    X = ['(',num2str(Increment),'),'];
    disp(X)
end
for c = 3163:4095
    X = ['(',num2str(55834575),'),'];
    disp(X)
end