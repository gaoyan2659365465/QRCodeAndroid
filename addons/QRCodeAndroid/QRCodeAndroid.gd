@tool
extends EditorPlugin

var export_plugin : AndroidExportPlugin



func _enter_tree() -> void:
	export_plugin = AndroidExportPlugin.new()
	add_export_plugin(export_plugin)


func _exit_tree() -> void:
	remove_export_plugin(export_plugin)
	export_plugin = null


class AndroidExportPlugin extends EditorExportPlugin:
	var _plugin_name = "QRCodeAndroid"
	
	func _supports_platform(platform):
		if platform is EditorExportPlatformAndroid:
			return true
		return false
	
	func _get_android_libraries(platform, debug):
		if debug:
			return PackedStringArray([
			"QRCodeAndroid/qrcodeandroid-debug.aar"])
		else:
			return PackedStringArray([
			"QRCodeAndroid/qrcodeandroid-release.aar"])
	
	func _get_android_dependencies(platform: EditorExportPlatform, debug: bool) -> PackedStringArray:
		return PackedStringArray(["androidx.core:core-ktx:1.13.1",
		"androidx.appcompat:appcompat:1.7.0",
		"com.google.android.material:material:1.12.0",
		"com.journeyapps:zxing-android-embedded:4.3.0",])
	
	func _get_android_dependencies_maven_repos(platform: EditorExportPlatform, debug: bool) -> PackedStringArray:
		return PackedStringArray([
			"https://jitpack.io",
		])
	
	func _get_android_manifest_application_element_contents(platform: EditorExportPlatform, debug: bool) -> String:
		return """
		"""
	
	func _get_android_manifest_element_contents(platform: EditorExportPlatform, debug: bool) -> String:
		return """
		<uses-permission android:name="android.permission.CAMERA" />
		<uses-permission android:name="android.permission.INTERNET" />
		<uses-permission android:name="android.permission.VIBRATE" />
		<uses-permission android:name="android.permission.FLASHLIGHT" />
	"""
	
	func _get_name():
		return _plugin_name
	
