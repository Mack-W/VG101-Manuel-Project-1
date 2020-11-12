%THIS IS THE MAIN SCRIPT OF THE WHOLE PROJECT

% this block initialize the animation
[n_est,n_sth,n_wst,n_nth,car_plates,p,d,g,o,r] = initiate();
figure('Name','🐎🐂🐂🐂🍺');
t = 0;
lights = trafficlights([1 0 1 0],d); 
for i=1:n_nth
    cars_nth(i)=car('n',d,p);
    cars_nth(i).position = [-d/2,10+i*cars_nth(1).length+i];
    cars_nth(i).car_plate = car_plates(i);
end
for i=1:n_sth
    cars_sth(i)=car('s',d,p);
    cars_sth(i).position = [+d/2,-10-i*cars_nth(1).length-i];
    cars_sth(i).car_plate = car_plates(i+n_nth);
end
for i=1:n_est
    cars_est(i)=car('e',d,p);
    cars_est(i).position = [10+i*cars_nth(1).length+i,+d/2];
    cars_est(i).car_plate = car_plates(i+n_nth+n_sth);
end
for i=1:n_wst
    cars_wst(i)=car('w',d,p);
    cars_wst(i).position = [-10-i*cars_nth(1).length-i,-d/2];
    cars_wst(i).car_plate = car_plates(i+n_nth+n_sth+n_est);
end

lose = 0;
stop_n = 0; stop_s = 0; stop_e = 0; stop_w = 0;

% this block starts the animation

