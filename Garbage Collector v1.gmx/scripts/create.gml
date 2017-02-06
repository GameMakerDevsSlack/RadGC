var _type = argument[0];
var _life = undefined;
var _data = undefined;
var _ext_args = 0;
switch _type{
    case radtype.list:
        _data = ds_list_create();break;
    case radtype.stack:
        _data = ds_stack_create();break;
    case radtype.queue:
        _data = ds_queue_create();break;
    case radtype.priority:
        _data = ds_priority_create();break;
    case radtype.grid:
        _ext_args = 2;
        _data = ds_grid_create(argument[1],argument[2]);break;
    case radtype.map:
        _data = ds_map_create();break;
    case radtype.surface:
        _ext_args = 2;
        _data = surface_create(argument[1],argument[2]);break;
    case radtype.buffer:
        _ext_args = 3;
        _data = buffer_create(argument[1],argument[2],argument[3]);break;
    default:
        show_debug_message("tried to create unsupported radtype");
}
_data +=(_type*.01);

if argument_count>_ext_args+1 and oRadGC.active == true{
    _life = argument[_ext_args+1];
    switch(_life){
        case oRadGC.STEP:
            var arr;
            arr[0] = _data;
            arr[1] = object_get_name(object_index);
            ds_list_add(oRadGC.steplife,arr);break;
        case oRadGC.OBJECT:
            var arr;
            arr[0] = _data;
            arr[1] = id;
            arr[2] = object_get_name(object_index);
            ds_list_add(oRadGC.objectlife,arr);break;
        case oRadGC.ROOM:
            var arr;
            arr[0] = _data;
            arr[1] = object_get_name(object_index);
            ds_list_add(oRadGC.roomlife,arr);break;
        case oRadGC.GAME:
            ds_list_add(oRadGC.gamelife,_data);break;
    }
    return _data;
}

return _data;
