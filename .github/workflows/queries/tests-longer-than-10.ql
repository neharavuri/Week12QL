/**
 * @description Find all tests longer than 10 lines
 * @kind problem
 * @id javascript/tests-longer-than-10
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTestLongerThan10(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    it.getArgument(1).getNumLines() >= 10 and
    test = it.getArgument(1)
  )
}

from Function function
where isTestLongerThan10(function) and
select function, "is a test"