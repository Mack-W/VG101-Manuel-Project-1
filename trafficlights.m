classdef trafficlights < handle
    properties
        permission
        d
    end
    
    methods
        function obj = trafficlights(array,a)
            obj.permission = array;
            obj.d = a;
        end
        function draw_light(obj)
            if isequal(obj.permission,[1 0 1 0])
                   plot([obj.d,obj.d],[obj.d,obj.d],'o','MarkerSize',6,'MarkerFaceColor','r');hold on;
                   plot([-obj.d,-obj.d],[-obj.d,-obj.d],'o','MarkerSize',6,'MarkerFaceColor','r');hold on;
                   plot([obj.d,obj.d],[-obj.d,-obj.d],'o','MarkerSize',6,'MarkerFaceColor','g');hold on;
                   plot([-obj.d,-obj.d],[obj.d,obj.d],'o','MarkerSize',6,'MarkerFaceColor','g');hold on;
               elseif isequal(obj.permission,[0 0 0 0])
                   plot([obj.d,obj.d],[obj.d,obj.d],'o','MarkerSize',6,'MarkerFaceColor','y');hold on;
                   plot([-obj.d,-obj.d],[-obj.d,-obj.d],'o','MarkerSize',6,'MarkerFaceColor','y');hold on;
                   plot([obj.d,obj.d],[-obj.d,-obj.d],'o','MarkerSize',6,'MarkerFaceColor','y');hold on;
                   plot([-obj.d,-obj.d],[obj.d,obj.d],'o','MarkerSize',6,'MarkerFaceColor','y');hold on;
               elseif isequal(obj.permission,[0 1 0 1])
                   plot([obj.d,obj.d],[obj.d,obj.d],'o','MarkerSize',6,'MarkerFaceColor','g');hold on;
                   plot([-obj.d,-obj.d],[-obj.d,-obj.d],'o','MarkerSize',6,'MarkerFaceColor','g');hold on;
                   plot([obj.d,obj.d],[-obj.d,-obj.d],'o','MarkerSize',6,'MarkerFaceColor','r');hold on;
                   plot([-obj.d,-obj.d],[obj.d,obj.d],'o','MarkerSize',6,'MarkerFaceColor','r');hold on;
              end
    end
    end
end

