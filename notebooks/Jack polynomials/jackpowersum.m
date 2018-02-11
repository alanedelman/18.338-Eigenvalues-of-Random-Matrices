% this mat file saves the upper and lower triangular matrix
load upperlowermatrix6;

%% compute the Jack polynomials
% compute_power is a function that gives P_\kappa(A) in power sum basis
Jack = @(A) upper6 * lower6 * compute_power(A)/720;

n = 6; % matrix size thus the symmetric polynomials live in a vector space of dimension 11
t = 3000; % number of trials

A = diag(rand(n,1));
B = diag(rand(n,1));

L = lower6; % P -> M (Power sum to Monomials)
U = upper6; % M -> J (Monomials to Jack functions)

D = diag(Jack(B)./Jack(eye(n))); % ``eigenvalue''

%% veriy the formular that Jack works
% E_Q[J(Q'AQB)] = D * J(A)
v = zeros(11, t); %LHS
for i = 1:t
    [Q, ~] = qr(randn(n));
    v(:,i) = Jack(Q' * A * Q * B);
end

[mean(v')', D * Jack(A)]

%% the answer is correct!
%   229.2511  229.0105
%    39.8162   39.7712
%    13.9076   13.8911
%     5.9602    5.9580
%     8.9769    8.9660
%     2.6038    2.6037
%     0.7206    0.7211
%     1.1799    1.1807
%     0.4124    0.4129
%     0.0632    0.0633
%     0.0033    0.0033
%%---------------------------------------------------------

%% verify the dense matrix works
% E_Q[P(Q'AQB)] = (L^{-1} * U^{-1} * D * U * L) P(A)
PA = compute_power(A);
LB = L\(U\D*U)*L; % the dense matrix that represents L_B

for i = 1:t
    [Q, ~] = qr(randn(n));
    v(:,i) = compute_power(Q' * A * Q * B);
end

[mean(v')', LB * PA]
%% the answer is correct
%     0.0167    0.0162
%     0.0484    0.0472
%     0.0353    0.0344
%     0.1457    0.1425
%     0.0323    0.0315
%     0.1117    0.1094
%     0.4640    0.4553
%     0.0936    0.0917
%     0.3896    0.3825
%     1.6260    1.6003
%     6.8097    6.7182