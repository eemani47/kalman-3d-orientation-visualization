function angle = kalman_yaw(gyro)
persistent angle_est
dt = 0.01;
if isempty(angle_est), angle_est = 0; end

angle_est = angle_est + gyro(3) * dt;
angle = angle_est;