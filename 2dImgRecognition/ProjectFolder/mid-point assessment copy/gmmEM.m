function varargout = gmm(dataM, components)
    threshold = 1e-15;
    [N, D] = size(dataM);
 
    if isscalar(components)
        K = components;
        % randomly pick centroids
        rndp = randperm(N);
        centroids = dataM(rndp(1:K), :);
        
    else
        K = size(components, 1);
        centroids = components;
    end
 
    % initial values
    %[pMiu pPi pSigma] = init_params()
    
%     pMiu =[335.254288385067,122.435757271933,103.882030141887;318.838300078019,121.012188781857,95.4134197400687;333.836696126883,142.414577488409,74.0513816973287];
%     pPi = [0.554973821989529,0.240837696335079,0.204188481675393];
% pSigma(:,:,1) = [1223,129,-2109;129,1120,-425;-2109,-425,4561];
% 
% pSigma(:,:,2) = [1705,341,-1954;341,1144,-652;-1954,-652,4287];
% pSigma(:,:,3) = [424,-20,7;-20,1272,146;7,146,588];

    [pMiu,pPi,pSigma] = initEM(dataM,components);


 
    Lprev = -inf;
    while true
        Px = calcPosterior(dataM,components,pMiu,pSigma);
        prodM = size(Px);
        %pGa = coe * N(x|pMu(k),pSig(k))  
        for i = 1:N
            for j = 1:K
                prodM(i,j) = pPi(j) * Px(i,j);%numerator
            end
        end       
        pGa = size(dataM);%Likelihood function
        pDenominator = sum(prodM, 2);%Denominator of likelihood F
        
        for i = 1:N
            for j = 1:K
                pGa(i,j) = prodM(i,j) / pDenominator(i);
            end
        end 
      
        Nk = sum(pGa, 1);
        pPi = Nk/N;         
        temp = 1./Nk;
        transG = pGa';
        for i = 1:K
            for j = 1:N
                res(i,j) = temp(i) * transG(i,j);
            end
        end
        pMiu = res *dataM ;

        for k = 1:K
            Xshift = dataM-repmat(pMiu(k, :), N, 1);
            
            pSigma(:,:,k) = ensurePSD((Xshift' * diag(pGa(:, k))*Xshift) / Nk(k));
           
        end
 
        % convergence
        L = sum(log(Px*pPi'));
        if L-Lprev < threshold
            break;
        end
        Lprev = L;
    end
 
    if nargout == 1
        varargout = {Px};
    end
end