function varargout = gmm(X, K_or_centroids)
% ============================================================
% Expectation-Maximization iteration implementation of
% Gaussian Mixture Model.
%
% PX = GMM(X, K_OR_CENTROIDS)
% [PX MODEL] = GMM(X, K_OR_CENTROIDS)
%
%  - X: N-by-D data matrix.
%  - K_OR_CENTROIDS: either K indicating the number of
%       components or a K-by-D matrix indicating the
%       choosing of the initial K centroids.
%
%  - PX: N-by-K matrix indicating the probability of each
%       component generating each point.
%  - MODEL: a structure containing the parameters for a GMM:
%       MODEL.Miu: a K-by-D matrix.
%       MODEL.Sigma: a D-by-D-by-K matrix.
%       MODEL.Pi: a 1-by-K vector.
% ============================================================
 
    threshold = 1e-15;
    [N, D] = size(X);
 
    if isscalar(K_or_centroids)
        K = K_or_centroids;
        % randomly pick centroids
        rndp = randperm(N);
        centroids = X(rndp(1:K), :);
        
    else
        K = size(K_or_centroids, 1);
        centroids = K_or_centroids;
    end
 
    % initial values
    [pMiu pPi pSigma] = init_params();
    
%     pMiu =[335.254288385067,122.435757271933,103.882030141887;318.838300078019,121.012188781857,95.4134197400687;333.836696126883,142.414577488409,74.0513816973287];
%     pPi = [0.554973821989529,0.240837696335079,0.204188481675393];
% pSigma(:,:,1) = [1223,129,-2109;129,1120,-425;-2109,-425,4561];
% 
% pSigma(:,:,2) = [1705,341,-1954;341,1144,-652;-1954,-652,4287];
% pSigma(:,:,3) = [424,-20,7;-20,1272,146;7,146,588];

    %[pMiu pPi pSigma] = initEM(X,K);


 
    Lprev = -inf;
    while true
        %Px = calc_prob();
        Px = calcPosterior(X,6,pMiu,pSigma);
        % new value for pGamma
        %pGamma = Px .* repmat(pPi, N, 1)
        pGamma = repmat(pPi, N, 1) .* Px;
%         prodM = size(Px);
%         for i = 1:N
%             for j = 1:K
%                 prodM(i,j) = pPi(j) * Px(i,j);
%             end
%         end
        
        pGamma = pGamma ./ repmat(sum(pGamma, 2), 1, K);
%         
%         pGa = size(X);
%         pDenominator = sum(prodM, 2);
%         
%         for i = 1:N
%             for j = 1:K
%                 pGa(i,j) = prodM(i,j) / pDenominator(i);
%             end
%         end 



        % new value for parameters of each Component
        Nk = sum(pGamma);
        pMiu = diag(1./Nk) * pGamma' * X;
        pPi = Nk/N;
%         
%         temp = 1./Nk;
%         transG = pGamma';
%         for i = 1:K
%             for j = 1:N
%                 res(i,j) = temp(i) * transG(i,j);
%             end
%         end
%         pMiu1 = res *X ;
%         pMiu;
                    


        for k = 1:K
            Xshift = X-repmat(pMiu(k, :), N, 1);
            
            pSigma(:,:,k) = (Xshift' * diag(pGamma(:, k))*Xshift) / Nk(k);
        end
        
        
        % check for convergence
        L = sum(log(Px*pPi'));
        if L-Lprev < threshold
            break;
        end
      
        Lprev = L;
    end

    if nargout == 1
        varargout = {Px};
    else
        model = [];
        model.Miu = pMiu;
        model.Sigma = pSigma;
        model.Pi = pPi;
        varargout = {Px, model};
    end
 
    function [pMiu pPi pSigma] = init_params()
        pMiu = centroids;
        pPi = zeros(1, K);
        pSigma = zeros(D, D, K);
 
        % hard assign x to each centroids
        distmat = repmat(sum(X.*X, 2), 1, K) + ...
            repmat(sum(pMiu.*pMiu, 2)', N, 1) - ...
            2*X*pMiu';
%         sumA = sum(X.*X, 2);
%         sumB = sum(pMiu.*pMiu, 2)';
%         sumM = size(X);
% 
%         for idx = 1:N
%             for j = 1:D 
%                sumM(idx,j) =  sumA(idx) + sumB(j);
%             end
%         end
         
%         distmat1 = sumM - 2*X*pMiu'
        %repmat(sum(pMiu.*pMiu, 2)', N, 1)
        [dummy labels] = min(distmat, [], 2);
        
        for k=1:K
            Xk = X(labels == k, :);
            pPi(k) = size(Xk, 1)/N;
            pSigma(:, :, k) = cov(Xk);
        end
    end
 
    function Px = calc_prob()
        Px = zeros(N, K);
        for k = 1:K
            
            Xshift = subtractVec(X,pMiu(k,:));
            inv_pSigma = inv(pSigma(:, :, k));
            tmp = sum((Xshift*(inv(pSigma(:, :, k)))) .* Xshift, 2);
            coef = (2*pi)^(-D/2) * sqrt(det(inv_pSigma));
            Px(:, k) = coef * exp(-0.5*tmp);
        end
    end
end