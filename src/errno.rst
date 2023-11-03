Errno Return Types
******************

This patch is split into different parts, each serving specific purposes. It ensures that functions
that have int return type always return well defined values and not return values that are returned
by other functions.

If a function returns a value that is returned by another function, it is non-deterministic in the
value it returns because the other function may change while the documentation for your function
remains unmodified. This leads to discrepancy in expected behavior.

Instead, functions should always return well defined error codes.

- Rule "correct exists": This rule searches for 'return' statements that are followed by a constant
  that matches the regular expression ^E[A-Z]+, meaning the constant starts with "E" followed by one
  or more uppercase letters. It doesn't make any changes to the code but records the position of
  these 'return' statements as 'p'.

- Rule "r2 exists": This rule searches for 'return' statements in positions that are different from
  the positions found in the "correct exists" rule (as indicated by p != correct.p). These 'return'
  statements must return an expression 'E' that is not zero. The rule doesn't specify any code
  transformations but is focused on identifying these 'return' patterns and their locations. The
  expression 'E' and its non-zero condition could be part of a logic that the rule is interested in
  verifying or capturing for potential use or analysis in subsequent rules.

- Rule "r1 exists": This rule is also focused on 'return' statements at positions different from
  those identified in the "correct exists" and "r2 exists" rules. These 'return' statements must
  involve the returning of a constant integer 'R' that is not zero. Like the previous rules, this
  one doesn't specify changes but identifies these particular return statements and their positions.

