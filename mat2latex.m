% This converts a matrix to latex printout.
% Usage:
% mat2latex(x) for a decimal output
% mat2latex(sym(x)) for an output with symbols

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
% matches 'word' and '(w + o / r - d)'
s = regexprep(s, "(?<num>([\w]+)|(\(\w[\w\(\)+-*/ ]+\)))\^\(1/2\)", "\\sqrt{$1}");
% format exponential
s = regexprep(s, "\^\(([0-9a-zA-Z/]+)\)", "\^{$1}"); 
% format fraction
s = regexprep(s, "(?<num>([\w]+)|(\(\w[\w\(\)+-*/ ]+\)))/(?<num>([\w]+)|(\(\w[\w\(\)+-*/ ]+\)))", "\\frac{$1}{$2}");




