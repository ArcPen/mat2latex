% This converts a matrix to latex printout.
function s = mat2latex(x)
format rat;
[vert, hori] = size(x);
s = "\left(\begin{matrix} ";
for i = 1:vert
    for j = 1:hori-1
        s = s + string(x(i,j)) + "&";
    end
    s = s + string(x(i,hori)) + " \\ ";
end
s = s+"\end{matrix}\right)";

% fromat \sqrt
s = regexprep(s, "([\w\(\)+])\^\(1/2\)", "\\sqrt{$1}");
% format exponential
s = regexprep(s, "\^\(([0-9a-zA-Z/]+)\)", "\^{$1}"); 
% format fraction
s = regexprep(s, "(\d)/(\d)", "\\frac{$1}{$2}");
