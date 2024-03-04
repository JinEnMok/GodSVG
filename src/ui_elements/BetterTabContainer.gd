## A TabContainer that automatically localizes tab titles.
class_name BetterTabContainer extends TabContainer

var tab_keys: Array[String]

# Localize tab titles.
func _ready() -> void:
	for i in get_tab_count():
		tab_keys.append(get_tab_title(i))
	# Awaiting fixes a bug that causes spacing between the tabbar and the content. 
	await get_tree().process_frame
	translate_titles()

func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSLATION_CHANGED:
		translate_titles()


func translate_titles() -> void:
	for i in tab_keys.size():
		set_tab_title(i, tr(tab_keys[i]))
