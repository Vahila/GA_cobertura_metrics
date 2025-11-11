function price = computeDiscount(amount, membership, isFestival, hasCoupon)
%COMPUTEDISCOUNT Compute discount based on membership type and special conditions.
%
%   price = computeDiscount(amount, membership, isFestival, hasCoupon)
%
%   amount       - numeric, purchase amount (must be > 0)
%   membership   - string, "gold", "silver", or "none"
%   isFestival   - logical, true if festival period
%   hasCoupon    - logical, true if user has a coupon
%
%   This function introduces composite conditions for MC/DC coverage.

if amount <= 0
    error('Amount must be positive');
end

% Membership-based base discount
if membership == "gold"
    discount = 0.2;
elseif membership == "silver"
    discount = 0.1;
else
    discount = 0.05;
end

% Extra discount: (amount > 500 && isFestival) || hasCoupon
if (amount > 500 && isFestival) || hasCoupon
    discount = discount + 0.05;
end

% Cap discount at 30%
if discount > 0.3
    discount = 0.3;
end

% Final price
price = amount * (1 - discount);
end