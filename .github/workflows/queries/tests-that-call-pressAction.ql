/**
 * @description Find all tests that call pressAction
 * @kind problem
 * @id javascript/tests-that-call-pressAction
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTestThatPressesActionKey(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test.getName().include("pressActionKey") and
    test = it.getArgument(1)
  )
}

from Function function
where isTestThatPressesActionKey(function)
select function, "is a test that calls pressAction"