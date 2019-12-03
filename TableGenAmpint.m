clc
for c = 0:456
    X = ['(',num2str(4095),'),'];
    disp(X)
end
for c = 0:2500
    Increment = round(4095-c*4096/2475);
    if(Increment<0)
        Increment = 0;
    end
    X = ['(',num2str(Increment),'),'];
    disp(X)
end
for c = 2958:4095
    X = ['(',num2str(4095),'),'];
    disp(X)
end