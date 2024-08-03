class_name MainMap extends Node2D


var _plugin_name = "QRCodeAndroid"
var _android_plugin


func _ready() -> void:
	if Engine.has_singleton(_plugin_name):
		_android_plugin = Engine.get_singleton(_plugin_name)
		_android_plugin.qrdata.connect(_on_拿到扫描数据)
	else:
		print("QRCodeAndroid插件加载失败")



func _on_button_button_down() -> void:
	print("---------------------------------")
	if OS.get_name() == "Android":
		var e = OS.request_permissions()
		print(e)
	if _android_plugin:
		var a = _android_plugin.getQRCodeAndroid()
		print(a)

func _on_拿到扫描数据(data):
	print("**************************************")
	print(data)
