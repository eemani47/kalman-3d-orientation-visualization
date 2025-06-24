function angle = kalman_roll(acc, gyro)
persistent P angle_est
Q = 0.01; R = 0.1; dt = 0.01;
if isempty(P), P = 1; angle_est = 0; 
end

acc_angle = atan2(acc(2), acc(3));         
angle_est = angle_est + gyro(1) * dt;      
P = P + Q;

K = P / (P + R);                            
angle_est = angle_est + K * (acc_angle - angle_est);
P = (1 - K) * P;

angle = angle_est;