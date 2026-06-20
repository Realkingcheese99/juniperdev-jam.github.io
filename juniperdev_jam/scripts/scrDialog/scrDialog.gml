function createDialog(_dialog)
{
	if (instance_exists(objDialog)) return;
	
	var _inst = instance_create_depth(0, 0, 0, objDialog);
	_inst.dialog = _dialog;
	_inst.page = 0;
}