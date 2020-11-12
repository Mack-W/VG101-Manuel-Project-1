function [n_est,n_sth,n_wst,n_nth,car_plates,p,d,g,o,r] = initiate()
% this func() prompts the user to decide the width of the road, how long
% will each colors of the traffic lignth be on, and the total number of
% cars, as well as their possibility of jumping the red lights.

n = input('Enter the number of cars:');
p = input('Enter the probability of a car jumping the red light. 0 stands for no way and 1 stands for 100%:');
w = input('Enter the width of the road:');
g = input('Enter how long will the green and the red light be on:');
o = input('Enter how long will the orange light be on:');
r = g; d = w/2;

% decide the number of cars on each direction
[n_est,n_wst,n_sth,n_nth] = func(n); 

% generate a string type array that stores the car plate of each car
% OBSOLETE CODE (FOR BACKUP USE)
% car_plate = []; i=1;
% while i<=n
    % car_plate = [car_plate,generate_car_plate_recursively()];
    % i=i+1;
% end
% NEW CODE
car_plates = generate_car_plate_recursively(n);
return
end

function car_plates = generate_car_plate_recursively(n)
% this function use a recursive method to generate a random car plate. 
% the format is one capitalized letter followed by a 5-character mix 
% of capitalized letters or digits.
% OBSOLETE CODE (FOR BACKUP USE)
% N=[randi([65 90],1,1),32]; i=2;
 % while i<=6
    % j = randi([1 34],1,1);
    % if j<11
        % N=[N,randi([48 57],1,1)];
    % else
        % N=[N,randi([65 90],1,1)];
    % end
    % i=i+1; clear j;
 % end
 % car_plate = string(char(N));
 % return
 % NEW CODE (RECURSIVE)
 i = 5;
 if n==1
     car_plates = [];
     car_plates = [string(single_car_plate(i)),car_plates];
     return
 else
     n = n - 1;
     car_plates = [string(single_car_plate(i)),generate_car_plate_recursively(n)];
 end
end

function car_plate = single_car_plate(i)
 n = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
 car_plate = [n(randi([1 26],1,1))];
 if i==1
     car_plate = [car_plate,n(randi([1 36],1,1))];
 elseif i==5
     i = i - 1;
     car_plate = [car_plate,' ',single_car_plate(i)];
 else
     i = i - 1;
     car_plate = [car_plate,single_car_plate(i)];
 end
end

function [n_est,n_wst,n_sth,n_nth] = func(n)
n_est = randi([1 n-3],1,1);
n_sth = randi([1 n-n_est-2],1,1);
n_wst = randi([1 n-n_sth-n_est-1],1,1);
n_nth = randi([1 n-n_sth-n_est-n_wst],1,1);
end
