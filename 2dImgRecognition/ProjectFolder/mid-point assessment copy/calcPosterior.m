function pos = calcPosterior(dataMatrix,Components,mu,seg)
%Basd on posterior equation
    [eleNum, featureNum] = size(dataMatrix);
    pos = zeros(eleNum, Components);
    for idx = 1:Components
    
        shift = subtractVec(dataMatrix,mu(idx,:));
        tmep = sum((shift*(inv(seg(:, :, idx)))) .* shift, 2);
        coe = (2*pi)^(-featureNum/2) * sqrt(det(inv(seg(:, :, idx))));
        pos(:, idx) = coe * exp(-0.5*tmep);
    end
end