function [C] = ensurePSD(C)
  %ensurePSD Ensures the covariance matrix is positive semi-definite
  % The code ensures that all the eigenvalues are at least a little greater than
  %zero
  % Choose a small number for the threshold
  thrsh = 0.001;
  [U,L] = eig(C);
  L = diag(L);
  L = max(L,thrsh);
  L = diag(L);
  C = U*L*U';
end