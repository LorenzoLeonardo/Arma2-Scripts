_plane = _this select 0;
_height = _this select 1;

_plane setpos [(getpos _plane select 0),(getpos _plane select 1),_height];
_plane flyInHeight _height;


While{alive _plane} do {
_diff = (_plane getposASL select 2) - (_plane getPos select 2);
_plane flyInHeight (_height - _diff);
sleep 0.25;
};