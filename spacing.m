function [ output ] = spacing( input )
%SPACING Summary of this function goes here
%   Detailed explanation goes here
[N , M]= size(input);
[mean_distance] = mean_d(input);
temp = 0;
for i = 1 : N
    temp = temp + (mean_distance - min_d(i, input))^2;
end
output = sqrt(temp/(N-1));
end

function [min_distance] = min_d(i, input)
    [N , M]= size(input);
    temp = [];
    for x= 1 : N
        for y= 1 : M
            if (i ~= x)
                temp(y) = abs(input(i, y) - input(x, y));                
            else
                temp(y) = Inf;
            end
        end
        distance(x) = sum(temp); %�N�Ҧ�i����x��distance��J
    end
    min_distance = min(distance);    
end

function [mean_distance] = mean_d(input) 

    [N , M]= size(input);
    temp = [];
    for x = 1 : N   %�@��x*y��distance�n�Ҽ{ �ت��O���䥭����(average)
        for y = 1 : N
            for z= 1 : M
                if (x ~= y)
                    temp(z) = abs(input(x, z) - input(y, z));                
                end
            end
            distance(N*(x-1) + y) = sum(temp); % sum�@��vector
        end
    end
    mean_distance = mean(distance);
end

