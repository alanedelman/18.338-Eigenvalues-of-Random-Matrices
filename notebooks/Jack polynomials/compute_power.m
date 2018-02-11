function Po = compute_power(B)
%% This function return the P_\kappa(B) in power sum basis
p = @(A, k) trace(A^k);
for  i = 1:6,
    eval(['p', num2str(i), '=p(B, ', num2str(i), ');']);
end

%% po is the basis in the power basis (consistent with dominance order)
Po = [p6; p5 * p1; p4 * p2; p4 * p1^2; p3^2; 
    p3*p2*p1; p3*p1^3; p2^3; p2^2 * p1^2; p2 * p1^4; p1^6];
end