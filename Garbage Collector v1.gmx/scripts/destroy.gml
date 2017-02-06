var _data = argument[0];
var recurse_mode = 0;//0 no recurse; 1 recurse; 2 radrecurses
if argument_count>1{recurse_mode = argument[1];}

switch get_type(_data){
    case radtype.list:
        ds_list_destroy(_data);break;
    case radtype.stack:
        ds_stack_destroy(_data);break;
    case radtype.queue:
        ds_queue_destroy(_data);break;
    case radtype.grid:
        ds_grid_destroy(_data);break;
    case radtype.priority:
        ds_priority_destroy(_data);break;
    case radtype.map:
        ds_map_destroy(_data);break;
    case radtype.surface:
        surface_free(_data);break;
    case radtype.buffer:
        buffer_delete(_data);break;
    default:
        show_error("tried to destroy unsupported radtype", false);
}
