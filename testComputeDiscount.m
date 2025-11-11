function tests = testComputeDiscount
%TESTCOMPUTEDISCOUNT Unit tests for computeDiscount
tests = functiontests(localfunctions);
end

function testGoldMember(testCase)
% Covers gold path without bonus
actPrice = computeDiscount(200, "gold", false, false);
expPrice = 200 * (1 - 0.2);
verifyEqual(testCase, actPrice, expPrice);
end

function testSilverMember(testCase)
% Covers silver path without bonus
actPrice = computeDiscount(100, "silver", false, false);
expPrice = 100 * (1 - 0.1);
verifyEqual(testCase, actPrice, expPrice);
end

function testNonMemberWithCoupon(testCase)
% Covers 'else' membership path and hasCoupon condition
% amount <= 500 → (amount > 500) is false, but hasCoupon = true triggers bonus
actPrice = computeDiscount(400, "none", true, true);
expPrice = 400 * (1 - 0.1);
verifyEqual(testCase, actPrice, expPrice);
end
