classdef car<handle
    % This class contains all variables and functions used to describe a
    % car and plot it.
    properties 
        direction
        length
        width
        car_plate
        position
        p
        ismoving = true
        hadviolated = false
        hadpassed = false
    end
    methods
        function obj = car(str,d,p)
            if nargin==3
                    obj.direction = str;
                    obj.length = 1.618*4*d/3;
                    obj.width = 2*d/3;
                    obj.p = p;
            end
        end
        
        function draw_car(obj)
            hold on;
            xlim([-10 10]),ylim([-10,10]);
            if obj.direction == 'w' | obj.direction == 'e' 
                if obj.direction == 'w'
                   rectangle('Position',[obj.position(1)-obj.length/2,obj.position(2)-obj.width/2,obj.length,obj.width],'FaceColor','r');hold on;
                else
                   rectangle('Position',[obj.position(1)-obj.length/2,obj.position(2)-obj.width/2,obj.length,obj.width],'FaceColor','b');hold on;
                end
            else
                if obj.direction == 'n'
                   rectangle('Position',[obj.position(1)-obj.width/2,obj.position(2)-obj.length/2,obj.width,obj.length],'FaceColor','g');hold on;
                else
                   rectangle('Position',[obj.position(1)-obj.width/2,obj.position(2)-obj.length/2,obj.width,obj.length],'FaceColor','c');hold on;
                end
            end
         end
    end   
end

