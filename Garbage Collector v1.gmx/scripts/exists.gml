var _data = argument0;
///TODO: this can break??!
var _type = get_type(_data);
switch _type{
    case radtype.list:
    case radtype.map:
    case radtype.grid:
    case radtype.queue:
    case radtype.stack:
    case radtype.priority:
        return ds_exists(_data,_type);
    case radtype.surface:
        return surface_exists(_data);
    case radtype.buffer:
        return buffer_exists(_data);
}
return false;
