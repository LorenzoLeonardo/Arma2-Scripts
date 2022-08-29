_plane = _this select 0;
_height = _this select 1;

_plane setVelocity [(vectorDir _plane select 0)*40,(vectorDir _plane select 1)*40,(vectorDir _plane select 2)*40];


_plane setpos [(getpos _plane select 0),(getpos _plane select 1),_height];
_plane flyInHeight _height;


While{alive _plane} do {
_diff = (_plane getposASL select 2) - (_plane getPos select 2);
_plane setpos [(getpos _plane select 0),(getpos _plane select 1),_height - _diff];
_plane flyInHeight (_height - _diff);
sleep 0.5;
};