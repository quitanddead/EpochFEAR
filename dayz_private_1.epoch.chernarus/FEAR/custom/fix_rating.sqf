while {alive player} do
{
    if (rating player < 0) then {
        player addRating abs(rating player);
    };
    sleep 1;
};