while true
    t = t+0.1;
    clf;
    drawroads(d);
    t = round(t,1);
    cnt_n=1;cnt_s=1;cnt_e=1;cnt_w=1;
    
    % light color change
    
   if t/(2*o+r+g)==fix(t/(2*o+r+g))
        lights.permission = [1 0 1 0];
        for i = 1:n_est
            cars_est(i).ismoving = true;
        end
        for i = 1:n_wst
            cars_wst(i).ismoving = true;
        end
        lights.draw_light;
    elseif (t-g)/(2*o+r+g)==fix((t-g)/(2*o+r+g))
        lights.permission = [0 0 0 0];
        lights.draw_light;
    elseif (t-g-o)/(2*o+r+g)==fix((t-g-o)/(2*o+r+g))
        lights.permission = [0 1 0 1];
        stop_n = 0;
        for i = 1:n_nth
            cars_nth(i).ismoving = true;
        end
        for i = 1:n_sth
            cars_sth(i).ismoving = true;
        end
        lights.draw_light;
    elseif (t-g-g-o)/(2*o+r+g)==fix((t-g-g-o)/(2*o+r+g))
        lights.permission = [0 0 0 0];
        lights.draw_light;
    else
        lights.draw_light;
    end 
    
    % decide cars move or not if they reach the crossing
    
    if lights.permission(4)==1
        for i=1:n_nth
            cars_nth(i).ismoving = true;
        end
    else
        for i = 1:n_nth
            if (cars_nth(i).position(2) - cars_nth(i).length/2) <= d-0.1
                cars_nth(i).hadpassed = true;
            end
        end
        for i=1:n_nth
            if cars_nth(i).hadpassed == true
                cars_nth(i).ismoving = true;
            else
                if stop_n == 0
                    if (cars_nth(i).position(2) - cars_nth(i).length/2) > d
                        for i=i:n_nth
                            cars_nth(i).ismoving = true;
                        end
                        break
                    else
                        rand = rand(1);
                        if rand > cars_nth(i).p
                            for i = i:n_nth
                                cars_nth(i).ismoving = false;
                            end
                            stop_n = 1;
                            break
                        else
                            cars_nth(i).hadviolated = true;
                            cars_nth(i).hadpassed = true;
                            cars_nth(i).ismoving = true;
                            continue
                        end
                    end
                else
                    break
                end
            end
        end
    end
   
    if lights.permission(2)==1
        for i=1:n_sth
            cars_sth(i).ismoving = true;
        end
    else
        for i = 1:n_sth
            if (cars_sth(i).position(2) + cars_sth(i).length/2) >= -d+0.1
                cars_sth(i).hadpassed = true;
            end
        end
        for i=1:n_sth
            if cars_sth(i).hadpassed == true
                cars_sth(i).ismoving = true;
            else
                if stop_s == 0
                    if (cars_sth(i).position(2) + cars_sth(i).length/2) < -d
                        for i=i:n_sth
                            cars_sth(i).ismoving = true;
                        end
                        break
                    else
                        rand = rand(1);
                        if rand > cars_sth(i).p
                            for i = i:n_sth
                                cars_sth(i).ismoving = false;
                            end
                            stop_s = 1;
                            break
                        else
                            cars_sth(i).hadviolated = true;
                            cars_sth(i).hadpassed = true;
                            cars_sth(i).ismoving = true;
                            continue
                        end
                    end
                else
                    break
                end
            end
        end
    end
    
    if lights.permission(1)==1
        for i=1:n_est
            cars_est(i).ismoving = true;
        end
    else
        for i = 1:n_est
            if (cars_est(i).position(1) - cars_est(i).length/2) <= d-0.1
                cars_est(i).hadpassed = true;
            end
        end
        for i=1:n_est
            if cars_est(i).hadpassed == true
                cars_est(i).ismoving = true;
            else
                if stop_e == 0
                    if (cars_est(i).position(1) - cars_est(i).length/2) > d
                        for i=i:n_est
                            cars_est(i).ismoving = true;
                        end
                        break
                    else
                        rand = rand(1);
                        if rand > cars_est(i).p
                            for i = i:n_est
                                cars_est(i).ismoving = false;
                            end
                            stop_e = 1;
                            break
                        else
                            cars_est(i).hadviolated = true;
                            cars_est(i).hadpassed = true;
                            cars_est(i).ismoving = true;
                            continue
                        end
                    end
                else
                    break
                end
            end
        end
    end
    
    if lights.permission(3)==1
        for i=1:n_wst
            cars_wst(i).ismoving = true;
        end
    else
        for i = 1:n_wst
            if (cars_wst(i).position(1) + cars_wst(i).length/2) >= -d+0.1
                cars_wst(i).hadpassed = true;
            end
        end
        for i=1:n_wst
            if cars_wst(i).hadpassed == true
                cars_wst(i).ismoving = true;
            else
                if stop_w == 0
                    if (cars_wst(i).position(1) + cars_wst(i).length/2) < -d
                        for i=i:n_wst
                            cars_wst(i).ismoving = true;
                        end
                        break
                    else
                        rand = rand(1);
                        if rand > cars_wst(i).p
                            for i = i:n_wst
                                cars_wst(i).ismoving = false;
                            end
                            stop_w = 1;
                            break
                        else
                            cars_wst(i).hadviolated = true;
                            cars_wst(i).hadpassed = true;
                            cars_wst(i).ismoving = true;
                            continue
                        end
                    end
                else
                    break
                end
            end
        end
    end
    
  % set new position for every car
    
    for i = 1:n_nth
        if cars_nth(i).ismoving==false
            continue
        else
            cars_nth(i).position(2)=cars_nth(i).position(2)-0.1;
        end
    end
    
    for i = 1:n_sth
        if cars_sth(i).ismoving==false
            continue
        else
            cars_sth(i).position(2)=cars_sth(i).position(2)+0.1;
        end
    end
    
    for i = 1:n_est
        if cars_est(i).ismoving==false
            continue
        else
            cars_est(i).position(1)=cars_est(i).position(1)-0.1;
        end
    end
    
    for i = 1:n_wst
        if cars_wst(i).ismoving==false
            continue
        else
            cars_wst(i).position(1)=cars_wst(i).position(1)+0.1;
        end
    end
    
    % draw every car
    
    for i=1:n_nth
        cars_nth(i).draw_car();
    end
    for i=1:n_sth
        cars_sth(i).draw_car();
    end
    for i=1:n_est
        cars_est(i).draw_car();
    end
    for i=1:n_wst
        cars_wst(i).draw_car();
    end
    
    %detect if there are any traffic rule violations
    
    for i=1:n_nth
        brk = 0;
        for j=1:n_sth
            if rectint([cars_nth(i).position(1)-cars_nth(i).width/2,cars_nth(i).position(2)-cars_nth(i).length/2,cars_nth(i).width,cars_nth(i).length],[cars_sth(j).position(1)-cars_sth(j).width/2,cars_sth(j).position(2)-cars_sth(j).length/2,cars_sth(j).width,cars_sth(j).length])~=0
                lose = 1;brk=1;
                break
            end
        end
        if brk==1
            break
        end
        for k = 1:n_est
            if rectint([cars_nth(i).position(1)-cars_nth(i).width/2,cars_nth(i).position(2)-cars_nth(i).length/2,cars_nth(i).width,cars_nth(i).length],[cars_est(k).position(1)-cars_est(k).length/2,cars_est(k).position(2)-cars_est(k).width/2,cars_est(k).length,cars_est(k).width])~=0
                lose = 1;brk=1;
                break
            end
        end
        if brk==1
            break
        end
        for l=1:n_wst
            if rectint([cars_nth(i).position(1)-cars_nth(i).width/2,cars_nth(i).position(2)-cars_nth(i).length/2,cars_nth(i).width,cars_nth(i).length],[cars_wst(l).position(1)-cars_wst(l).length/2,cars_wst(l).position(2)-cars_wst(l).width/2,cars_wst(l).length,cars_wst(l).width])~=0
                lose = 1;brk=1;
                break
            end
        end
        if brk==1
            break
        end
    end
    if lose==1
        close '🐎🐂🐂🐂🍺';
        break
    end
    
    for i=1:n_sth
        brk = 0;
        for k = 1:n_est
            if rectint([cars_sth(i).position(1)-cars_sth(i).width/2,cars_sth(i).position(2)-cars_sth(i).length/2,cars_sth(i).width,cars_sth(i).length],[cars_est(k).position(1)-cars_est(k).length/2,cars_est(k).position(2)-cars_est(k).width/2,cars_est(k).length,cars_est(k).width])~=0
                lose = 1;brk=1;
                break
            end
        end
        if brk==1
            break
        end
        for l=1:n_wst
            if rectint([cars_sth(i).position(1)-cars_sth(i).width/2,cars_sth(i).position(2)-cars_sth(i).length/2,cars_sth(i).width,cars_sth(i).length],[cars_wst(l).position(1)-cars_wst(l).length/2,cars_wst(l).position(2)-cars_wst(l).width/2,cars_wst(l).length,cars_wst(l).width])~=0
                lose = 1;brk=1;
                break
            end
        end
        if brk==1
            break
        end
    end
    if lose==1
        close '🐎🐂🐂🐂🍺';
        break
    end
    
    for k=1:n_est
        brk = 0;
        for l=1:n_wst
            if rectint([cars_est(k).position(1)-cars_est(k).length/2,cars_est(k).position(2)-cars_est(k).width/2,cars_est(k).length,cars_est(k).width],[cars_wst(l).position(1)-cars_wst(l).length/2,cars_wst(l).position(2)-cars_wst(l).width/2,cars_wst(l).length,cars_wst(l).width])~=0
                lose =1;brk=1;
            end
        end
        if brk == 1
            break
        end
    end
    if lose==1
        close '🐎🐂🐂🐂🍺';
        break
    end
    
    % if all cars pass without accidents, you win
    
    if (cars_nth(n_nth).position(2) + cars_nth(n_nth).length/2) < -10 ...
            && (cars_sth(n_sth).position(2) + cars_sth(n_sth).length/2) > 10 ...
            && (cars_est(n_est).position(1) - cars_est(n_est).length/2) < -10 ...
            && (cars_wst(n_wst).position(1) + cars_wst(n_wst).length/2) > 10
        close '🐎🐂🐂🐂🍺';
        break
    end
    
    % this loop executes every 0.1 seconds
    pause(0.1);
    
end

% display an message indicating you win or not
if lose==0
    disp(' ');
    disp('You win!');
else
    N=[];
    for i=1:n_nth
        if cars_nth(i).hadviolated == true
            N = [N,cars_nth(i).car_plate];
        end
    end
    for i=1:n_sth
        if cars_sth(i).hadviolated == true
            N = [N,cars_sth(i).car_plate];
        end
    end
    for i=1:n_est
        if cars_est(i).hadviolated == true
            N = [N,cars_est(i).car_plate];
        end
    end
    for i=1:n_wst
        if cars_wst(i).hadviolated == true
            N = [N,cars_wst(i).car_plate];
        end
    end
    disp(' ');
    disp('You lose!');
    if isequal(N,[])
        disp('However, no car had violated traffic rules.')
    else 
        disp('Cars that had jumped the red lights:')
        disp(N);
    end
end