function drawroads(d)
% this func() draws the road, as well as the traffic lights according to the
% parameters the user entered.

% plot the edge of the roads
xlim([-10 10]),ylim([-10,10]);
plot([d,10],[d,d],'k','LineWidth',2);axis off;box off;hold on;
plot([d d],[d 10],'k','LineWidth',2),hold on;
plot([-d -d],[d 10],'k','LineWidth',2),hold on;
plot([-d -10],[d d],'k','LineWidth',2),hold on;
plot([-d -d],[-d -10],'k','LineWidth',2),hold on;
plot([-d -10],[-d -d],'k','LineWidth',2),hold on;
plot([d 10],[-d -d],'k','LineWidth',2),hold on;
plot([d d],[-d -10],'k','LineWidth',2),hold on;

% plot the middle line of the roads
plot([d,10],[0 0],'k--'),hold on;
plot([0 0],[d 10],'k--'),hold on;
plot([-d -10],[0 0],'k--'),hold on;
plot([0 0],[-d -10],'k--'),hold on;

end