function c = addtVec(dataMatrix,vec)
    [C,R] = size(dataMatrix);
    [D,T] = size(vec);
    c = zeros(size(dataMatrix));
    for i = 1:C
        for j = 1:T
            c(:,j) = dataMatrix(:,j) + vec(j);
        end
    end
end