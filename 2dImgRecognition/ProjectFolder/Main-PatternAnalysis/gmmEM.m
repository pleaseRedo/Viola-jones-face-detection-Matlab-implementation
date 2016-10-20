% This code is referenced from http://blog.pluskid.org/?p=39
% Original author: pluskid
% Date: 2009-02-02
% This program has been completely reformed in order to meet cw standard
function Px = gmm(dataM, components)
    threshold = 1e-15;
    [N, D] = size(dataM);
 

    [pMiu,pPi,pSigma] = initEM(dataM,components);
    Lprev = -inf;
    while true
        Px = calcPosterior(dataM,components,pMiu,pSigma);
        prodM = size(Px);
        %pGa = coe * N(x|pMu(k),pSig(k))  
        for i = 1:N
            for j = 1:components
                prodM(i,j) = pPi(j) * Px(i,j);%numerator
            end
        end       
        pGa = size(dataM);%Likelihood function
        pDenominator = sum(prodM, 2);%Denominator of likelihood F
        
        for i = 1:N
            for j = 1:components
                pGa(i,j) = prodM(i,j) / pDenominator(i);
            end
        end 
      
        Nk = sum(pGa, 1);
        pPi = Nk/N;         
        temp = 1./Nk;
        transG = pGa';
        for i = 1:components
            for j = 1:N
                res(i,j) = temp(i) * transG(i,j);
            end
        end
        pMiu = res *dataM ;

        for k = 1:components
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
end