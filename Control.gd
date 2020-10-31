extends Control

const HttpUtil = preload('res://HttpUtil.gd')

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var http_util = HttpUtil.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var state = _read_state()
	$VBoxContainer/HBoxContainer/LineEdit.text = state.url

func _read_state():
	var f = File.new()
	var err = f.open('user://state.json', File.READ)
	if err == OK:
		var state_json = f.get_as_text()
		f.close()
		var json := JSON.parse(state_json)
		if json.error == OK:
			return json.result
		else:
			print('Error parsing json: %s' % [json])

	return {
		url='https://example.com'
	}

func _save_state(state):
	var f = File.new()
	f.open('user://state.json', File.WRITE)
	var state_json = JSON.print(state)
	f.store_string(state_json)
	f.close()

func _on_Button_pressed():
	msg('')
	var url = $VBoxContainer/HBoxContainer/LineEdit.text
	_save_state({url=url})
	var http = HTTPRequest.new()
	add_child(http)
	http.use_threads = true
	var expr := RegEx.new()
	expr.compile('://([^/]+)')
	var m := expr.search(url)
	print(m)
	var hostname = m.strings[1]

	IP.clear_cache(hostname)
	var err = http.connect('request_completed', self, '_result', ['http get', http])
	assert(err == OK)
	err = http.request(url, [], true, HTTPClient.METHOD_GET)
	if err != OK:
		http.queue_free()
		# err is a global Error not HTTPClient.RESULT
		msg('Error sending request to %s: %s' % [url, err])
	IP.clear_cache(hostname)
	var ip = {
		any = IP.resolve_hostname(hostname, IP.TYPE_ANY),
		ipv4 = IP.resolve_hostname(hostname, IP.TYPE_IPV4),
		ipv6 = IP.resolve_hostname(hostname, IP.TYPE_IPV6),
		none = IP.resolve_hostname(hostname, IP.TYPE_NONE)
	}
	msg('resolve_hostname(%s)' % [hostname])
	for k in ip:
		msg('\t%s : %s' % [k, ip[k]])

func msg(message):
	$VBoxContainer/RichTextLabel.text += '\n' + message

func _result(param1=null, param2=null, param3=null, param4=null, param5=null, param6=null, param7=null):
	var results := [param1, param2, param3, param4, param5, param6, param7]
	while len(results) && results.back() == null:
		results.pop_back()
	var child = results.pop_back()
	var type = results.pop_back()
	child.queue_free()
	msg('%s: \t%s' % [type, PoolStringArray(results).join('\n\t')])

func _on_Button2_pressed():
	OS.set_clipboard($VBoxContainer/RichTextLabel.text)
